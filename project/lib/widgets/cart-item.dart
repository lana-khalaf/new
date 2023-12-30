
import 'package:flutter/material.dart';
import 'package:project/Models/cart-model.dart';
import 'package:project/cubit/cart-cubit.dart';

class CartItem2 extends StatefulWidget {
  final Cart cart;
final VoidCallback onDelete;

  const CartItem2({Key? key, required this.cart, required this.onDelete}) : super(key: key);

  @override
  _CartItem2State createState() => _CartItem2State();
}

class _CartItem2State extends State<CartItem2> {

  @override
  Widget build(BuildContext context) {
    //     context.read<CartCubit>().addDetailsOrderCart(
    //       medicine_id: widget.cart.productName, // Replace with the actual medicine ID
    //       quantity: cart.quantity,
    // );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 236, 236),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/order_logo2.jpg"),
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        child: Text(
                          widget.cart.productName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap:(){widget.onDelete();
                          
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        
                        "\$${widget.cart.totalPrice}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: 155,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 238, 236, 236),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                     if (widget.cart.quantity > 0){
                                    setState(() {
                                      widget.cart.quantity--;
                                      updateTotalPrice();
                                    });}
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Image.asset(
                                      "assets/images/minus.png",
                                      height: 20,
                                      width: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${widget.cart.quantity}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 238, 236, 236),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    
                                    setState(() {
                                      widget.cart.quantity++;
                                      updateTotalPrice();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Image.asset(
                                      "assets/images/plus.png",
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void updateTotalPrice() {
    widget.cart.totalPrice = widget.cart.quantity * widget.cart.productPrice;
  }
}
