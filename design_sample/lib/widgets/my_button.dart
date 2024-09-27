import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function() onTap;
  final String txt;
  final Color? color;

  const MyButton({
    super.key,
    required this.onTap,
    required this.txt,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isOutlined = color == null; // Determine if the button is outlined

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isOutlined
              ? Colors.transparent
              : color, // Set background based on type
          border: Border.all(
            color: Colors.white, // Border color for outlined button
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30), // Rounded border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Text(
            txt,
            style: TextStyle(
              fontFamily: 'sans-serif', // Use sans-serif font style
              fontSize: 18, // Adjust font size for consistency
              color: isOutlined
                  ? Colors.white
                  : Colors.black, // Text color based on button type
              fontWeight:
                  FontWeight.w600, // Semi-bold text for better visibility
            ),
          ),
        ),
      ),
    );
  }
}
