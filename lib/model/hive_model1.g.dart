// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModel1Adapter extends TypeAdapter<HiveModel1> {
  @override
  final int typeId = 0;

  @override
  HiveModel1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModel1(
      name: fields[0] as String?,
      author: fields[1] as String?,
      imgurl: fields[2] as String?,
      title: fields[3] as String?,
      desc: fields[4] as String?,
      content: fields[5] as String?,
      url: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModel1 obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.imgurl)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.desc)
      ..writeByte(5)
      ..write(obj.content)
      ..writeByte(6)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModel1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
