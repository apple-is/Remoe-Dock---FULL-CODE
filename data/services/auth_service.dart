class AuthService {
  // Simplified service - no authentication, just basic device info
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;
    _isInitialized = true;
  }

  static Future<bool> isDeviceSecure() async {
    await initialize();

    // Basic device integrity check
    try {
      // For now, just return true since we removed device_info_plus dependency
      return true;
    } catch (e) {
      return false;
    }
  }
}
