import 'package:flutter/material.dart';
import 'package:project/Models/order-details.dart';

class OrderdetailsWidget extends StatelessWidget {
  const OrderdetailsWidget({super.key,  required this.index, required this.orderDetails});
final OrderDetails orderDetails;
final int index;
  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      orderDetails.productName[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200, right: 10),
                    child: Text("×",
                     style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(orderDetails.productNum[index],
                     style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                ],
              );
              }
              }
          