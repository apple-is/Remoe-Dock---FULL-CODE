import 'package:hive_flutter/hive_flutter.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkSecurityService {
  static const String _keyAllowedNetworks = 'allowed_networks';
  static const String _keyNetworkSecurityEnabled = 'network_security_enabled';

  static bool _isInitialized = false;
  static Set<String> _allowedNetworks = {};
  static bool _networkSecurityEnabled = true;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Load saved settings from Hive
      final settingsBox = Hive.box('settings');
      _networkSecurityEnabled =
          settingsBox.get(_keyNetworkSecurityEnabled, defaultValue: true);
      final savedNetworks =
          settingsBox.get(_keyAllowedNetworks, defaultValue: <String>[]);
      _allowedNetworks = Set<String>.from(savedNetworks);

      // If no networks saved, add current network
      if (_allowedNetworks.isEmpty) {
        final currentNetwork = await getCurrentNetworkInfo();
        if (currentNetwork != null) {
          _allowedNetworks.add(currentNetwork);
          await saveAllowedNetworks();
        }
      }

      _isInitialized = true;
    } catch (e) {
      _isInitialized = true; // Still mark as initialized to prevent loops
    }
  }

  static Future<bool> isNetworkSecurityEnabled() async {
    await initialize();
    return _networkSecurityEnabled;
  }

  static Future<void> setNetworkSecurityEnabled(bool enabled) async {
    await initialize();
    _networkSecurityEnabled = enabled;
    await _saveNetworkSecurityEnabled();
  }

  static Future<String?> getCurrentNetworkInfo() async {
    try {
      final info = NetworkInfo();
      final wifiName = await info.getWifiName();
      final wifiIP = await info.getWifiIP();

      if (wifiIP != null) {
        // Extract network segment (e.g., 192.168.1 from 192.168.1.100)
        final parts = wifiIP.split('.');
        if (parts.length >= 3) {
          return '${parts[0]}.${parts[1]}.${parts[2]}';
        }
      }

      return wifiName;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isCurrentNetworkAllowed() async {
    // Allow access from anywhere - remote access enabled
    return true;
  }

  static Future<void> addCurrentNetworkToAllowed() async {
    await initialize();
    final currentNetwork = await getCurrentNetworkInfo();
    if (currentNetwork != null) {
      _allowedNetworks.add(currentNetwork);
      await saveAllowedNetworks();
    }
  }

  static Future<void> removeAllowedNetwork(String network) async {
    await initialize();
    _allowedNetworks.remove(network);
    await saveAllowedNetworks();
  }

  static Future<void> saveAllowedNetworks() async {
    try {
      final settingsBox = Hive.box('settings');
      await settingsBox.put(_keyAllowedNetworks, _allowedNetworks.toList());
    } catch (e) {
      // Ignore storage errors
    }
  }

  static Future<void> _saveNetworkSecurityEnabled() async {
    try {
      final settingsBox = Hive.box('settings');
      await settingsBox.put(
          _keyNetworkSecurityEnabled, _networkSecurityEnabled);
    } catch (e) {
      // Ignore storage errors
    }
  }

  static Set<String> get allowedNetworks => _allowedNetworks;

  static Future<bool> validateIPAddress(String ipAddress) async {
    if (!_networkSecurityEnabled) return true;

    try {
      final parts = ipAddress.split('.');
      if (parts.length != 4) return false;

      for (final part in parts) {
        final num = int.tryParse(part);
        if (num == null || num < 0 || num > 255) return false;
      }

      // Check if IP is in private range
      final firstOctet = int.parse(parts[0]);
      final secondOctet = int.parse(parts[1]);

      // 10.0.0.0/8
      if (firstOctet == 10) return true;

      // 172.16.0.0/12
      if (firstOctet == 172 && secondOctet >= 16 && secondOctet <= 31) {
        return true;
      }

      // 192.168.0.0/16
      if (firstOctet == 192 && secondOctet == 168) return true;

      // 127.0.0.0/8 (localhost)
      if (firstOctet == 127) return true;

      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> isSecureConnection(String ipAddress, int port) async {
    // Validate IP address first
    if (!await validateIPAddress(ipAddress)) {
      return false;
    }

    // Check if port is in secure range (avoid common ports that might be exposed)
    if (port < 1024 || port > 65535) {
      return false;
    }

    // Additional checks could be added here
    return true;
  }

  static Future<void> resetToCurrentNetwork() async {
    await initialize();
    _allowedNetworks.clear();
    await addCurrentNetworkToAllowed();
  }
}
