import 'package:flutter/material.dart';
import 'package:project/cubit/update-profile-cubit.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-text-field.dart';

class UpdateProfilePage extends StatelessWidget {
   UpdateProfilePage({super.key});
   var formKey =GlobalKey<FormState>();
var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  // TextFormField()
   appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ),
 
  backgroundColor: Colors.white,
      body: Form(
key: formKey,
        child: Column(
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
                  // padding: const EdgeInsets.all(20),
                  children: [
                    const SizedBox(height: 10),
      CustomTextField(icon: Icons.person,hintText: "User Name" ),
                       const SizedBox(height: 20),
                   CustomTextField(icon: Icons.lock,hintText: "Passowrd" ),
                     const SizedBox(height: 20),
                    CustomTextField(icon: Icons.phone,hintText: "Phone Number" ),
                     const SizedBox(height: 30),
                     CustomButton(text: 'UPDATE',color: Colors.white,colorText: Colors.blue, press: () { 
                     if(formKey.currentState != null &&
                            formKey.currentState!.validate()){
                      UpdateProfileCubit.get(context).updateUserData(
                      name: nameController.text,
                       phone: phoneController.text);
                     }
                        Navigator.of(context).pushNamed('profilePage'); 
                      }, 

                      ),
                  ],
      
            ),
              ),
            ),
          ],
        ),
      ),
    );
;
  }
}