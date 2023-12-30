import 'package:flutter/material.dart';
import 'package:project/Models/order-details-model.dart';

class OrderdetailsWidget extends StatelessWidget {
  const OrderdetailsWidget({super.key, required this.orderDetailsModel});
final OrdersDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      orderDetailsModel.tradeName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200, right: 10),
                    child: Text("\×",
                     style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(orderDetailsModel.quantitiy.toString(),
                     style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                ],
              );
              }
              }
          