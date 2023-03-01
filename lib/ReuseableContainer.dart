import 'main_library.dart';

class ReuseableContainer extends StatelessWidget {
  ReuseableContainer({required this.colour, this.childWidget});

  Color colour = inactiveColor;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: childWidget,
    );
  }
}