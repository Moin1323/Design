import 'package:design_sample/pages/dashboard/detail_secreen.dart';
import 'package:design_sample/widgets/notification_container.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[20],
        body: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                  child: FractionallySizedBox(
                                    alignment: Alignment.topCenter,
                                    widthFactor: 0.95,
                                    heightFactor: 0.8,
                                    child: NotificationContainer(),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.manage_accounts,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10),
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildPlanCard(
                        context,
                        'Training Plan',
                        'lib/assets/background1.jpg',
                        "Personalized workout routines to help you reach your fitness goals efficiently."),
                    buildPlanCard(
                        context,
                        'Meal Plan',
                        'lib/assets/background2.jpg',
                        "Balanced nutrition guides tailored to support your health and fitness objectives."),
                    buildPlanCard(
                        context,
                        'Supplement Plan',
                        'lib/assets/background3.jpg',
                        "Workout plans designed to help you achieve your fitness goals - whether losing weight or building muscle."),
                    buildPlanCard(
                        context,
                        'Progress Tracking',
                        'lib/assets/background4.jpg',
                        "Track your fitness journey with detailed metrics and insights on your achievements."),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  // Helper function to build each plan card
  Widget buildPlanCard(
    BuildContext context,
    String title,
    String imagePath,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailSecreen(
                    imagePath: imagePath,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).height,
                    description: description,
                    title: title), // Make sure to pass the context here
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    //   color: Colors.black.withOpacity(0.4),
                    height: 200,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
