import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;

  const CustomElevatedButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
       buttonText,
        style: TextStyle(fontSize: 17),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF7C4DFF))),
    );
  }
}
