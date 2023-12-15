import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/order-details.dart';
import 'package:project/widgets/custom-order.dart';
import 'package:project/widgets/custom-orderDetails.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

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
      body:Padding(
        
          padding: EdgeInsets.only(top: 20),
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 14),
                    child: Text(
                      "ORDER ID",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      "Order Id :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Text(" kh476287967246",
                     style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
               Divider( thickness: 2,),
      
      Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 14),
                    child: Text(
                      "ORDER STATUS",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      "Order Status :",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Text(" dilivered",
                     style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
               Divider( thickness: 2,),
      
      
      Padding(
                    padding: EdgeInsets.only(left: 14, bottom: 14),
                    child: Text(
                      "ORDER DETAILS",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                  ),
      
      SizedBox(
        height: 280,
        child: ListView.builder(
           
          itemCount: orderDetails.productName.length,
          itemBuilder: (context, index) {
            return OrderdetailsWidget(orderDetails: orderDetails, index: index, );
          },
        ),
      ),
      
          
               
         ],
          ),   
        ),
      
      );
    
  }
}
OrderDetails orderDetails=OrderDetails(orderId: '1324341', orderStatus: 'delivered', productName: [
"paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol", "paracetamol","paracetamol", "paracetamol","paracetamol", "paracetamol", 

], productNum: [
  "2","3","4","2","5","2","3","4","2","5","3","4","2","5","3","4","2","5"
]);

