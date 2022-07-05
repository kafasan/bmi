import 'package:bmi/constants/constant.dart';
import 'package:bmi/helper/bmi_calulator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 150;
  int weight = 50;
  int age = 17;
  String? gender;

  List<Widget> generateWeight(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(Text(
        "$i",
        style: labelTextStyle.copyWith(fontSize: 20),
      ));
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryDarkColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: textDefaultColor),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "male") ? secondaryColor : primaryColor,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          (gender == "male")
                              ? "assets/images/icon_male_active.png"
                              : "assets/images/icon_male_inactive.png",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            "Male",
                            style: labelTextStyle.copyWith(
                              color: (gender == "male")
                                  ? secondaryColor
                                  : textDefaultColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "female") ? secondaryColor : primaryColor,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          (gender == "female")
                              ? "assets/images/icon_female_active.png"
                              : "assets/images/icon_female_inactive.png",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Text(
                            "Female",
                            style: labelTextStyle.copyWith(
                              color: (gender == "female")
                                  ? secondaryColor
                                  : textDefaultColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: BmiCardOne(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height (cm)",
                      style: labelTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.navigate_before,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.symmetric(vertical: 5),
                            child: NumberPicker(
                              value: height,
                              minValue: 80,
                              maxValue: 240,
                              step: 1,
                              itemHeight: 100,
                              axis: Axis.horizontal,
                              onChanged: (value) {
                                setState(() {
                                  height = value;
                                });
                              },
                              // decoration: BoxDecoration(
                              //   border: Border(
                              //     left: BorderSide(
                              //       color: secondaryColor,
                              //     ),
                              //     right: BorderSide(
                              //       color: secondaryColor,
                              //     ),
                              //   ),
                              // ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: secondaryColor),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Slider(
                    //   value: height.toDouble(),
                    //   min: 80,
                    //   max: 200,
                    //   thumbColor: Colors.red,
                    //   activeColor: Colors.white,
                    //   onChanged: (value) {
                    //     height = value.toInt();
                    //     setState(() {});
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight (kg)",
                        style: labelTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                                initialItem: weight - 20),
                            itemExtent: 25,
                            magnification: 2,
                            useMagnifier: true,
                            onSelectedItemChanged: (val) {
                              weight = val + 20;
                            },
                            children: generateWeight(20, 220)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: labelTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$age",
                        style: numberTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              fillColor: Colors.grey[300],
                              constraints: const BoxConstraints.tightFor(
                                width: 55,
                                height: 55,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: iconDefaultColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            RawMaterialButton(
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey[300],
                              constraints: const BoxConstraints.tightFor(
                                width: 55,
                                height: 55,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: iconDefaultColor,
                              ),
                            ),
                          ])
                    ],
                  ),
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
              );
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(15),
              // color: const Color(0xffec3c66),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Color(0xffcfd8dc),
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}

class BmiCardOne extends StatelessWidget {
  const BmiCardOne({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Color(0xffcfd8dc),
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      margin: const EdgeInsets.all(9),
      child: child,
    );
  }
}