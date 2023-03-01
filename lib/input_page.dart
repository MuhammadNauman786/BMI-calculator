import 'dart:ffi';

import 'package:bmi_calculator/calculator_brain.dart';

import 'main_library.dart';

enum Gender {
  male,
  female,
}

class input_page extends StatefulWidget {
  const input_page({Key? key}) : super(key: key);

  @override
  _input_pageState createState() => _input_pageState();
}

class _input_pageState extends State<input_page> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReuseableContainer(
                      colour: selectedGender == Gender.male
                          ? activeColor
                          : inactiveColor,
                      childWidget: Icon_Content(
                        icon: Icons.male,
                        title: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableContainer(
                      colour: selectedGender == Gender.female
                          ? activeColor
                          : inactiveColor,
                      childWidget: Icon_Content(
                        icon: Icons.female,
                        title: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableContainer(
              colour: activeColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: customTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: customNumberStyle,
                      ),
                      const Text(
                        "cm",
                        style: customTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: const Color(0xFFEB1555),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: const Color(0x29EB1555),
                      overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ReuseableContainer(
                    colour: activeColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: customTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: customNumberStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableContainer(
                    colour: activeColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: customTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: customNumberStyle,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(height, weight);
              String bmiResult = calculatorBrain.CalculateBMI();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                     return ResultsPage(interpretation: calculatorBrain.getInterpretation(), bmiResults: bmiResult, result: calculatorBrain.getResult(),);
                  }),
              );
            },
            child: Container(
              color: bottomContainerColor,
              height: 70.0,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: customBigTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




