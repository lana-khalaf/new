import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Column(
         crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [Image.asset('assets/images/empty_image.jpg',
      height: 390,),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Your shopping cart is ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),),
            ),
             Text("empty ",
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
        
        child: Center(
          child: Text("Look like you haven\'t made your choice yet ",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black.withOpacity(.5),
          ),),
        ),
      )
      ],),
    );
  }
}

