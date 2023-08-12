import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  late SharedPreferences instance;

  final String _loggedInString = "loggedIn";
  final String _token = "token";

  /// Initializes the SharedPreferences instance for managing cache.
  Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  /// Sets the login status in the cache.
  Future<void> setLoggedIn([bool state = true]) async {
    await instance.setBool(_loggedInString, state);
  }

  /// Sets the user token in the cache.
  Future<void> setToken(String token) async {
    await instance.setString(_token, token);
  }

  /// Retrieves the user token from the cache.
  String? getToken() {
    return instance.getString(_token);
  }

  /// Retrieves the login status from the cache.
  /// Returns true if the user is logged in, false otherwise.
  bool getLoggedIn() {
    return instance.getBool(_loggedInString) ?? false;
  }

  /// Logs the user out by removing the token and login status from the cache.
  Future<void> logout() async {
    await instance.remove(_token);
    await instance.remove(_loggedInString);
  }
}
