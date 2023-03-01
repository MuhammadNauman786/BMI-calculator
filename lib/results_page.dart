import 'package:bmi_calculator/calculator_brain.dart';

import 'main_library.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.bmiResults, required this.result, required this.interpretation}) : super(key: key);
  final String bmiResults;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color(0xFF0A0E21),
          title: const Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: const Text(
                  "Your Result",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: ReuseableContainer(
                colour: activeColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: customResultTextStyle,
                    ),

                    Text(
                      bmiResults,
                      style: customBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: customBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: bottomContainerColor,
                height: 70.0,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: customBigTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
