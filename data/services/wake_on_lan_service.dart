import 'dart:io';
import 'package:wake_on_lan/wake_on_lan.dart';
import 'package:path_provider/path_provider.dart';

class WakeOnLanService {
  static final List<String> _memoryLogs = [];

  Future<void> _log(String message) async {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '[$timestamp] $message\n';
    print(message);

    // Store in memory for easy access
    _memoryLogs.add(logMessage);
    if (_memoryLogs.length > 500) {
      _memoryLogs.removeAt(0); // Keep last 500 lines
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      final logFile = File('${directory.path}/wol_debug.log');
      await logFile.writeAsString(logMessage,
          mode: FileMode.append, flush: true);
    } catch (e) {
      // Ignore logging errors
    }
  }

  static String getLogs() {
    return _memoryLogs.join('\n');
  }

  static void clearLogs() {
    _memoryLogs.clear();
  }

  Future<bool> sendWakeOnLan({
    required String macAddress,
    required String broadcastAddress,
    int port = 9,
  }) async {
    try {
      await _log('=== WakeOnLAN Debug ===');
      await _log('Original MAC: "$macAddress"');
      await _log('Broadcast: $broadcastAddress');
      await _log('Port: $port');

      // Enhanced MAC address cleaning and validation
      // Remove all non-hex characters (colons, dashes, dots, spaces)
      final clean =
          macAddress.trim().replaceAll(RegExp(r'[:\-\.\s]'), '').toUpperCase();
      await _log('Cleaned MAC: "$clean" (length: ${clean.length})');

      // Validate it's all hex characters
      if (!RegExp(r'^[0-9A-F]+$').hasMatch(clean)) {
        await _log('❌ Invalid characters in MAC address: $macAddress');
        return false;
      }

      if (clean.length != 12) {
        await _log(
            '❌ Invalid MAC address length: $macAddress (cleaned: $clean, length: ${clean.length}, expected: 12)');
        await _log('Expected format: AA:BB:CC:DD:EE:FF or AABBCCDDEEFF');
        return false;
      }

      // Validate broadcast address
      if (!_isValidBroadcastAddress(broadcastAddress)) {
        await _log('Invalid broadcast address: $broadcastAddress');
        return false;
      }

      await _log(
          '✅ Sending Wake-on-LAN packet to $clean at $broadcastAddress:$port');

      // Format MAC address with colons for the library (50:EB:F6:20:1B:80) in lowercase
      final formattedMac = clean.toLowerCase().replaceAllMapped(
            RegExp(r'(.{2})(?!$)'),
            (match) => '${match.group(1)}:',
          );
      await _log('Formatted MAC for library: $formattedMac');

      // Send multiple Wake-on-LAN packets for reliability
      bool success = false;
      for (int i = 0; i < 3; i++) {
        try {
          await _log('Sending packet ${i + 1}/3...');
          await WakeOnLAN(IPAddress(broadcastAddress), MACAddress(formattedMac),
                  port: port)
              .wake();
          success = true;
          await _log('✅ Packet ${i + 1} sent successfully');

          // Small delay between packets
          if (i < 2) {
            await Future.delayed(const Duration(milliseconds: 100));
          }
        } catch (e) {
          await _log('❌ Packet ${i + 1} failed: $e');
        }
      }

      if (success) {
        await _log('✅ Wake-on-LAN packets sent successfully');
        return true;
      } else {
        await _log('❌ All Wake-on-LAN packets failed');
        // Try raw UDP fallback
        return await _sendRawWolPacket(clean, broadcastAddress, port);
      }
    } catch (e) {
      await _log('❌ Wake-on-LAN failed: $e');
      return false;
    }
  }

  // Raw UDP fallback implementation
  Future<bool> _sendRawWolPacket(
      String macAddress, String broadcastAddress, int port) async {
    try {
      await _log('🔄 Trying raw UDP fallback...');

      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

      // Create magic packet: 6 bytes of FF followed by 16 repetitions of MAC address
      final macBytes = _hexToBytes(macAddress);
      final packet = List<int>.filled(102, 0);

      // First 6 bytes are FF
      for (int i = 0; i < 6; i++) {
        packet[i] = 0xFF;
      }

      // Repeat MAC address 16 times
      for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 6; j++) {
          packet[6 + (i * 6) + j] = macBytes[j];
        }
      }

      await _log('Magic packet created: ${packet.length} bytes');
      await _log(
          'Packet hex: ${packet.map((b) => b.toRadixString(16).padLeft(2, '0')).join(':')}');

      // Send packet multiple times
      final addr = InternetAddress(broadcastAddress);
      for (int i = 0; i < 10; i++) {
        socket.send(packet, addr, port);
        await _log(
            'Sent raw UDP packet ${i + 1}/10 to $broadcastAddress:$port');
        await Future.delayed(const Duration(milliseconds: 50));
      }

      socket.close();
      await _log('✅ Raw UDP packet sent successfully');
      return true;
    } catch (e) {
      await _log('❌ Raw UDP fallback failed: $e');
      return false;
    }
  }

  List<int> _hexToBytes(String hex) {
    final result = <int>[];
    for (int i = 0; i < hex.length; i += 2) {
      result.add(int.parse(hex.substring(i, i + 2), radix: 16));
    }
    return result;
  }

  bool _isValidBroadcastAddress(String address) {
    try {
      final addr = InternetAddress(address);
      return addr.type == InternetAddressType.any ||
          address.endsWith('.255') ||
          address == '255.255.255.255';
    } catch (e) {
      return false;
    }
  }

  // Enhanced method for worldwide access
  Future<bool> sendWakeOnLanWorldwide({
    required String macAddress,
    required String publicIp,
    required String subnetMask,
    int port = 9,
  }) async {
    try {
      // Calculate broadcast address from public IP and subnet mask
      final broadcast = _calculateBroadcastAddress(publicIp, subnetMask);

      await _log('Worldwide Wake-on-LAN: $macAddress -> $broadcast:$port');

      // Try multiple ports for better compatibility
      final ports = [port, 7, 9];
      for (final p in ports) {
        await _log('Trying port $p...');
        final result = await sendWakeOnLan(
          macAddress: macAddress,
          broadcastAddress: broadcast,
          port: p,
        );
        if (result) {
          await _log('✅ Success on port $p');
          return true;
        }
      }

      await _log('❌ All ports failed');
      return false;
    } catch (e) {
      await _log('Worldwide Wake-on-LAN failed: $e');
      return false;
    }
  }

  String _calculateBroadcastAddress(String ip, String mask) {
    try {
      final ipParts = ip.split('.').map((e) => int.parse(e)).toList();
      final maskParts = mask.split('.').map((e) => int.parse(e)).toList();

      final broadcast =
          List.generate(4, (i) => ipParts[i] | (~maskParts[i] & 0xFF));

      return broadcast.join('.');
    } catch (e) {
      // Fallback to common broadcast addresses
      if (ip.startsWith('192.168.1.')) return '192.168.1.255';
      if (ip.startsWith('192.168.0.')) return '192.168.0.255';
      if (ip.startsWith('10.0.0.')) return '10.0.0.255';
      return '255.255.255.255'; // Universal fallback
    }
  }
}
