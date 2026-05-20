import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/constants/app_constants.dart';
import '../models/device_model.dart';
import '../services/device_status_service.dart';

class DeviceProvider extends ChangeNotifier {
  final Box<DeviceModel> _devicesBox = Hive.box<DeviceModel>(AppConstants.devicesBox);
  final DeviceStatusService _status = DeviceStatusService();
  final Map<String, bool> _statuses = {};

  List<DeviceModel> get devices => _devicesBox.values.toList();
  bool? getStatus(String id) => _statuses[id];

  void forceOffline(String id) {
    final d = _devicesBox.get(id);
    if (d != null) {
      d.forceOffline = true;
      d.lastKnownStatus = 'offline';
      d.save();
    }
    _statuses[id] = false;
    notifyListeners();
  }

  void addDevice(DeviceModel device) {
    _devicesBox.put(device.id, device);
    _check(device);
    notifyListeners();
  }

  Future<bool> updateDevice(DeviceModel device) async {
    _devicesBox.put(device.id, device);
    _check(device);
    notifyListeners();
    return true;
  }

  Future<bool> deleteDevice(String id) async {
    _devicesBox.delete(id);
    _statuses.remove(id);
    notifyListeners();
    return true;
  }

  DeviceModel? getDevice(String id) => _devicesBox.get(id);

  Future<void> checkAll() async {
    for (final d in devices) {
      await _check(d);
    }
  }

  Future<void> refresh(String id) async {
    final d = _devicesBox.get(id);
    if (d != null) await _check(d);
  }

  Future<void> _check(DeviceModel d) async {
    if (d.forceOffline) {
      _statuses[d.id] = false;
      notifyListeners();
      return;
    }
    final ok = await _status.isDeviceOnline(d.ipAddress);
    _statuses[d.id] = ok;
    d.lastKnownStatus = ok ? 'online' : 'offline';
    if (ok) d.forceOffline = false;
    d.save();
    notifyListeners();
  }
}
