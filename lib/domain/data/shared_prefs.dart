import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefs {
 static Future<void> initPrefs()async{
    await SharedPreferences.getInstance();
  }
}