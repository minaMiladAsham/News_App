import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sp;

  static init() async {sp = await SharedPreferences.getInstance();}

  static Future<bool> putBoolean ({required String key , required bool value}) async{
    return await sp!.setBool(key, value);
  }

  static bool? getBoolean({required String key}){
    return sp!.getBool(key);
  }
}