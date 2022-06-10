import 'dart:io';

import 'package:e_traffic_mg/common/theme_helper.dart';
import 'package:e_traffic_mg/theme/colors.dart';
import 'package:e_traffic_mg/widgets/appbar_box.dart';
import 'package:e_traffic_mg/widgets/icon_box.dart';
import 'package:e_traffic_mg/widgets/my_button.dart';
import 'package:e_traffic_mg/widgets/my_textfield.dart';
import 'package:e_traffic_mg/widgets/notification_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FixCarFine extends StatefulWidget {
  const FixCarFine({Key? key}) : super(key: key);

  @override
  _FixCarFineState createState() => _FixCarFineState();
}

class _FixCarFineState extends State<FixCarFine> {
  String choosedCar = 'LamberGeni';
  String fineTitle = '';
  double fineMoney = 0;
  File? image;
  List allCars = ['LamberGeni', 'BMW'];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBody(),
      floatingActionButton: getButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  getAppBar() {
    return AppBarBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconBox(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              "Fixing Car Fine",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
          )),
          SizedBox(width: 15),
          NotificationBox()
        ],
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            getAppBar(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Scan Car Image',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // pickImage();
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 5, color: Colors.white),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: image == null
                          ? Icon(
                              Icons.add_a_photo,
                              size: 80,
                              color: Colors.grey.shade300,
                            )
                          : Image.file(
                              image!,
                              fit: BoxFit.fill,
                            )),
                ),
              ],
            ),
            SizedBox(height: 15),
            getEnterAmount()
          ],
        ),
      ),
    );
  }

  getEnterAmount() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enter amount",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "Change currency?",
                style: TextStyle(color: primary),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "USD",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "500.00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  getButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, bottom: 10),
          child: ElevatedButton(
            style: ThemeHelper().buttonStyle(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
              child: Text(
                'Fix The Problem'.toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onPressed: () async {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                print('dsad');
              }
            },
          ),
        ),
      ],
    );
  }
}
