class ServerRoutes {
  static const base = 'fitness.app';
  // static const base = 'develop.fitness.app';

  static const baseUrl = 'https://fitnessverse.iran.liara.run';
  // static const baseUrl = 'https://$base/api';

  static const socketAuth = 'https://$base/broadcasting/auth';
  static const socketAuthEndpoint = '/broadcasting/auth';

  static const login = '$baseUrl/account/token/';
  static const register = '$baseUrl/account/register/';
  static const registerVerify = '$baseUrl/account/activation/';
  static const forgetPass = '$baseUrl/account/reset_password/';
  static const resendCode = '$baseUrl/account/resend_activation/';
  static const changePassword = '$baseUrl/account/resend_activation/';
  static const logout = '$baseUrl/logout';
  static const test = '$baseUrl/test';
  static const refreshToken = '$baseUrl/token/refresh';
  static checkUsernameExists(String username) =>
      '$baseUrl/profile/check_user_name/$username/';
  static const getProfile = '$baseUrl/profile/me/';
  static const updateProfile = '$baseUrl/profile/update/';
  static const setPassword = '$baseUrl/account/change_password/';
  static const resetEmail = '$baseUrl/account/reset_email/';
  static const deleteAccount = '$baseUrl/account/delete/';
  static const deleteAccountVerify = '$baseUrl/account/delete_verify/';

  static const guide = '$baseUrl/config/guide/';
  static const role = '$baseUrl/config/rule/';
  static const updateInfo = '$baseUrl/config/update_info/';

  static const fitnessAdd = '$baseUrl/fitness/create/';
  static fitnessList(String page) => '$baseUrl/fitness/list/?page=$page';
  static fitnessDetails(String id) => '$baseUrl/fitness/detail/$id/';

  static const willAdd = '$baseUrl/will/create/';
  static willList(String page) => '$baseUrl/will/list/?page=$page';
  static willDetails(String id) => '$baseUrl/will/detail/$id/';

  static const friendAdd = '$baseUrl/friend/profile_create/';
  static friendList(String page, String id) =>
      '$baseUrl/friend/profile_list/$id/?page=$page';
  static friendDetails(String id) => '$baseUrl/friend/details/$id/';

  static const friendStroyAdd = '$baseUrl/friend/story_create/';
  static friendStroyList(String page, String id) =>
      '$baseUrl/friend/story_list/$id/?page=$page';
  static friendStroyDetails(String id) => '$baseUrl/friend/story_detail/$id/';

  static String getVideoes(String page, {String? filter, String? artistId}) {
    String url = '$baseUrl/videos?page=$page';
    if (filter != null) url += '&filters[name]=%$filter%';
    if (artistId != null) url += '&filters[artist_id]=$artistId';
    return url;
  }
}
