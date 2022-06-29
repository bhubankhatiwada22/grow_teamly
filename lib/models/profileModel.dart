class ProfileModel {
  String? fullname;
  String? email;
  String? phonenumber;
  String? supervisorname;
  String? dateofbirth;
  ProfileModel(this.fullname, this.email, this.phonenumber, this.supervisorname,
      this.dateofbirth);
  ProfileModel.fromjson(Map<String, dynamic> json) {
    fullname = json['data']['full_name'];
    email = json['data']['email'];
    phonenumber = json['data']['mobile_number'];
    supervisorname = json['data']['parent_user']['full_name'];
    dateofbirth = json['data']['dob'];
  }
}
