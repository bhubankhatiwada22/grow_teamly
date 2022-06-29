// import 'package:flutter/material.dart';
import 'dart:developer';

class LoginRosponseModel{
  String? Status;
  String? message;
  String? data ;
  LoginRosponseModel(this.Status,this.data,this.message);
  LoginRosponseModel.fromjson(Map<String, dynamic>json){
    
    data=json['data'];
    Status=json['status'];
    message=json['message'];
  }
}