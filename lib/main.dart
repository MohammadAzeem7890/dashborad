import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Earnings.dart';


void main() => runApp(EarningDashboard());

class EarningDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Earnings(),
    );
  }
}
