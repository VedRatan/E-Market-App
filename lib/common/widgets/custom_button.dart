import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,this.color,  required this.hinttext, required this.onTap})
      : super(key: key);
  final String hinttext;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          primary: color,
          foregroundColor: Colors.white),
      child: Text(
        hinttext,
      ),
    );
  }
}
