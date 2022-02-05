import 'dart:math';

import 'package:bmi_calculator_app/MeasureCard.dart';
import 'package:bmi_calculator_app/Reusable_Card.dart';
import 'package:bmi_calculator_app/iconContent.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //0 for male
  //1 female

  int selectedGender = 0;
  int weight = 45;
  int height = 160;
  String healthMeasure = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: const Text('BMI Calculator')),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //gender
          Row(
            children: [
              Reusable_Card(
                  cardChild: IconContent(
                    icon: Icons.male,
                    title: "Male",
                    active: selectedGender == 0,
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = 0;
                    });
                  }),
              Reusable_Card(
                  cardChild: IconContent(
                    icon: Icons.female,
                    title: "Female",
                    active: selectedGender == 1,
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  }),
            ],
          ),

          //measurements
          Row(
            children: [
              Reusable_Card(
                  cardChild: MeasureCard(
                    measure: weight,
                    title: 'Weight',
                    unit: 'Kg',
                    increment: () {
                      setState(() {
                        weight++;
                      });
                    },
                    decrement: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  onPress: () {}),
              Reusable_Card(
                  cardChild: MeasureCard(
                    measure: height,
                    title: 'Height',
                    unit: 'cm',
                    increment: () {
                      setState(() {
                        height++;
                      });
                    },
                    decrement: () {
                      setState(() {
                        height--;
                      });
                    },
                  ),
                  onPress: () {}),
            ],
          ),

          //calculations
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);

              if (bmi < 18.5) {
                healthMeasure = "underweight";
              } else if (bmi > 18.5 && bmi < 24.9) {
                healthMeasure = "normal";
              } else
                healthMeasure = "overweight";

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'You are ' +
                            healthMeasure +
                            " \n  Your BMI is " +
                            bmi.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 25,
                          //       fontStyle: FontStyle.italic,
                          color: Colors.red,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Back"),
                        )
                      ],
                    );
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              //padding: const EdgeInsets.all(30),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.purple[900],
                borderRadius: BorderRadius.circular(7),
              ),

              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
