import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.suffixIcon,this.hintText, required this.icon});
String? hintText;
IconData icon;
IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      

decoration: InputDecoration(
  prefixIcon: Icon(icon,
  color: Colors.white,
  
  ),
 
  suffixIcon: Icon(suffixIcon,
  ),

  hintText: hintText,
hintStyle: TextStyle(
  color: Colors.white,
),
  
  
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    )
  ),
 focusedBorder:OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    )
  ), 
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    )
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    )
  )
),
  );
  }
}