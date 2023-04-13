// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataModelAdapter extends TypeAdapter<UserDataModel> {
  @override
  final int typeId = 1;

  @override
  UserDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataModel(
      id: fields[0] as int?,
      username: fields[1] as String?,
      createDate: fields[2] as DateTime?,
      phone: fields[3] as String?,
      image: fields[4] as Uint8List?,
      bio: fields[5] as String?,
      fName: fields[6] as String?,
      lName: fields[7] as String?,
      city: fields[8] as String?,
      state: fields[9] as String?,
      country: fields[10] as String?,
      gender: fields[11] as String?,
      birthday: fields[12] as DateTime?,
      imageLink: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.createDate)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.bio)
      ..writeByte(6)
      ..write(obj.fName)
      ..writeByte(7)
      ..write(obj.lName)
      ..writeByte(8)
      ..write(obj.city)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.gender)
      ..writeByte(12)
      ..write(obj.birthday)
      ..writeByte(13)
      ..write(obj.imageLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
