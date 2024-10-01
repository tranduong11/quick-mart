// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemCartAdapter extends TypeAdapter<ItemCart> {
  @override
  final int typeId = 1;

  @override
  ItemCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemCart(
      images: fields[0] as String?,
      title: fields[1] as String?,
      price: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemCart obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.images)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCartAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
