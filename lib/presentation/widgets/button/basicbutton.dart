import 'package:flutter/material.dart';

class BasicAppbutton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? heights;

  const BasicAppbutton(
      {super.key, required this.title, this.heights, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Satoshi',
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(heights ?? 80),
      ),
    );
  }
}
