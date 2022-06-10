import 'package:dotted_border/dotted_border.dart';
import 'package:e_traffic_mg/common/api.dart';
import 'package:e_traffic_mg/common/theme_helper.dart';
import 'package:e_traffic_mg/data/json.dart';
import 'package:e_traffic_mg/theme/colors.dart';
import 'package:e_traffic_mg/utils/constant.dart';
import 'package:e_traffic_mg/widgets/custom_button.dart';
import 'package:e_traffic_mg/widgets/custom_image.dart';
import 'package:e_traffic_mg/widgets/favorite_box.dart';
import 'package:e_traffic_mg/widgets/icon_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late dynamic data;
  bool showBody = false;
  late String userNumber;
  double stackHeight = 230;

  @override
  void initState() {
    super.initState();

    data = widget.data;

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        showBody = true;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

  animatedBody() {
    return AnimatedCrossFade(
      firstChild: buildBody(),
      secondChild: Container(),
      crossFadeState:
          showBody ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: animatedBodyMS),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: animatedBody(),
      floatingActionButton: buildButtons(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  buildStack() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: stackHeight,
      child: Stack(
        children: [
          CustomImage(
            data["carImage"],
            width: MediaQuery.of(context).size.width,
            height: stackHeight,
            radius: 0,
            isShadow: false,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBox(
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: darker,
                    ),
                    bgColor: cardColor.withOpacity(.7),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: stackHeight - 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: appBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          ),
          Positioned(
            top: stackHeight - 50,
            right: 20,
            child: FavoriteBox(
              size: 18,
              isFavorited: data["is_favorited"],
              onTap: () {
                setState(() {
                  data["is_favorited"] = !data["is_favorited"];
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoHead() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data["carName"] + ' -- ' + data["carPlate"],
              style: const TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w600),
            ),
            data["fixed"] == true
                ? Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_box,
                          color: textColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Fixed',
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_box,
                          color: textColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Not Fixed',
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
          ],
        ),
        Text(
          data["userType"],
          style: const TextStyle(fontSize: 14, color: labelColor),
        ),
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildStack(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: buildInfoHead(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                child: buildReivewBox(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                    color: darker,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                child: buildIngredientBox(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Text(
                  "Description",
                  style: TextStyle(
                    color: darker,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  data["desc"],
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: labelColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildReivewBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: appBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImage(
            data["carOwnerImage"],
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["carOwnerName"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 3),
                Text(
                  data["userType"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: labelColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: yellow,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                "168 upvoted",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: labelColor, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIngredientBox() {
    return DottedBorder(
      dashPattern: const [2, 5],
      color: darker,
      strokeWidth: .5,
      radius: const Radius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIngredientItem(
                    data['fineTitle'], "\$${data['fineMoney']}"),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    if (data['fineMoney'] == 0) {}
                    return AlertDialog(
                      title: Text("Are You Sure ?"),
                      content: Row(children: [
                        Text('To Take '),
                        Text('\$ ${data['fineMoney']}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(' Car Fine'),
                      ]),
                      actions: [
                        RaisedButton(onPressed: () {}, child: Text('Cancel')),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Enter User Number'),
                                      content: Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  maxLength: 11,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  validator: (_theNumber) {
                                                    if (_theNumber!.isEmpty) {
                                                      return 'Enter User Number';
                                                    }
                                                  },
                                                  onSaved: (_theNumber) {
                                                    setState(() {
                                                      userNumber = _theNumber!;
                                                    });
                                                  },
                                                  decoration: ThemeHelper()
                                                      .textInputDecoration(
                                                          'User Number',
                                                          '\$ 0.0'),
                                                ),
                                                decoration: ThemeHelper()
                                                    .inputBoxDecorationShaddow(),
                                              ),
                                            ],
                                          )),
                                      actions: [
                                        TextButton(
                                          child: Text("Send Number"),
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((state) =>
                                                          Colors.green)),
                                          onPressed: () {
                                            _formKey.currentState!.save();
                                            if (_formKey.currentState!
                                                .validate()) {
                                              if (TrafficDataService()
                                                  .paidTheMoney(
                                                      data, userNumber)) {
                                                // CoolAlert.show(
                                                //     context: context,
                                                //     type:
                                                //         CoolAlertType.success);
                                              }
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Text('Ok'))
                      ],
                    );
                  });
            },
            child: IconBox(
              bgColor: red,
              padding: 12,
              child: Row(
                children: [
                  const SizedBox(
                    width: 3,
                  ),
                  SvgPicture.asset(
                    "assets/icons/play.svg",
                    color: Colors.white,
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "The Money",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomButton(
              radius: 15,
              title: "Fix The Fine",
              onTap: () {
                Widget cancelButton = TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (state) => Colors.red)),
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
                Widget continueButton = TextButton(
                  child: Text("Continue"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (state) => Colors.green)),
                  onPressed: () {
                    TrafficDataService().fixTheFine(data);
                    setState(() {});
                    // CoolAlert.show(
                    //     context: context,
                    //     type: CoolAlertType.success,
                    //     text: 'You Succesfully Fixed The Fine');

                    Navigator.pop(context);
                  },
                );
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are You Sure ?"),
                        content: Row(children: [
                          Text('To Fix This '),
                          Text('${data['carName']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(' Car Fine'),
                        ]),
                        actions: [
                          cancelButton,
                          continueButton,
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIngredientItem(String text, String value) {
    return Row(
      children: [
        const Icon(
          Icons.fiber_manual_record,
          size: 10,
          color: primary,
        ),
        const SizedBox(
          width: 2,
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: const TextStyle(
                  color: labelColor,
                  fontSize: 13,
                ),
              ),
              const TextSpan(
                text: ": ",
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
