import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowMessageCompanent {
  final String? message;
  final Color? color;
  final int? duration;

  ShowMessageCompanent({this.message, this.color, this.duration});

  void show() {
    Fluttertoast.showToast(msg: message ?? '');
  }
}
