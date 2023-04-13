import 'package:hive/hive.dart';
part 'user_tokens_model.g.dart';

@HiveType(typeId: 0)
class UserTokensModel {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final String? refreshToken;
  @HiveField(2)
  final bool? isRegisterDone;

  UserTokensModel({
    this.token,
    this.refreshToken,
    this.isRegisterDone,
  });

  factory UserTokensModel.fromJson(
      String token, String refreshToken, bool isRegisterDone) {
    return UserTokensModel(
        token: token,
        refreshToken: refreshToken,
        isRegisterDone: isRegisterDone);
  }
}
