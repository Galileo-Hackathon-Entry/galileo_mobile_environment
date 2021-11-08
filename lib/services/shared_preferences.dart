
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  final String _userAccountId = "userAccountId";
  final String _userRoleId = "userRoleId";
  final String _gameGroupId = "gameGroupId";
  final String _userName = "userName";
  final String _notificationToken = "notificationToken";
  final String _isLoggedIn = "isLoggedIn";
  final String _firstName = "firstName";
  final String _lastName = "lastName";

  //#region Setter

  setUserAccountId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_userAccountId, data);
  }

  setUserRoleId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_userRoleId, data);
  }

  setGameGroupId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_gameGroupId, data);
  }

  setUsername(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userName, data);
  }

  setNotificationToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_notificationToken, data);
  }

  setIsLoggedIn(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isLoggedIn, data);
  }

  setFirstName(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_firstName, data);
  }

  setLastName(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_firstName, data);
  }

  //#endregion

  //#region Getter
  Future<int> getUserAccountId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userAccountId);
  }

  Future<int> getUserRoleId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userRoleId);
  }

  Future<int> getGameGroupId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_gameGroupId);
  }

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }

  Future<String> getNotificationToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_notificationToken);
  }

  Future<bool> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedIn);
  }

  Future<String> getFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_firstName);
  }

  Future<String> getLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastName);
  }
  //#endregion
}
