import 'package:flutter/material.dart';
import 'package:project/screens/order-details.dart';

class Order extends StatelessWidget {
   Order({super.key, required this.id, required this.orderStatus});
int id ;
String orderStatus;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
                child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     SizedBox(
                    width: 10,
                   ),
                    Image.asset('assets/images/order_logo2.jpg'),
                   SizedBox(
                    width: 30,
                   ),
 Text('order id : $id',
                    style: TextStyle(
                      fontSize: 20
                    ),),

                    
                    
                  ],
                ),
              ),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                thickness: 3,
              ),
            ),
      
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  // Container(
                  //     decoration: BoxDecoration(
                      
                  //        borderRadius:BorderRadius.circular(20),
                  //       border: Border.all(
                         
                  //         color: Colors.black),
                  //     ),
                  //      child: Padding(
                  //        padding: const EdgeInsets.all(8.0),
                  //        child: Text(orderStatus,
                  //                        style: TextStyle(
                  //         fontSize: 16,
                  //                        ),),
                  //      ),
                  //    ),
                   
                    // Container(
      //                     decoration: BoxDecoration(
      //                        borderRadius:BorderRadius.circular(20),
                     
      // color: Colors.blue,
                    //  ),
                        ElevatedButton(
            child: Text("Details", style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                                         ),
                                         ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              elevation: 0,
            ),
            onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context ) {
                    return OrderDetailsPage();
                  },),);},
          ),
      
                    //    Padding(
                    //      padding: const EdgeInsets.all(8.0),
                    //      child: Text('Details',
                    //                      style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.white,
                    //                      ),),
                    //    ),
                    //  ),
                  ],
            
                ),
            
              ),
            
      
            ],
                ),
            )
          ),
        ),
      );
  }
}