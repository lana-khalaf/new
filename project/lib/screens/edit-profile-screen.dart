import 'package:flutter/material.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-text-field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // TextFormField()
 
  backgroundColor: Colors.white,
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
                Text('Edit Account'.toUpperCase(), style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                )),
               
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                )
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 20),
CustomTextField(icon: Icons.person,hintText: "User Name" ),
                     const SizedBox(height: 29),
                 CustomTextField(icon: Icons.lock,hintText: "Passowrd" ),
                   const SizedBox(height: 29),
                  CustomTextField(icon: Icons.phone,hintText: "Phone Number" ),
                   const SizedBox(height: 60),
                   CustomButton(text: 'UPDATE',color: Colors.white, press: () {  Navigator.of(context).pushNamed('profilePage');  }, ),
                ],

          ),
            ),
          ),
        ],
      ),
    );
;
  }
}