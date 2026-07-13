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
              padding: const EdgeInsets.all(32),
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
                        } 
                        ,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: isMale
                              ? KSelectedTileBorderDecoration
                              : KTileBorderDecoration
                          ,
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
                        } 
                        ,
                        child: Container(
                          decoration: !isMale
                              ? KSelectedTileBorderDecoration
                              : KTileBorderDecoration
                          ,
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
                    height: 25,
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
                              height.toStringAsFixed(2),
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
                          },
                          thumbColor: KButtonColor,
                          activeColor: Colors.white,
                          inactiveColor: KIInactiveTextColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                                "75",
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
                                    onPressed: () {},
                                    child: Icon(Icons.add,
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
                                    onPressed: () {},
                                    child: Icon(Icons.remove,
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
                                "30",
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
                                    onPressed: () {},
                                    child: Icon(Icons.add,
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
                                    onPressed: () {},
                                    child: Icon(Icons.remove,
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
            SizedBox(
              height: 25,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: KButtonColor,
                      shape: const RoundedRectangleBorder(),
                      minimumSize: Size(double.infinity, 80),
                    ),
                    child: const Text(
                      'Calculate BMI',
                      style: TextStyle(
                        fontSize: 20,
                        color: KActiveTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
