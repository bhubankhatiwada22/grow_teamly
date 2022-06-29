import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktaktoe/App/route_app.dart';
import 'package:tiktaktoe/constants/app_constant.dart';
import 'package:tiktaktoe/helpers/snack.dart';
import 'package:tiktaktoe/homepage.dart';
import 'package:tiktaktoe/image_constants.dart';
import 'package:tiktaktoe/models/loginresponsemodel.dart';
import 'package:tiktaktoe/services.dart/authservices.dart';

import 'injector.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormkey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _loginFormkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      ImageConstants.applogo,
                      height: 100,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.length < 10) {
                          return "invalid number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          hintText: "phone number",
                          border: OutlineInputBorder(),
                          labelText: "phone number",
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      validator: (value) {
                        if (value == null) {
                          return "enter password";
                        } else if (value.length < 8) {
                          return "pass must b greater than 8";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "password",
                          labelText: "password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.fingerprint),
                          suffixIcon: GestureDetector(
                            child: Icon(Icons.visibility),
                            onLongPressStart: (val) {
                              setState(() {
                                _isObscure = false;
                              });
                            },
                            onLongPressEnd: (val) {
                              setState(() {
                                _isObscure = true;
                              });
                            },
                          )
                          //   suffixIcon: IconButton(
                          //    onPressed: (){
                          //     setState(() {
                          //       _isObscure=!_isObscure;
                          //     });

                          //    },
                          //    icon: Icon(
                          //      _isObscure? Icons.remove_red_eye:Icons.visibility_off),
                          //  ),
                          ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoding = true;
                          });
                          if (_loginFormkey.currentState!.validate()) {
                            Authservices authservices = Authservices();
                            LoginRosponseModel? response =
                                await authservices.login(_phoneController.text,
                                    _passwordController.text);
                            if (response == null) {
                              AppSnackbar.showSnackbar(context,
                                  message: "no response from server");
                            } else if (response.data != null) {
                              locator.get<SharedPreferences>().setString(
                                  AppConstants.token, response.data!);
                              AppSnackbar.showSnackbar(context,
                                  message: "login in successfully");
                              // ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("login ${response.data}"),
                              // duration: Duration(seconds: 10),
                              // ));
                              Navigator.pushNamedAndRemoveUntil(
                                  context, AppRoutes.homeRoute, (route) => false);
                              //   Navigator.pushAndRemoveUntil(
                              //       context,
                              //       CupertinoPageRoute(
                              //           builder: (context) => Homepage()),
                              //       (route) => false);
                              // } else {
                              AppSnackbar.showSnackbar(context,
                                  message: "login in failed");
                            }
                          }
                        },
                        child: Text("Login")),
                  ],
                ),
              ),
            ),
          ),
          if (isLoding)
            Center(
              child: CircularProgressIndicator(),
            )
        ]),
      ),
    );
  }
}
