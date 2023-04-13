import 'dart:async';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Global/Models/user_data_model.dart';
import '../Global/Models/user_tokens_model.dart';

class UserStoreController extends GetxController {
  UserStoreController();

  late Box _storage;
  // static UserStoreController get to => Get.find();

  Future<void> saveUserData(final UserDataModel userData) async {
    _storage = await Hive.openBox<UserDataModel>('userdata');
    try {
      await _storage.clear();
    } catch (_) {}
    _storage = await Hive.openBox<UserDataModel>('userdata');
    await _storage.add(userData);
    await _storage.close();
  }
  Future<void> saveUserTokens(final UserTokensModel userTokens) async {
    _storage = await Hive.openBox<UserTokensModel>('userTokens');
    try {
      await _storage.clear();
    } catch (_) {}
    _storage = await Hive.openBox<UserTokensModel>('userTokens');
    await _storage.add(userTokens);
    await _storage.close();
  }

  Future<UserDataModel?> getUserData() async {
    _storage = await Hive.openBox<UserDataModel>('userdata');
    try {
      return _storage.values.first;
    } catch (e) {
      return null;
    }
    // final tokenJson = _storage.values.first;
    // if (tokenJson == null) return null;
    // return UserTokensModel.fromJson(tokenJson);
  }
  Future<UserTokensModel?> getUserTokens() async {
    _storage = await Hive.openBox<UserTokensModel>('userTokens');
    try {
      return _storage.values.first;
    } catch (e) {
      return null;
    }
  }
  void removeData() async {
    _storage = await Hive.openBox<UserDataModel>('userdata');
    await _storage.clear();
    _storage = await Hive.openBox<UserTokensModel>('userTokens');
    await _storage.clear();
    await _storage.close();
  }

  @override
  void dispose() {
    try {
      _storage.close();
    } catch (_) {}
    super.dispose();
  }
}
