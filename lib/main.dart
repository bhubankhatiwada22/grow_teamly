import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktaktoe/App/route_app.dart';
import 'package:tiktaktoe/App/route_handeler.dart';
import 'package:tiktaktoe/constants/app_constant.dart';
import 'package:tiktaktoe/homepage.dart';
import 'package:tiktaktoe/injector.dart';
import 'package:tiktaktoe/loginpage.dart';
import 'package:tiktaktoe/providers/authprovider.dart';
import 'package:tiktaktoe/providers/counter_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  String? token =
      locator.get<SharedPreferences>().getString(AppConstants.token);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => Authprovider()),
    ],
    child: TestApp(
      token: token,
    ),
  ));
}

class TestApp extends StatelessWidget {
  final String? token;
  const TestApp({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "grow teamly",
      onGenerateRoute: RouteHandeler.generateRoute,
      initialRoute: token!=null?AppRoutes.homeRoute:AppRoutes.loginRoute,
      home: token != null ? Homepage() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
