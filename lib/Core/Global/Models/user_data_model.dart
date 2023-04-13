import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'user_data_model.g.dart';

@HiveType(typeId: 1)
class UserDataModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final DateTime? createDate;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final Uint8List? image;
  @HiveField(5)
  final String? bio;
  @HiveField(6)
  final String? fName;
  @HiveField(7)
  final String? lName;
  @HiveField(8)
  final String? city;
  @HiveField(9)
  final String? state;
  @HiveField(10)
  final String? country;
  @HiveField(11)
  final String? gender;
  @HiveField(12)
  final DateTime? birthday;
  @HiveField(13)
  final String? imageLink;

  UserDataModel({
    this.id,
    this.username,
    this.createDate,
    this.phone,
    this.image,
    this.bio,
    this.fName,
    this.lName,
    this.city,
    this.state,
    this.country,
    this.gender,
    this.birthday,
    this.imageLink,
  });

  factory UserDataModel.fromJson(Map data) {
    return UserDataModel(
      id: data['user'],
      username: data['user_name'],
      // createDate: DateTime.parse(data['create_date']),
      // phone: data['phone'].toString(),
      bio: data['bio'],
      fName: data['first_name'],
      lName: data['last_name'],
      city: data['city'],
      state: data['state'],
      country: data['country'],
      gender: data['gender'],
      imageLink: data['image'],
    );
  }
}
