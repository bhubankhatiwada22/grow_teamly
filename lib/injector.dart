import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
final locator=GetIt.instance;

setupLocator()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);
}