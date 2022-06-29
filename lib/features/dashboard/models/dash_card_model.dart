class DashboardCardModel {
  int? myMissingCheckoutCount;
  int? myGhostCount;
  int? myLeaveBalance;
  int? myNoDailyUpdate;
  String? myNotAcknowledged;

  DashboardCardModel({
    required this.myMissingCheckoutCount,
    required this.myGhostCount,
    required this.myLeaveBalance,
    required this.myNoDailyUpdate,
    required this.myNotAcknowledged,
  });
  DashboardCardModel.fromJson(Map<String, dynamic> json) {
    myMissingCheckoutCount = json['my_missing_checkout_count'];
    myGhostCount = json['my_ghost_count'];
    myLeaveBalance = json['my_leave_balance_count'];
    myNoDailyUpdate = json['my_no_dailyUpdates_count'];
    myNotAcknowledged = json['my_not_acknowledge_dailyUpdates_count'];
  }
}
