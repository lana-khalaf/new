import 'package:flutter/material.dart';
import 'package:project/Models/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/cart-model.dart';
import 'package:project/Models/shop_item.dart';
import 'package:project/widgets/custom-cart-header.dart';
import 'package:project/widgets/custom-empty-cart.dart';



class CartItem extends StatelessWidget {
     final Cart cart;
  const CartItem({
    super.key,
    required this.cart,

  });

//   @override
 
  @override
  Widget build(BuildContext context) {
   
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 19,vertical: 20),
      child: Row(children: [
        Image.asset("assets/images/order_logo2.jpg",
        height: 100,),
        SizedBox(width:20 ,),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom:
                BorderSide(
                  width: .5,
                  color: Colors.grey,
                )
              )),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cart.productName,
                    style:  TextStyle(
                      fontSize: 18
                    ),),
                     Icon(
                                     Icons.delete,
                                     color: Colors.red.shade800,
                                   )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
          
                    Text("\$${cart.totalPrice}",
                    style:  TextStyle(
                      fontSize: 18
                    ),),
          
                    Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
          //                SizedBox(
          //   width:50 ,
          // ),
          //  Container(
          //   color: Colors.grey,
          //  ),
                        GestureDetector(
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                               
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/red-minus.png",
                              height: 20,),
                            ),
                          ),
                        ),
          Text("{cart.quantity}",
          style: TextStyle(
            fontSize: 20
          ),),
         
           GestureDetector(
            
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                                               
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/plus-icon.png",
                              height: 20,
                              width: 20,),
                            ),
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      
      ],),
    );
  }
}
