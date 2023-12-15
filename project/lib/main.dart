
import 'package:flutter/material.dart';
import 'package:project/screens/edit-profile-screen.dart';

import 'package:project/screens/login-screen.dart';
import 'package:project/screens/my-orders-screen.dart';
import 'package:project/screens/order-details.dart';
import 'package:project/screens/profile-screen.dart';
import 'package:project/screens/register-screen.dart';
import 'package:project/screens/welcome-screen.dart';

void main() {
  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: {
       
        'LoginPage': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        // 'mainPage': (context) => mainPage(),
        'profilePage': (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    // home: WelcomeScreen(),
    home: WelcomeScreen(),
    );
  }
}
