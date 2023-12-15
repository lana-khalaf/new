import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/custom-profile-listTile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // TextFormField()
  floatingActionButton: FloatingActionButton(child: Icon(Icons.edit), onPressed:(){}),
  backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Account'.toUpperCase(), style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )),
               
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 20),
                  ProfileInfo(icon: Icons.person, subtitle: "lana", title: "NAME"),
                     const SizedBox(height: 29),
                  ProfileInfo(icon: Icons.lock, subtitle: "123453", title: "Password"),
                   const SizedBox(height: 29),
                  ProfileInfo(icon: Icons.phone, subtitle: "0988888888", title: "Phone Number"),
                ],

          ),
            ),
          ),
        ],
      ),
    );

    
  }
}