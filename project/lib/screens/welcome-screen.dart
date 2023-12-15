import 'package:flutter/material.dart';
import 'package:project/screens/login-screen.dart';
import 'package:project/screens/register-screen.dart';
// import 'package:project/screens/login-screen.dart';
// import 'package:project/screens/register-screen.dart';
import 'package:project/widgets/custom-button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
//       body: Container(
// decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/logo .png"),
//             fit: BoxFit.cover,
//           ),
//         ),

   body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Image.asset('assets/images/logo2.png',
               height: 400,
          )),
        //  Image.asset('assets/images/logo2.png',
        //   height: 450,
        //  ),
        //  SizedBox(
        //   height: 15,
        //  ),
          Text(' WELCOME ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
            ,
            color: Color(0xff0096C8),
          
          ),
          ),
      
      SizedBox(
        height:5 ,
      ),
          Row(
            children: [
              Text('please log in or sign up to continue using this app',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.black,
               
              ),
              ),
            ],
          ),
      SizedBox(
        height: 18,
      ),
          
       
        GestureDetector(
           onTap: () {
              /*    Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context ) => LoginPage()
                  //  {
                  //   return LoginPage();
                  // }
                  ,),);*/
                  // Navigator.pushNamed(context, 'login')
                //  Navigator.pushNamed(context, 'LoginPage');
                Navigator.of(context).pushNamed('LoginPage');
                },
          child: CustomButton(text: 'LOG IN',color: Color(0xff0096C8), press: () {   Navigator.of(context).pushNamed('LoginPage'); },),
          ),

         SizedBox(
        height: 27,
      ),

          GestureDetector(
             onTap: () {
              
                  //   Navigator.push(context, MaterialPageRoute(builder: (context ) 
                  //   {
                  //   return RegisterPage();
                  // }
                  // ,),);
                    Navigator.pushNamed(context, 'register');
                 
                },
            child: CustomButton(text: 'SIGN UP',color: Color(0xff0096C8), press: () {    Navigator.pushNamed(context, 'register'); },)),
          SizedBox(
        height: 30,
      ),
       
      
        ],
          ),
        ),
    ); 
    
  }
}
  
