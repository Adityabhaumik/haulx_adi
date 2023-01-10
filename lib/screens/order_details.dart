import 'package:assignment_haulx/dummy_data.dart';
import 'package:assignment_haulx/models/order_id_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  static const id = "OrderDetails";

  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OrderIdentificationModels;
    var dataList = args.isDilivered ? deliveredData : inTransitData;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 35.0,
        title: const Text(
          "Load #4",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
          height: screenSize.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 250,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 0.08, //extend the shadow
                      offset: Offset(
                        -1.0, // Move to right 5  horizontally
                        2.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                  color: Colors.white,
                  // border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "₹ 200.0",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Pick Up Location",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                  Text(
                                    dataList[args.idx][1] ?? "Drop Location",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Drop Location",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                  Text(
                                    dataList[args.idx][2] ?? "Drop Location",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 100,
                            width: 75,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))))
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Order ID",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "4",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Pickup Date",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "30-DEC-22",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Pickup Time",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "14:20",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Quantity of Load",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "600.0 Ton",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Assigned Vehicles",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Choose trucks and drivers from your fleet to assign to\nthe journey",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const TrucksTile(number: "DL12345", driverName: "Johnny Does"),
              const SizedBox(
                height: 5,
              ),
              const TrucksTile(number: "DL12345", driverName: "Sharvai Patil"),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  primary: Colors.black87,
                  minimumSize: Size(screenSize.width, 50),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                onPressed: () {},
                child: const Text('+ Assign Vehicle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrucksTile extends StatelessWidget {
  const TrucksTile({Key? key, required this.number, required this.driverName})
      : super(key: key);

  final String number;
  final String driverName;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: 75,
      width: screenSize.width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 0.08, //extend the shadow
            offset: Offset(
              -1.0, // Move to right 5  horizontally
              2.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        color: Colors.white,
        // border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Assignment 1",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: 20,
                width: 75,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    "Delivered",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Assigned Truck",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    number,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 20,
                color: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Assigned Truck",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    driverName,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
