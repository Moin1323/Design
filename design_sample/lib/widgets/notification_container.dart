import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlossyContainer(
        color: Colors.blue[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.transparent),
        child: const Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Material(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
