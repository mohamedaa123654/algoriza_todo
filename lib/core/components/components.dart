import 'package:flutter/material.dart';

import '../util/color_manager.dart';

//General Button For App
class DefaultButton extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  double? width;
  double? height;
  double radius;
  bool isUpperCase;
  Color? buttonColor;
  Color? textColor;

  DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.height,
      this.radius = 3.0,
      this.isUpperCase = false,
      this.buttonColor = ColorManager.primaryButtonColor,
      this.textColor = ColorManager.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

//Logo Of App
class TextLogo extends StatelessWidget {
  double textSize;
  TextLogo({Key? key, this.textSize = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '7',
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.sevencolor),
        ),
        Text(
          'Krave',
          style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary),
        )
      ],
    );
  }
}

//General TextButton For App
class DefaultTextButton extends StatelessWidget {
  VoidCallback? function;
  String text;
  DefaultTextButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: ColorManager.primary),
      ),
    );
  }
}

//General FormField For App

//Navigat to Screen
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//Navigat to Screen And Close old Screen
void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
