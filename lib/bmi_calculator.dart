import 'package:demo/constant.dart';
import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  bool isMale = true;
  double height = 183;
  int weight = 75;
  int age = 30;
  double bmi = 0;

  double calculateBMI({required int weight, required double height}) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue; // Underweight
    } else if (bmi < 25) {
      return Colors.green; // Normal weight
    } else if (bmi < 30) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obesity
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KBackgroundColor,
        foregroundColor: KActiveTextColor,
        title: const Text('BMI Calculator'),
      ),
      backgroundColor: KBackgroundColor,
      body: SizedBox(
        // color: Colors.yellow,
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      // flex: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                          var bmiValue = calculateBMI(weight: weight, height: height);
                          setState(() {
                            bmi = bmiValue;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: isMale
                              ? KSelectedTileBorderDecoration
                              : KTileBorderDecoration,
                          child: const Column(
                            children: [
                              Icon(
                                Icons.male,
                                size: 50,
                                color: KActiveTextColor,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: KActiveTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Spacer(),
                    const SizedBox(
                      width: 5,
                    ),

                    Expanded(
                      // flex: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                          var bmiValue = calculateBMI(weight: weight, height: height);
                          setState(() {
                            bmi = bmiValue;
                          });
                        },
                        child: Container(
                          decoration: !isMale
                              ? KSelectedTileBorderDecoration
                              : KTileBorderDecoration,
                          padding: const EdgeInsets.all(20),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 50,
                                color: KActiveTextColor,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: KActiveTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: KTileBorderDecoration,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            color: KActiveTextColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toStringAsFixed(1),
                              style: TextStyle(
                                  color: KActiveTextColor, fontSize: 50),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                  color: KActiveTextColor, fontSize: 20),
                            ),
                          ],
                        ),
                        Slider(
                          min: 80,
                          max: 200,
                          value: height,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                            var bmiValue = calculateBMI(weight: weight, height: height);
                            setState(() {
                              bmi = bmiValue;
                            });
                          },
                          thumbColor: KButtonColor,
                          activeColor: Colors.white,
                          inactiveColor: KIInactiveTextColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: KTileBorderDecoration,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                  color: KActiveTextColor,
                                ),
                              ),
                              Text(
                                "$weight",
                                style: const TextStyle(
                                    color: KActiveTextColor,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: KBackgroundColor,
                                    shape: ShapeBorder.lerp(
                                        CircleBorder(), CircleBorder(), 0.5),
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 25) {
                                          weight--;
                                        }
                                        var bmiValue = calculateBMI(weight: weight, height: height);
                                        setState(() {
                                          bmi = bmiValue;
                                        });
                                      });
                                    },
                                    child: Icon(Icons.remove,
                                        color: KActiveTextColor),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: KBackgroundColor,
                                    shape: ShapeBorder.lerp(
                                        CircleBorder(), CircleBorder(), 0.5),
                                    onPressed: () {
                                      setState(() {
                                        if (weight < 200) {
                                          weight++;
                                        }
                                        var bmiValue = calculateBMI(weight: weight, height: height);
                                        setState(() {
                                          bmi = bmiValue;
                                        });
                                      });
                                    },
                                    child: Icon(Icons.add,
                                        color: KActiveTextColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          decoration: KTileBorderDecoration,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                  color: KActiveTextColor,
                                ),
                              ),
                              Text(
                                "$age",
                                style: TextStyle(
                                    color: KActiveTextColor,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: KBackgroundColor,
                                    shape: ShapeBorder.lerp(
                                        CircleBorder(), CircleBorder(), 0.5),
                                    onPressed: () {
                                      
                                        if (age > 10) {
                                          age--;
                                        }
                                        var bmiValue = calculateBMI(weight: weight, height: height);
                                        setState(() {
                                          bmi = bmiValue;
                                        });
                                      
                                    },
                                    child: Icon(Icons.remove,
                                        color: KActiveTextColor),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: KBackgroundColor,
                                    shape: ShapeBorder.lerp(
                                        CircleBorder(), CircleBorder(), 0.5),
                                    onPressed: () {
                                        if (age < 100) {
                                          age++;
                                        }
                                        
                                        var bmiValue = calculateBMI(weight: weight, height: height);
                                        setState(() {
                                          bmi = bmiValue;
                                        });
                                      
                                    },
                                    child: Icon(Icons.add,
                                        color: KActiveTextColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              decoration: KTileBorderDecoration,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                      color: KActiveTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style:  TextStyle(
                        color: getBMIColor(bmi),
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // const Spacer(),

            // Row(
            //   children: [
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {
            //           bmi = calculateBMI(weight: weight, height: height);
            //           setState(() {});
            //         },
            //         style: TextButton.styleFrom(
            //           backgroundColor: KButtonColor,
            //           shape: const RoundedRectangleBorder(),
            //           minimumSize: Size(double.infinity, 70),
            //         ),
            //         child: const Text(
            //           'Calculate BMI',
            //           style: TextStyle(
            //             fontSize: 20,
            //             color: KActiveTextColor,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
