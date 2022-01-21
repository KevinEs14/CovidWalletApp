// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  final int typeId = 0;

  @override
  CardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardModel(
      fullName: fields[0] as String,
      vaccine: fields[1] as String,
      doseDates: (fields[2] as List).cast<String>(),
      color: fields[3] as int,
      barCode: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.vaccine)
      ..writeByte(2)
      ..write(obj.doseDates)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.barCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
