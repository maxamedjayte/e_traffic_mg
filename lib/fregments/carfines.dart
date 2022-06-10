import 'package:e_traffic_mg/data/json.dart';
import 'package:e_traffic_mg/screens/fix_car_fine.dart';
import 'package:e_traffic_mg/screens/recipe_detail.dart';
import 'package:e_traffic_mg/theme/colors.dart';
import 'package:e_traffic_mg/widgets/bookmark_item.dart';
import 'package:e_traffic_mg/widgets/custom_round_textbox.dart';
import 'package:e_traffic_mg/widgets/icon_box.dart';
import 'package:e_traffic_mg/widgets/slidable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarFines extends StatefulWidget {
  const CarFines({Key? key}) : super(key: key);

  @override
  State<CarFines> createState() => _CarFinesState();
}

class _CarFinesState extends State<CarFines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: buildSearchBlcok(),
          ),
          SliverToBoxAdapter(
            child: carFineList(),
          ),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Registred CarFines",
          style: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FixCarFine()));
          },
          child: IconBox(
            child: SvgPicture.asset(
              "assets/icons/scan.svg",
              color: red,
            ),
            radius: 50,
          ),
        ),
      ],
    );
  }

  Widget buildSearchBlcok() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: Row(
        children: const [
          Expanded(
            child: CustomRoundTextBox(
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget carFineList() {
    return Container(
      height: 500,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: carFines.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: SlidableWidget(
            key: UniqueKey(),
            child: BookmarkItem(
              width: double.infinity,
              data: carFines[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetail(
                      data: carFines[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
