// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tokens_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTokensModelAdapter extends TypeAdapter<UserTokensModel> {
  @override
  final int typeId = 0;

  @override
  UserTokensModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTokensModel(
      token: fields[0] as String?,
      refreshToken: fields[1] as String?,
      isRegisterDone: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserTokensModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.isRegisterDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTokensModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
