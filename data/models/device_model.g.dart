part of 'device_model.dart';

class DeviceModelAdapter extends TypeAdapter<DeviceModel> {
  @override
  final int typeId = 0;

  @override
  DeviceModel read(BinaryReader reader) {
    final f = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < f; i++) reader.readByte(): reader.read()
    };
    return DeviceModel(
      id: fields[0] as String,
      name: fields[1] as String,
      macAddress: fields[2] as String,
      ipAddress: fields[3] as String,
      broadcastAddress: fields[4] as String,
      port: fields[5] as int,
      shutdownPort: fields[6] as int,
      lastKnownStatus: fields[7] as String,
      forceOffline: fields[8] as bool? ?? false,
      wolEnabled: fields[9] as bool? ?? false,
      token: fields[10] as String? ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, DeviceModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.macAddress)
      ..writeByte(3)
      ..write(obj.ipAddress)
      ..writeByte(4)
      ..write(obj.broadcastAddress)
      ..writeByte(5)
      ..write(obj.port)
      ..writeByte(6)
      ..write(obj.shutdownPort)
      ..writeByte(7)
      ..write(obj.lastKnownStatus)
      ..writeByte(8)
      ..write(obj.forceOffline)
      ..writeByte(9)
      ..write(obj.wolEnabled)
      ..writeByte(10)
      ..write(obj.token);
  }
}
