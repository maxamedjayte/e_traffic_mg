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
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:image_picker/image_picker.dart';

class CreateCarFine extends StatefulWidget {
  const CreateCarFine({Key? key}) : super(key: key);

  @override
  _CreateCarFineState createState() => _CreateCarFineState();
}

class _CreateCarFineState extends State<CreateCarFine> {
  // List<OcrText> texts = [];
  var _textsOcr;
  bool initialized = false;
  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((x) => setState(() {}));
  }

  String choosedCar = 'LamberGeni';
  String fineTitle = '';
  double fineMoney = 0;
  File? image;
  List allCars = ['LamberGeni', 'BMW'];
  var simpleText = '';
  final _formKey = GlobalKey<FormState>();
  Future<Null> readData() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        multiple: true,
        waitTap: true,
      );
      setState(() {
        simpleText = texts[0].value;
      });
      print('dasd');
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }

    if (!mounted) return;

    setState(() => _textsOcr = texts);
    print(texts);
    print('dasdasd');
  }

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
              "Register A New Fine",
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
                  onTap: () async {
                    // pickImage();
                    List<OcrText> texts = [];
                    try {
                      texts = await FlutterMobileVision.read(
                        multiple: true,
                        flash: true,
                        waitTap: true,
                        forceCloseCameraOnTap: true,
                        fps: 5,
                      );
                      print('das');
                      for (OcrText palate in texts) {
                        print(palate.value);
                      }
                    } catch (e) {}

                    // try {
                    //   texts = await FlutterMobileVision.read(
                    //     waitTap: true,
                    //     multiple: true,
                    //     scanArea: Size(540, 250),
                    //     showText: true,
                    //     forceCloseCameraOnTap: true,
                    //     fps: 5,
                    //   );
                    //   // for (OcrText plateT in texts) {
                    //   //   print('plate is');
                    //   //   print(plateT.value);
                    //   //   if (plateT.value == 'FAYA DHOWR') {
                    //   //     print('yyyyyyyy');
                    //   //     Navigator.pop(context);
                    //   //   }
                    //   // }
                    // } on Exception {
                    //   // texts.add(new OcrText('Failed to recognize text.'));
                    // }
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                onSaved: (_theFine) {
                  setState(() {
                    fineTitle = _theFine!;
                  });
                },
                validator: (_theFan) {
                  if (_theFan!.isEmpty) {
                    return 'Enter Fine Title';
                  }
                },
                decoration: ThemeHelper()
                    .textInputDecoration('Fine Title', 'Title Of The Fine'),
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),
            SizedBox(height: 15),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                    validator: (_theKutub) {
                      if (_theKutub!.isEmpty) {
                        return 'Please Choose The Car';
                      }
                    },
                    onSaved: (_theType) {
                      setState(() {
                        choosedCar = _theType!;
                      });
                    },
                    hint: Text('Or Choose The Car'),
                    decoration: ThemeHelper().textInputDecoration(
                        'All Registred Cars', 'Choose Car To assain'),
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        choosedCar = newValue!;
                      });
                    },
                    value: choosedCar,
                    items:
                        allCars.map<DropdownMenuItem<String>>((_currentKutub) {
                      return DropdownMenuItem<String>(
                          child: Text(_currentKutub), value: _currentKutub);
                    }).toList()),
                decoration: ThemeHelper().inputBoxDecorationShaddow()),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSaved: (_theFineMoney) {
                  setState(() {
                    if (_theFineMoney!.isEmpty) {
                      fineMoney = 0;
                    } else {
                      fineMoney = double.parse(_theFineMoney);
                    }
                  });
                },
                decoration: ThemeHelper()
                    .textInputDecoration('FineMoney Title', '\$ 0.0'),
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
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
                'Diiwaangali'.toUpperCase(),
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
