import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_traffic_mg/fregments/carfines.dart';
import 'package:e_traffic_mg/fregments/home.dart';
import 'package:e_traffic_mg/fregments/registed_car_fine.dart';
import 'package:e_traffic_mg/fregments/userprofile.dart';
import 'package:e_traffic_mg/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: getBottomBar(),
        floatingActionButton: getMainButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _activeTab = index;
            });
          },
          children: [
            HomeFregment(),
            CarFines(),
            UserProfileFregment(),
          ],
        ));
  }

  Widget getBottomBar() {
    return BottomNavyBar(
        selectedIndex: _activeTab,

        // use this to remove appBar's elevation
        // onItemSelected: (index) => setState(() {
        //   _currentIndexPage = index;
        //
        // }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
          ),
          BottomNavyBarItem(
            icon: Icon(
              FontAwesomeIcons.carBurst,
              color: Color(0xff5D6D7E),
            ),
            title: Text('  Car Fines'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people, color: Color(0xfff7760a)),
            title: Text('Users'),
          ),
        ],
        onItemSelected: (currentIndex) {
          setState(() {
            _activeTab = currentIndex;
            _pageController.jumpToPage(currentIndex);
          });
        });
  }

  Widget getMainButton() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: bottomBarColor,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateCarFine()));
        },
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Color.fromARGB(255, 174, 173, 173),
              size: 20,
            )),
      ),
    );
  }
}
