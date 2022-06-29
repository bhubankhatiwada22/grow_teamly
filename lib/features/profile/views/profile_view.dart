import 'package:flutter/material.dart';
import 'package:tiktaktoe/App/route_app.dart';
import 'package:tiktaktoe/features/profile/services/peofile_servce.dart';
import 'package:tiktaktoe/image_constants.dart';
import 'package:tiktaktoe/models/dummy_page_model.dart';
import 'package:tiktaktoe/models/profileModel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileModel? profileModel;
  bool isLoadoing = true;
  @override
  void initState() {
    super.initState();
    initialFunction();
  }

  initialFunction() async {
    profileModel = await ProfileServices().fetchProfile();

    isLoadoing = false;
    if(mounted)setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: isLoadoing
            ? CircularProgressIndicator()
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ClipOval(
                        child: Image.network(
                      ImageConstants.dog,
                      height: 70,
                    )),
                    Text(
                      profileModel?.fullname ?? "",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      profileModel?.dateofbirth ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.dummyRoute,
                              arguments: DummyPageModel(
                                  name: "hello", address: "brt", age: 20));
                        },
                        child: Text("Navigate"))
                  ],
                ),
              ));
  }
}
