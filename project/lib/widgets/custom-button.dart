import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 CustomButton({super.key, required this.text, required this.color, required this.press});
 final VoidCallback press;
String text;
Color color;
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
        onPressed: (){press;},
        child: Text(text,

        
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        ),
      ),
      );
       
    

  }
}