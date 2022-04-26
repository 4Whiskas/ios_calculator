import 'package:flutter/material.dart';
import 'package:ios_calculator/ui/button_type.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      required this.type,
      required this.buttonStyle,
      required this.action,
      required this.title,
      required this.textStyle,
      required this.parameter})
      : super(key: key);

  final ButtonType type;
  final ButtonStyle buttonStyle;
  final TextStyle textStyle;
  final Function action;
  final String? parameter;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: type.height,
        width: type.width,
        child: TextButton(
          onPressed: () {
            if(parameter==null)
              {
                action();
              }
            else{
              action(parameter);
            }
          },
          style: buttonStyle,
          child: Text(title, style: textStyle),
        ),
      ),
    );
  }
}
