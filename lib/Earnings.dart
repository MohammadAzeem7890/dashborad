import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/ChartController.dart';
import 'package:project2/EarningController.dart';
import 'package:charts_flutter/flutter.dart' as Chart;
import 'package:project2/GrapTest.dart';

class Earnings extends StatelessWidget {
  final earningController = Get.put(EarningsController());
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {

            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
          ),
          title:Text(
            "Checkout",
            style: TextStyle(color: Colors.black),
          ),
        bottom: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black26,
          controller: earningController.tabController,
          indicatorColor: Colors.red,
          labelStyle: TextStyle(color: Colors.black, fontSize: 15),
          onTap: (index) {
            // Tab index when user select it, it start from zero
          },
          tabs: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text("Day"),
            ),
            Text("Week"),
          ],
        ),
      ),
      body: TabBarView(
        controller: earningController.tabController,
        children: [
          Day(),
          Week(),
        ],
      ),
    );
  }
}

//**************************************************************
// this is tab1... earnings in a day

class Day extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.18 : Get.height * 0.3,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: heading("16March 2021"),
                    ),
                    Text("£0.00", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              gap(),
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.27 : Get.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading("Order Earning".toUpperCase()),
                    receipt("Item Price", "+0.00"),
                    receipt("Tax Price", "+0.00"),
                    receipt("Order Price", "0.00"),
                    receipt("Admin Profit", "-0.00"),
                    receipt("Store Profit", "0.00"),
                  ],
                ),
              ),
              gap(),
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.24 : Get.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading("Store Transactions".toUpperCase()),
                    receipt("Receive Order Payment", "+0.00"),
                    receipt("Paid Service Payment", "+0.00"),
                    receipt("Deducted from Wallet", "0.00"),
                    receipt("Added in Wallet", "-0.00"),
                  ],
                ),
              ),
              gap(),
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.17 : Get.height * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading("Payment".toUpperCase()),
                    receipt("Total Earning", "+0.00"),
                    receipt("Paid in Wallet", "+0.00"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pay to Store", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                        Text("0.00", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
              Table(
                // columnWidths: {
                //   1: FractionColumnWidth(0.5)
                // },
                border: TableBorder.all(color: Colors.black45),
                children: [
                  TableRow(
                    children: [
                      tableCell("Total Order", "1", orientation),
                      tableCell("Total Item Sold", "3", orientation),
                    ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Accepted Order", "1", orientation),
                        tableCell("Accepted Ratio", "100.0%", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Rejected Order", "0", orientation),
                        tableCell("Rejected Ratio", "0.00%", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Completed Order", "0", orientation),
                        tableCell("Completed Ratio", "0.00%", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Cancelled Order", "0", orientation),
                        tableCell("Cancelled Ratio", "0.00%", orientation),
                      ]
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

//******************************************************************

// this is tab2... earning in a week

class Week extends StatelessWidget {
  final chartController = Get.put(ChartController());
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.18 : Get.height * 0.3,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: heading("16March 2021 - 23March 2021"),
                    ),
                    Text("£0.00", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              PrimaryChart(),
              gap(),
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.27 : Get.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading("Order Earning".toUpperCase()),
                    receipt("Item Price", "+0.00"),
                    receipt("Tax Price", "+0.00"),
                    receipt("Order Price", "0.00"),
                    receipt("Admin Profit", "-0.00"),
                    receipt("Store Profit", "0.00"),
                  ],
                ),
              ),
              gap(),
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.24 : Get.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading("Store Transactions".toUpperCase()),
                    receipt("Receive Order Payment", "+0.00"),
                    receipt("Paid Service Payment", "+0.00"),
                    receipt("Deducted from Wallet", "0.00"),
                    receipt("Added in Wallet", "-0.00"),
                  ],
                ),
              ),
              gap(),
              Container(
                height: orientation == Orientation.portrait ? Get.height * 0.17 : Get.height * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading("Payment".toUpperCase()),
                    receipt("Total Earning", "+0.00"),
                    receipt("Paid in Wallet", "+0.00"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pay to Store", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                        Text("0.00", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
              Table(
                // columnWidths: {
                //   1: FractionColumnWidth(0.5)
                // },
                border: TableBorder.all(color: Colors.black45),
                children: [
                  TableRow(
                      children: [
                        tableCell("Total Order", "1", orientation),
                        tableCell("Total Item Sold", "3", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Accepted Order", "1", orientation),
                        tableCell("Accepted Ratio", "100.0%", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Rejected Order", "0", orientation),
                        tableCell("Rejected Ratio", "0.00%", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Completed Order", "0", orientation),
                        tableCell("Completed Ratio", "0.00%", orientation),
                      ]
                  ),
                  TableRow(
                      children: [
                        tableCell("Cancelled Order", "0", orientation),
                        tableCell("Cancelled Ratio", "0.00%", orientation),
                      ]
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}


//**************************************************
// widgets

Widget heading(text){
  return Text(text, style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),);
}
Widget receipt(title, price){
  return Container(
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: Colors.black),),
        Text(price, style: TextStyle(color: Colors.black),)
      ],
    ),
  );
}
Widget gap(){
  return Divider(color: Colors.black26, thickness: 1.5,);
}
Widget tableCell(title, price, orientation){
  return Container(
    height: orientation == Orientation.portrait ? Get.height * 0.1 : Get.height * 0.2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(price, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
        Text(title, style: TextStyle(color: Colors.black),),
      ],
    ),
  );
}