import 'package:assignment_haulx/dummy_data.dart';
import 'package:assignment_haulx/models/order_id_model.dart';
import 'package:assignment_haulx/screens/order_details.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Load extends StatefulWidget {
  static const id = "Load";

  const Load({Key? key}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  int _page = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin:
            EdgeInsets.only(left: 10, right: 10, top: screenSize.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        _page = 0;

                        _pageController.animateToPage(
                          _page,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.bounceIn,
                        );
                        setState(() {});
                      },
                      child: LoadsPageLabel(
                          selected: _page == 0, text: "Ongoing Loads")),
                  GestureDetector(
                      onTap: () {
                        _page = 1;
                        _pageController.animateToPage(
                          _page,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.bounceIn,
                        );
                        setState(() {});
                      },
                      child: LoadsPageLabel(
                          selected: _page == 1, text: "Past Loads")),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.75,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [OngoingLoads(), DeliveredLoads()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OngoingLoads extends StatelessWidget {
  const OngoingLoads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.8,
      color: Colors.transparent,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: deliveredData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                OrderDetails.id,
                arguments: OrderIdentificationModels(false, index),
              );
            },
            child: OrderTile(
              amount: inTransitData[index][0],
              pickUpLocation: inTransitData[index][1],
              dropLocation: inTransitData[index][2],
              pickUpTime: inTransitData[index][3],
              dropTime: inTransitData[index][4],
              distanceCovered: inTransitData[index][5],
            ),
          );
        },
      ),
    );
  }
}

class DeliveredLoads extends StatelessWidget {
  const DeliveredLoads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.8,
      color: Colors.transparent,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: deliveredData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                OrderDetails.id,
                arguments: OrderIdentificationModels(true, index),
              );
              // Navigator.pushNamed(context, OrderDetails.id);
            },
            child: OrderTile(
              amount: deliveredData[index][0],
              pickUpLocation: deliveredData[index][1],
              dropLocation: deliveredData[index][2],
              pickUpTime: deliveredData[index][3],
              dropTime: deliveredData[index][4],
              distanceCovered: deliveredData[index][5],
            ),
          );
        },
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  const OrderTile({
    Key? key,
    required this.amount,
    this.pickUpLocation,
    this.dropLocation,
    this.pickUpTime,
    this.dropTime,
    required this.distanceCovered,
  }) : super(key: key);

  final num amount;
  final String? pickUpLocation;
  final String? dropLocation;
  final String? pickUpTime;
  final String? dropTime;
  final double distanceCovered;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    Color progressColor = Colors.orange;
    if (distanceCovered > 0.1 && distanceCovered < 0.5) {
      progressColor = Colors.greenAccent;
    } else if (distanceCovered >= 0.5 && distanceCovered < 0.8) {
      progressColor = Colors.green;
    } else if(distanceCovered>=0.8){
      progressColor = Colors.blueAccent;
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 2, left: 15, right: 15),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      height: 180,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: progressColor.withOpacity(0.08),
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ $amount",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              Container(
                height: 20,
                width: 75,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    dropTime == null ? "In Transit" : "Delivered",
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: pickUpTime == null
                                  ? Colors.grey
                                  : Colors.black,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)))),
                      Container(
                          height: 60,
                          width: 2,
                          decoration: BoxDecoration(
                            color:
                                pickUpTime == null ? Colors.grey : Colors.black,
                          )),
                      Container(
                        height: 12,
                        width: 12,
                        color: dropTime == null ? Colors.grey : Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pickUpLocation == null
                                  ? "Pick up Location"
                                  : pickUpLocation!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              pickUpTime == null ? "pickup time" : pickUpTime!,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dropLocation == null
                                  ? "Drop Location"
                                  : dropLocation!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              dropTime == null ? "drop time" : dropTime!,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black12,
                        color: progressColor,
                        value: distanceCovered,
                      ),
                    ),
                    dropTime == null
                        ? SizedBox(
                            height: 75,
                            width: 75,
                            child: Lottie.asset('assets/truck_moving.json',),
                          )
                        : SizedBox(
                            height: 75,
                            width: 75,
                            child: Lottie.asset('assets/truck_moving.json',animate: false),
                          ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

// @override
// void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//   super.debugFillProperties(properties);
//   properties.add(StringProperty('dropLocation', dropLocation));
// }
}

class LoadsPageLabel extends StatelessWidget {
  const LoadsPageLabel({
    Key? key,
    required bool selected,
    required this.text,
  })  : _selected = selected,
        super(key: key);

  final bool _selected;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: _selected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: 40,
      width: screenSize.width * 0.4,
      child: Center(
          child: _selected
              ? Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                )
              : Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black),
                )),
    );
  }
}
