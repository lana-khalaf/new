
  import 'package:flutter/material.dart';
import 'package:project/screens/login-screen.dart';
import 'package:project/screens/register-screen.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-text-field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
      backgroundColor: Color(0xff2B475E),
      body: Container(
decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/start-screen.jpg"),
            fit: BoxFit.cover,
          ),
        ),


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
        children: [
         
          Text(' pharmacy app',
          style: TextStyle(
            fontSize: 44,
            color: Colors.white,
            fontFamily: 'pacifico',
          ),
          ),
            
          
      SizedBox(
        height: 8,
      ),
          CustomTextField(
            hintText: "User Name",
             icon: Icons.person
          ),
          SizedBox(
        height: 5,
      ),
          CustomTextField(
             icon: Icons.lock,
           suffixIcon: Icons.remove_red_eye,
          hintText: "Password",
        
        ),
         SizedBox(
        height: 5,
      ),
           CustomTextField(
             icon: Icons.phone,
          
          hintText: "Phone Number",
        
        ),
        SizedBox(
        height: 10,
      ),
        CustomButton(text: 'SIGN UP',color: Colors.white, press: () {   },),
          SizedBox(
        height: 5,
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('already have an account ?',
            style: TextStyle(
              color: Colors.white,
            ),),
              GestureDetector(
                        onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context ) {
                    return LoginPage();
                  },),);
                },
                child: Text('  LOG IN',
                        style: TextStyle(
                // color: Color(0xff2296F3),
                color: Colors.black,
                        ),),
              )
          ],
        ),
      SizedBox(
        height: 20,
      )
        ],
          ),
        ),
      ),
    );
  }
}