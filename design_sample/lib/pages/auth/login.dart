import 'dart:async';
import 'package:design_sample/pages/auth/login_page.dart';
import 'package:design_sample/pages/auth/sign_up.dart';
import 'package:design_sample/pages/dashboard/main_page.dart';
import 'package:design_sample/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late PageController _pageController;
  int _currentPage = 0; // Keeps track of the current page
  Timer? _autoScrollTimer; // Timer for automatic scrolling

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize the PageController

    // Set up a timer to scroll the text automatically every 10 seconds
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      // Calculate the next page index
      int nextPage = (_currentPage + 1) % 4; // Loops back to the first page

      // Animate to the next page
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      // Update the current page
      setState(() {
        _currentPage = nextPage;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the timer and the page controller when the widget is disposed
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: myColors.surface,
      body: Stack(
        children: [
          // Static background image
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              "lib/assets/main_background.jpg", // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),

          // Centered logo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SizedBox(
                width: 200, // Adjust the size of the logo as needed
                height: 200,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "lib/assets/logo.png", // Replace with your logo image path
                        width: 170, // Adjust the size of the logo as needed
                        height: 170,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "F I T W A Y",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          buildContentPageView(height, width), // Slidable text content
        ],
      ),
    );
  }

  // Builder function to create the main content with sliding text
  Widget buildContentPageView(double height, double width) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page; // Update the current page
            });
          },
          children: [
            buildTextContainer(
              "Training Plans",
              "Personalized workout routines to help you reach your fitness goals efficiently.",
            ),
            buildTextContainer(
              "Meal Plans",
              "Balanced nutrition guides tailored to support your health and fitness objectives.",
            ),
            buildTextContainer(
              "Supplements",
              "Workout plans designed to help you achieve your fitness goals - whether losing weight or building muscle.",
            ),
            buildTextContainer(
              "Progress Tracking",
              "Track your fitness journey with detailed metrics and insights on your achievements.",
            ),
          ],
        ),
        // Page Indicator
        Positioned(
          bottom: 160,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPageIndicator(0),
              const SizedBox(width: 10),
              buildPageIndicator(1),
              const SizedBox(width: 10),
              buildPageIndicator(2),
              const SizedBox(width: 10),
              buildPageIndicator(3),
            ],
          ),
        ),
        // Buttons (Login and Sign Up)
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                txt: "Login",
              ),
              const SizedBox(width: 40),
              MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                txt: "Sign up",
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper function to create containers with sliding text content
  Widget buildTextContainer(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build a page indicator (filled or outlined)
  Widget buildPageIndicator(int pageIndex) {
    return Icon(
      pageIndex == _currentPage ? Icons.circle : Icons.circle_outlined,
      size: 10,
      color: Colors.white,
    );
  }
}
