import 'main_library.dart';

void main() {
  runApp(const bmi_calculator());
}

class bmi_calculator extends StatelessWidget {
  const bmi_calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        // textTheme: const TextTheme(
        //   bodyText1: TextStyle(
        //     color: Color(0xFFFFFFFF),
        //   ),
        // ),
      ),
      home: input_page(),
    );
  }
}

