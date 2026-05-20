import 'package:dart_ping/dart_ping.dart';

class DeviceStatusService {
  Future<bool> isDeviceOnline(String ipAddress, {String? token}) async {
    try {
      // Allow remote access - just check if device is reachable
      final ping = Ping(ipAddress, count: 2, timeout: 3);
      final response = await ping.stream.first;

      return response.response != null;
    } catch (e) {
      return false;
    }
  }
}
