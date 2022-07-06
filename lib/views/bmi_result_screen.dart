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
          style: TextStyle(color: textDefaultColor),
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
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCalculator.bmiCategory ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textDefaultColor,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    Text(
                      bmiCalculator.bmiDescription ?? "",
                      style: const TextStyle(
                        fontSize: 15,
                        color: textDefaultColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]),
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
