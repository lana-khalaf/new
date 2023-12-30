import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/order-details-model.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/widgets/custom-order.dart';
import 'package:project/widgets/custom-orderDetails.dart';

class OrderDetailsPage extends StatelessWidget {
   OrderDetailsPage({super.key,required this.id});
  int id;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       title: Text("Order's Details"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  FutureBuilder(
          future: DioHelper.getDate(url: ORDERDETAILES+'/${id}', ),
          builder: (context, status) {
            if (status.hasData) {
              print(status.data);
              dynamic temp2 = status.data;
              List<OrdersDetailsModel> ordersDetails = List.generate(temp2.data['data'].length,
                  (index) => OrdersDetailsModel.fromJson(temp2.data['data'][index]));

              // return ListView.separated(
              //     itemBuilder: (context, index) => Order(
              //         id: orders[index].id as int,
              //         orderStatus: orders[index].status),
              //     separatorBuilder: (context, index) => Divider(
              //       indent: 40,
              //       endIndent: 40,
              //     ),
              //     itemCount: orders.length);
              
              // Padding(
        
      //     padding: EdgeInsets.only(top: 20),
      //     child: Column(
           
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //           Padding(
      //               padding: EdgeInsets.only(left: 14, bottom: 14),
      //               child: Text(
      //                 "ORDER ID",
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(left: 14),
      //               child: Text(
      //                 "Order Id :",
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(right: 13),
      //               child: Text( ordersDetails[index].order_id as String,
      //                style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //          Divider( thickness: 2,),
      
      // Padding(
      //               padding: EdgeInsets.only(left: 14, bottom: 14),
      //               child: Text(
      //                 "ORDER STATUS",
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(left: 14),
      //               child: Text(
      //                 "Order Status :",
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(right: 13),
      //               child: Text(" dilivered",
      //                style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //          Divider( thickness: 2,),
      
      
      // Padding(
      //               padding: EdgeInsets.only(left: 14, bottom: 14),
      //               child: Text(
      //                 "ORDER DETAILS",
      //                 style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 22,
      //                 ),
      //               ),
      //             ),
      
      // SizedBox(
      //   height: 280,
      //   child:
       return   ListView.builder(
           
          itemCount: ordersDetails.length,
          itemBuilder: (context, index) {
            return OrderdetailsWidget(orderDetailsModel: ordersDetails[index] );
          },
        );
      // ),
      
          
               
        //  ],
        //   ),   
        // ),
      
      

            } else {
              return Center(
                child: LinearProgressIndicator(),
              );
            }
          },
        )
     );
    
  }
}
// OrderDetails orderDetails=OrderDetails(orderId: '1324341', orderStatus: 'delivered', productName: [
// "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol","paracetamol", "paracetamol","paracetamol", "paracetamol", 

// ], productNum: [
//   "2","3","4","2","5","2","3","4","2","5","3","4","2","5","3","4","2","5"
// ]);


 