
// import 'package:flutter/material.dart';
// import 'package:project/Models/cart-model.dart';

// class FavouriteItem extends StatefulWidget {
//   final Cart cart;
// final VoidCallback onDelete;
//   const FavouriteItem({Key? key, required this.cart, required this.onDelete}) : super(key: key);

//   @override
//   _FavouriteItemState createState() => _FavouriteItemState();
// }

// class _FavouriteItemState extends State<FavouriteItem> {

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         width: double.infinity,
//         height: 150,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 238, 236, 236),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.asset(widget.cart.image),
//               ),
//             ),
//             Flexible(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 140,
//                         child: Text(
//                           widget.cart.productName,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: GestureDetector(
//                           onTap:(){widget.onDelete();},
//                           child: Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [

                     
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
  
// }
import 'package:flutter/material.dart';
import 'package:project/Models/cart-model.dart';
import 'package:project/Models/favorites-model.dart';

class FavouriteItem extends StatefulWidget {
  // final Cart cart;
 final FavoriteData data;
  //
  final VoidCallback onDelete;
  const FavouriteItem({Key? key, required this.data, required this.onDelete}) : super(key: key);
 
  @override
  _FavouriteItemState createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
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
                child: Image.asset('assets/images/order_logo2.jpg'),
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
                          widget.data.medicineTradeName,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            widget.onDelete();
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                      // Add more widgets as needed
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
}

