import 'package:design_sample/pages/auth/login.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  // Mock user data
  final String userName = "John Doe";
  final String email = "johndoe@example.com";

  // Method for logging out
  void logOut(BuildContext context) {
    // Clear the entire navigation stack and navigate to the Login screen
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Login()),
      (route) =>
          false, // This condition removes all routes until the login screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // User Avatar
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Text(
                  userName[0], // Display first letter of the username
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // User Info
            Center(
              child: Column(
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Edit Profile Button
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.black),
              title: const Text('Edit Profile'),
              onTap: () {
                // Navigate to Edit Profile screen
              },
            ),

            // Change Password Button
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.black),
              title: const Text('Change Password'),
              onTap: () {
                // Navigate to Change Password screen
              },
            ),

            // Settings Button
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings screen
              },
            ),

            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('Log Out'),
              onTap: () => logOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
