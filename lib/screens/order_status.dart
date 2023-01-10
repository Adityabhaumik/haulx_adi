import 'package:assignment_haulx/dummy_data.dart';
import 'package:assignment_haulx/models/order_id_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  static const id = "OrderStatus";

  const OrderStatus({Key? key}) : super(key: key);

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
          "Status of Load",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
          height: screenSize.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataList[args.idx][1] ?? "Pickup Location",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "address",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataList[args.idx][2] ?? "Drop Location",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "address",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const Text(
                "Truck and Driver\nDetails",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: screenSize.height * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Truck Number",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1234",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Driver Name",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "John Doe",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Driver Phone Number",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.call,
                              size: 15,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "6005536859",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Truck Status",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              TruckDriverDetailsTile(args: args, dataList: dataList)
            ],
          ),
        ),
      ),
    );
  }
}

class TruckDriverDetailsTile extends StatelessWidget {
  const TruckDriverDetailsTile({
    Key? key,
    required this.args,
    required this.dataList,
  }) : super(key: key);

  final OrderIdentificationModels args;

  final List dataList;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: dataList[args.idx][2]!=null ? Colors.black : Colors.grey,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.12,
              width: 2,
              child: const DottedLine(
                direction: Axis.vertical,
                //lineLength: double.infinity,
                //lineThickness: 1.0,
                //dashLength: 4.0,
                dashColor: Colors.grey,
                //dashGradient: [Colors.red, Colors.blue],
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                //dashGapGradient: [Colors.red, Colors.blue],
                dashGapRadius: 0.0,
              ),
            ),
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: args.isDilivered ? Colors.black : Colors.grey,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.12,
              width: 2,
              child: const DottedLine(
                direction: Axis.vertical,
                //lineLength: double.infinity,
                //lineThickness: 1.0,
                //dashLength: 4.0,
                dashColor: Colors.grey,
                //dashGradient: [Colors.red, Colors.blue],
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                //dashGapGradient: [Colors.red, Colors.blue],
                dashGapRadius: 0.0,
              ),
            ),
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: args.isDilivered ? Colors.black : Colors.grey,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataList[args.idx][1] ?? "Pickup Location",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    dataList[args.idx][3] ?? "Pickup Time",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Text(
                    "Estimated time of delivery",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.08,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IN Transit",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "pickup time",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "pickup time",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.08,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataList[args.idx][2] ?? "Drop Location",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    args.isDilivered ? dataList[args.idx][3] : "Drop time",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Text(
                    "Estimated time of Delivery",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
