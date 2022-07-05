import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktaktoe/App/route_app.dart';
import 'package:tiktaktoe/features/dashboard/models/dash_card_model.dart';
import 'package:tiktaktoe/features/dashboard/services/dashboard_services.dart';
import 'package:tiktaktoe/features/dashboard/widgets/dashboard_card.dart';
import 'package:tiktaktoe/helpers/confornmationDialog.dart';
import 'package:tiktaktoe/injector.dart';
import 'package:tiktaktoe/loginpage.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardCardModel? dashboardCard;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDashboardCardData();
  }

  fetchDashboardCardData() async {
    DashboardCardModel? response =
        await DashboardServices().fetchDashboardCardData();

    dashboardCard = response;
    if(mounted)setState(() {});
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        actions: [
          IconButton(
              onPressed: () async {
                final bool isConformed = await getconformationDialog(context);
                if (isConformed) {
                  locator.get<SharedPreferences>().clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.loginRoute, (route) => false);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => LoginPage()),
                  //     (route) => false);
                }
                // showDialog(
                //     barrierDismissible: false,
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: Text("do you want to log out?"),
                //         content: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             TextButton(
                //               onPressed: () {
                //                 Navigator.pop(context);
                //               },
                //               child: Text("No"),
                //             ),
                //             TextButton(
                //               onPressed: () {

                //
                //               },
                //               child: Text("Yes"),
                //             ),
                //           ],
                //         ),
                //       );
                //     });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : dashboardCard == null
              ? const Center(child: Text("something went wrong"))
              : Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              SizedBox(
                height: 17,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardCard(
                    icon: Icon(Icons.check_box),
                    count: dashboardCard!.myLeaveBalance.toString(),
                    title: "My Missing leave",
                    containerColor: Colors.pink,
                  ),
                  DashboardCard(
                      icon: Icon(Icons.update),
                      count: dashboardCard!.myNoDailyUpdate.toString(),
                      title: "my no update",
                      containerColor: Colors.yellow),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardCard(
                    icon: Icon(Icons.settings),
                    count: dashboardCard!.myGhostCount.toString(),
                    title: "My ghost count",
                    containerColor: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DashboardCard(
                    icon: Icon(Icons.settings),
                    count: dashboardCard!.myNotAcknowledged.toString(),
                    title: "My not acknowledge",
                    containerColor: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                SizedBox(
                  width: 17,
                ),
                DashboardCard(
                  icon: Icon(Icons.check_box),
                  count: dashboardCard!.myLeaveBalance.toString(),
                  title: "My Missing CheckOut",
                  containerColor: Colors.blue,
                ),
              ])
            ]),
    );
  }
}
