import 'package:flutter/material.dart';
import 'package:project/screens/register-screen.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-text-field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        height:16 ,
      ),
         
  
          CustomTextField(
            hintText: "Phone Number", icon: Icons.phone,
          ),
          SizedBox(
        height: 10,
      ),
          CustomTextField(
          hintText: "Password",
           icon: Icons.lock,
           suffixIcon: Icons.remove_red_eye,
           
        
        ),
        SizedBox(
        height: 10,
      ),
        CustomButton(text: 'LOG IN',color: Colors.white, press: () {  },),
          SizedBox(
        height: 15,
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('don\'t have an account ?',
            style: TextStyle(
              color: Colors.white,
            ),),
              GestureDetector(
                        onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context ) {
                    return RegisterPage();
                  },),);
                },
                child: Text('  SIGN UP',
                        style: TextStyle(
                color: Colors.black,
                        ),),
              )
          ],
        ),
        SizedBox(
        height: 37,
      ),
        ],
          ),
        ),
      ),
    );
  }
}