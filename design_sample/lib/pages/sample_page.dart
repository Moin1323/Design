import 'dart:ui';
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your main content here (can be any widget)
          Container(
            color: Colors.blue, // Example background color
            child: const Center(
              child: Text(
                'This is the main content',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          // Blurred layer
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black
                    .withOpacity(0.4), // Adds a semi-transparent overlay
              ),
            ),
          ),
        ],
      ),
    );
  }
}
