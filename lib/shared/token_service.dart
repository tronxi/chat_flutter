import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  late final Future<SharedPreferences> _prefs;

  TokenService._() {
    _prefs =  SharedPreferences.getInstance();
  }

  static final TokenService _instance = TokenService._();

  factory TokenService() {
    return _instance;
  }

  Future<void> save(String token) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }

  Future<String?> retrieve() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }

  Future<void> destroy() async {
    SharedPreferences prefs = await _prefs;
    await prefs.remove('token');
  }
}
