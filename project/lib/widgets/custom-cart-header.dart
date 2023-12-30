import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {

  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration:  BoxDecoration(border: Border(bottom: BorderSide( width: .5 , color:Colors.grey ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
        
          children: [
        
            Text("My cart",
        
            style: TextStyle(
        
              fontSize: 32
        
            ),)
        
          ],
        
        ),
      ),
    );
  }
}