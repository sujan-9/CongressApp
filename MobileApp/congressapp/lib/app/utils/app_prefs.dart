import 'package:congressapp/app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  AppPreference(this.sharedPreferences);

  // Future<String> getAppLanguage() async {
  //   String? language =
  //       sharedPreferences.getString(AppConstants.prefsKeyLanguage);
  //   if (language != null && language.isNotEmpty) {
  //     return language;
  //   } else {
  //     return LanguageType.english.getValue();
  //   }
  // }

  Future<String?> getAccessToken() async {
    String? accessToken = sharedPreferences.getString(AppConstants.accessToken);
    return accessToken;
  }

  Future<bool?> removeAccessToken() async {
    return sharedPreferences.remove(AppConstants.accessToken);
  }

  Future<void> saveAccessToken(String accessToken) async {
    sharedPreferences.setString(AppConstants.accessToken, accessToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    sharedPreferences.setString(AppConstants.refreshToken, refreshToken);
  }

  Future<void> saveCurrentUserName(String userName) async {
    sharedPreferences.setString(AppConstants.userName, userName);
  }

  Future<void> saveCurrentLoginEmail(String loginEmail) async {
    sharedPreferences.setString(AppConstants.currentLoginEmail, loginEmail);
  }

  Future<void> saveAccessTokenExpireIn(int expireIn) async {
    sharedPreferences.setInt(AppConstants.accessTokenExpireIn, expireIn);
  }

  Future<void> saveUserID(String userID) async {
    sharedPreferences.setString(AppConstants.userID, userID);
  }

  Future<void> saveLoginAtInSeconds(int seconds) async {
    sharedPreferences.setInt(AppConstants.loginAt, seconds);
  }

  Future<void> saveCurrentLoginPhone(String loginPhone) async {
    sharedPreferences.setString(AppConstants.currentLoginPhone, loginPhone);
  }

  Future<String?> getCurrentUserName() async {
    return sharedPreferences.getString(AppConstants.userName);
  }

  Future<void> saveCurrentLoginPassword(String password) async {
    sharedPreferences.setString(AppConstants.currentLoginPassword, password);
  }

  Future<String> getCurrentLoginEmail() async {
    return sharedPreferences.getString(AppConstants.currentLoginEmail) ??
        AppConstants.empty;
  }

  Future<String> getCurrentLoginPassword() async {
    return sharedPreferences.getString(AppConstants.currentLoginPassword) ??
        AppConstants.empty;
  }

  Future<String?> getRefreshToken() async {
    String? refreshToken =
        sharedPreferences.getString(AppConstants.refreshToken);
    return refreshToken;
  }

  Future<int> getAccessTokenExpireIn() async {
    return sharedPreferences.getInt(AppConstants.accessTokenExpireIn) ??
        AppConstants.zero;
  }

  Future<int> getLoginAt() async {
    return sharedPreferences.getInt(AppConstants.loginAt) ?? 0;
  }

  Future<bool> getIsOnboarded() async {
    return sharedPreferences.getBool(AppConstants.isOnboarded) ?? false;
  }

  Future<void> saveIsOnboarded(bool isOnboarded) async {
    sharedPreferences.setBool(AppConstants.isOnboarded, isOnboarded);
  }

  Future<void> clearPrefs() async {
    //but not isFirstOnboarded flag
    final isFirstOnboarded = await getIsOnboarded();
    sharedPreferences.clear();
    await saveIsOnboarded(isFirstOnboarded);
  }
}
