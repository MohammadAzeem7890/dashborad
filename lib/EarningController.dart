import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningsController extends GetxController with SingleGetTickerProviderMixin{
  TabController tabController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
}