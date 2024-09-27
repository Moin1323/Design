import 'package:flutter/material.dart';

class DetailSecreen extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final String title;
  final String description;
  const DetailSecreen({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: buildTextOverlay(title, description),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to build a text overlay
Widget buildTextOverlay(String title, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ],
  );
}
