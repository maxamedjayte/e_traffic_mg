import 'package:e_traffic_mg/data/json.dart';
import 'package:e_traffic_mg/widgets/appbar_box.dart';
import 'package:e_traffic_mg/widgets/avatar_image.dart';
import 'package:e_traffic_mg/widgets/dashboardButtons.dart';
import 'package:e_traffic_mg/widgets/notification_box.dart';
import 'package:e_traffic_mg/widgets/transaction_item.dart';
import 'package:e_traffic_mg/widgets/user_box.dart';
import 'package:flutter/material.dart';

class HomeFregment extends StatefulWidget {
  const HomeFregment({Key? key}) : super(key: key);

  @override
  State<HomeFregment> createState() => _HomeFregmentState();
}

class _HomeFregmentState extends State<HomeFregment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getAppBar() {
    return AppBarBox(
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarImage(currentUser['profileImage'].toString(),
                isSVG: false, width: 35, height: 35),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${currentUser['name']},",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  currentUser['is_staff'] == true
                      ? Text("Welcome back to your staf!",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17))
                      : Text("Welcome back!",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17)),
                ],
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            InkWell(
                onTap: () {
                  // TrafficDataService().getUsersProfile();
                },
                child: const NotificationBox())
          ],
        ));
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getAppBar(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: DashButtons(
                    head: 'All Cars Reg',
                    headValue: 12,
                    icon: Icons.car_rental,
                    fontColor: Colors.white,
                    dashColor: Color(0xff154360),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: DashButtons(
                    head: 'The Unfixed Fines',
                    headValue: 12,
                    icon: Icons.sync_problem_outlined,
                    fontColor: Colors.white,
                    dashColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          currentUser['is_staff'] == true
              ? Column(children: [
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Some Users",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: getRecentUsers(),
                  ),
                ])
              : Container(),
          SizedBox(height: 20),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, right: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Fines",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ))),
                      Icon(Icons.expand_more_rounded),
                    ],
                  )),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: getTransanctions(),
              ),
            ],
          )
        ],
      ),
    );
  }

  getRecentUsers() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              recentUsers.length,
              (index) => index == 0
                  ? Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: getSearchBox(),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: UserBox(user: recentUsers[index]))
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        print('user tapped');
                        print('object');
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: UserBox(user: recentUsers[index])),
                    ))),
    );
  }

  getTransanctions() {
    return Column(
        children: List.generate(
            latestCarFines.length,
            (index) => Container(
                margin: EdgeInsets.only(right: 15),
                child: currentUser['is_staff'] == false
                    ? latestCarFines[index]['userId'] == currentUser['id']
                        ? TransactionItem(latestCarFines[index])
                        : Container()
                    : TransactionItem(latestCarFines[index]))));
  }

  getSearchBox() {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey.shade300, shape: BoxShape.circle),
          child: Icon(
            Icons.search_rounded,
            size: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
