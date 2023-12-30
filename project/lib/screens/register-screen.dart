// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/screens/login-screen.dart';
// import 'package:project/screens/register-screen.dart';
// import 'package:project/widgets/custom-button.dart';
// import 'package:project/widgets/custom-text-field.dart';

// class RegisterPage extends StatelessWidget {
//   RegisterPage({super.key});
//   var formKey = GlobalKey<FormState>();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginStates>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//       child: Scaffold(
//         backgroundColor: Color(0xff2B475E),
//         body: SafeArea(
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/start-screen.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     ' pharmacy app',
//                     style: TextStyle(
//                       fontSize: 44,
//                       color: Colors.white,
//                       fontFamily: 'pacifico',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   CustomTextField(hintText: "User Name", icon: Icons.person),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   CustomTextField(
//                     icon: Icons.lock,
//                     suffixIcon: Icons.remove_red_eye,
//                     hintText: "Password",
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   CustomTextField(
//                     icon: Icons.phone,
//                     hintText: "Phone Number",
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   CustomButton(
//                     text: 'SIGN UP',
//                     color: Colors.white,
//                     press: () {},
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'already have an account ?',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return LoginPage();
//                               },
//                             ),
//                           );
//                         },
//                         child: Text(
//                           '  LOG IN',
//                           style: TextStyle(
//                             // color: Color(0xff2296F3),
//                             color: Colors.black,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/cubit.dart';
import 'package:project/cubit/register-cubit.dart';
import 'package:project/cubit/register-states.dart';
import 'package:project/cubit/states.dart';
import 'package:project/screens/login-screen.dart';
import 'package:project/screens/register-screen.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/widgets/custom-text-field.dart';
// import 'package:conditional_builder/conditional_builder.dart';
class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
var formKey =GlobalKey<FormState>();
final TextEditingController phoneController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
  Widget defaultFormField({
    required TextEditingController controller,
    required TextInputType type,
    String? Function(String?)? validate, required String label,  IconData? prefix,  IconData? suffix,  Null Function()? suffixPressed, required bool isPassword, required Null Function(dynamic value) onSubmit,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      obscureText: true,
      onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: prefix != null ? Icon(prefix) : null,
      suffixIcon: suffix != null
          ? IconButton(
              icon: Icon(suffix),
              onPressed: () {
                // Handle suffix button press
              },
            )
          : null,
    ),
      // Add other TextFormField properties as needed
    );
  }
  Widget defaultButton({required Function() function, required String text}) {
    return ElevatedButton(
      onPressed: function,
      child: Text(text),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          // model
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xff2B475E),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/start-screen.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' pharmacy app',
                          style: TextStyle(
                            fontSize: 44,
                            color: Colors.white,
                            fontFamily: 'pacifico',
                          ),
                        ),
                    
                        defaultFormField(
                                 controller: nameController,
                                 type:TextInputType.visiblePassword,
                                
                                 onSubmit: (value){
                                 if (formKey.currentState!.validate()){
                                  RegisterCubit.get(context).userRegister(password: passwordController.text, phone_number: phoneController.text, name: nameController.text);
                                 }
                                 },
                                 isPassword:true,
                                 suffixPressed: (){},
                                 validate:(String? value){
                                 if (value == null || value.isEmpty){
                                  return 'please enter your username';
                                 }
                                 },
                                 label: 'User Name',
                                 prefix:Icons.person_outline,
                                 ),
                               SizedBox(
                          height: 3,
                        ),
                        defaultFormField(
                        controller: phoneController,
                        type:TextInputType.phone,
                        
                        validate:(String? value){
                        if (value == null || value.isEmpty){
                          return 'please enter your Phone Number';
                        }
                        },
                        label: 'Phone Number',
                        prefix:Icons.phone_outlined, 
                        isPassword: false,
                         onSubmit: (value) {  
                                 if (formKey.currentState!.validate()){
                                  RegisterCubit.get(context).userRegister(password: passwordController.text, phone_number: phoneController.text, name: nameController.text);
                                 }
                                 
                                 },
                        
                        ),
                        // CustomTextField(
                        //   hintText: "Phone Number",
                        //   icon: Icons.phone,
                        // // ),
                        // SizedBox(
                        //   height: 3,
                        // ),
                                 defaultFormField(
                                 controller: passwordController,
                                 type:TextInputType.visiblePassword,
                                 suffix:RegisterCubit.get(context).suffix,
                                 onSubmit: (value){
                                 if (formKey.currentState!.validate()){
                                  RegisterCubit.get(context).userRegister(password: passwordController.text, phone_number: phoneController.text, name: nameController.text);
                                 }
                                 },
                                 isPassword:RegisterCubit.get(context).isPassowrd,
                                 suffixPressed: (){
                                  RegisterCubit.get(context).changePasswordVisibility();
                                 },
                                 validate:(String? value){
                                 if (value == null || value.isEmpty){
                                  return 'please enter your passowrd';
                                 }
                                 },
                                 label: 'Passowrd',
                                 prefix:Icons.lock_outline,
                                 ),
                              
                        // CustomTextField(
                        //   hintText: "Password",
                        //   icon: Icons.lock,
                        //   suffixIcon: Icons.remove_red_eye,
                        // ),
                        SizedBox(
                          height: 6,
                        ),
                        // ConditionalBuilder(
                        //   condition: state is! LoginLodingState,
                        //   builder: (context)=>
                        //   defaultButton(
                        //     function (){
                        //       LoginCubit.get(context).userLogin(email: " $emailController", passowrd: passowrdController.text);
                          
                        //     },
                        //     text:'LOGIN',
                              
                        //   ),
                        //   fallback: (context)=> Center(child: CircularProgressIndicator()),
                              Builder(
                                    builder: (context) {
                    // if (state is LoginLoadingState) {
                    //   return Center(child: CircularProgressIndicator());
                    // } else {
                      // return defaultButton(
                      //   function: () {
                      //     if (formKey.currentState!.validate())
                      //     LoginCubit.get(context).userLogin(
                      //       email: "$phoneController",
                      //       passowrd: passowrdController.text,
                      //     );
                      //   },
                      //   text: 'LOGIN',
                      // );
                      if (state is RegisterLoadingState) {
                                //print('success');
                                    return Center(child: CircularProgressIndicator());
                                  } else if (state is RegisterSuccesState) {
                                    // Navigate to the next screen or perform other actions upon successful login
                                    print('success');
                                  } else if (state is RegisterErrortState) {
                                    // Handle error state, display an error message or take appropriate action
                                    print('Register failed: ${(state as RegisterErrortState).error}');
                                  } else{
                      return CustomButton(text: 'SIGNUP',colorText: Colors.black, color:  Colors.white, press:
                       () {
                                  if (formKey.currentState!.validate())
                                  RegisterCubit.get(context).userRegister(
                                    phone_number: phoneController.text,
                                    password: passwordController.text, 
                                    name: nameController.text,
                                  );
                                },
                       );
                    }
                    return Container();
                                    },
                                  ),
                              
                              
                          // child:
                          //  CustomButton(
                          //   text: 'LOGIN',
                          //   color: Colors.white,
                          //   press: () {
                          //     if(formKey.currentState!.validate()){
                          //     LoginCubit.get(context).userLogin(email:" $emailController", passowrd: passowrdController.text,);
                          //   }
                          //   },
                          // ),
                              
                        
                        // fallback: (context)=> CircularProgressIndicator(),
                        // ),
                        
                              
                        // SizedBox(
                        //   height: 2,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'already have an account ?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                '  LOG IN',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
