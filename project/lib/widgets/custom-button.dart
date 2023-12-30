import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 CustomButton({this.colorText,super.key, required this.text, required this.color, required this.press});
 final VoidCallback press;
String text;
Color color;
Color? colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
        width: double.infinity,
        height: 50,
    
    
        child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        )
        ,
        onPressed: press,
        child: Text(text,

        
        style: TextStyle(
          fontSize: 22,
          color: colorText,
        ),
        ).tr(),
      ),
      );
       
    

  }
}