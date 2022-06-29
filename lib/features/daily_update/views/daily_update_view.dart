import 'package:flutter/material.dart';
import 'package:tiktaktoe/features/daily_update/model/daily_update_model.dart';
import 'package:tiktaktoe/features/daily_update/services/daily_update_services.dart';

class DailyUpdateView extends StatefulWidget {
  const DailyUpdateView({Key? key}) : super(key: key);

  @override
  State<DailyUpdateView> createState() => _DailyUpdateViewState();
}

class _DailyUpdateViewState extends State<DailyUpdateView> {
  List<DAilyUpdateModel> dailyUpdates = [];
  bool _isLoadaing = true;

  @override
  void initState() {
    super.initState();
    getfetchDailyUpdates();
  }

  getfetchDailyUpdates() async {
    DailyUpdateServices dailyUpdate = DailyUpdateServices();
    dailyUpdates = await dailyUpdate.fetchDailyUpdates();
    _isLoadaing = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("dailyUpdate"),
        ),
        body: _isLoadaing
            ? const CircularProgressIndicator()
            : ListView.separated(
              separatorBuilder: (BuildContext context, int index)=> const Divider(),
                itemCount: dailyUpdates.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(dailyUpdates[index].title??""),
                    subtitle: Text(dailyUpdates[index].description??""),
                  );
                },
              ));
  }
}
