import 'main_library.dart';

class Icon_Content extends StatelessWidget {
  Icon_Content({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          title.toString(),
          style: customTextStyle,
        ),
      ],
    );
  }
}