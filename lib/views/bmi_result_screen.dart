import 'package:bmi/constants/constant.dart';
import 'package:bmi/helper/bmi_calulator.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealthRiskDescription();

    return Scaffold(
      backgroundColor: primaryDarkColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "BMI Result",
          style:
              TextStyle(color: textDefaultColor, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(
          color: iconDefaultColor,
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: textDefaultColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 2,
                    color: secondaryColor,
                  ),
                  Text(
                    bmiCalculator.bmiCategory ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textDefaultColor,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    bmiCalculator.bmiDescription ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      color: textDefaultColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffcfd8dc),
                    blurRadius: 4,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "RECALCULATE BMI",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
