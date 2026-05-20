import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'device_model.g.dart';

@HiveType(typeId: 0)
class DeviceModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String macAddress;
  @HiveField(3)
  String ipAddress;
  @HiveField(4)
  String broadcastAddress;
  @HiveField(5)
  int port;
  @HiveField(6)
  int shutdownPort;
  @HiveField(7)
  String lastKnownStatus;
  @HiveField(8)
  bool forceOffline;
  @HiveField(9)
  bool wolEnabled;
  @HiveField(10)
  String token;
  @HiveField(11)
  String? subnetMask;

  DeviceModel({
    String? id,
    required this.name,
    required this.macAddress,
    required this.ipAddress,
    required this.broadcastAddress,
    this.port = 9,
    this.shutdownPort = 8080,
    this.lastKnownStatus = 'offline',
    this.forceOffline = false,
    this.wolEnabled = false,
    this.token = '',
    this.subnetMask,
  }) : id = id ?? const Uuid().v4();
}
