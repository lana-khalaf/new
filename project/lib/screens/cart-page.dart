import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/cart-model.dart';
import 'package:project/Models/shop_item.dart';
import 'package:project/cubit/cart-cubit.dart';
import 'package:project/cubit/cart-states.dart';
import 'package:project/screens/cart-item.dart';
import 'package:project/widgets/cart-item.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-cart-header.dart';
import 'package:project/widgets/custom-empty-cart.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//       // Cart item = context.read<AppStateCubit>().products.first;
//   //  ShopItem shopItem= ShopItem(product: item, quantity: 2);

//     return Scaffold(
//       appBar: AppBar(
//          leading: BackButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//            centerTitle: true,
//         title:    Text("My cart",
//         style: TextStyle(
//           fontSize: 32
//         ),)
//       ),
// body: SafeArea(
//   bottom: false,
//   child:carts.isNotEmpty
//             ? NotEmptyCart()
//             : EmptyCart(),

//     // EmptyCart()

// ),

//     );
//   }
//     Widget NotEmptyCart (){
//     ListView.builder(
//                 itemCount: carts.length,

//                 itemBuilder: (context, index) => CartItem2(cart: carts[index], onDelete: () {
//                   setState(() {
//                     carts.removeAt(index);
//                   });
//                  },)
//               );
//               }
// }

// // class ShoppingList extends StatelessWidget {
// //   final List<ShopItem> shopItems ;
// //   const ShoppingList({
// //     super.key, required this.shopItems,
// //   });

// //   @override
// //   Widget build(BuildContext context) {

// //     return   Flexible(
// //       child: ListView(

// //         children: [
// //         shopItems.map((e) => ShopListItemWidget( shopItem: e,)).toList(),
// //         ],

// //       ),
// //     );
// //   }
// // }
class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.id});
  final int id;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, index) => CartItem2(
                      cart: carts[index],
                      onDelete: () {
                        setState(() {
                          carts.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: CustomButton(
                    text: "Check out",
                    color: Colors.blue,
                    press: () {
                      for (var element in carts) {
                        CartCubit.get(context).AddDetailsOrderCart(
                          id: widget.id.toString(),
                            medicine_id: element.productId.toString(),
                            Quantity: element.quantity.toString());
                        print(element);
                      }
                    },
                    colorText: Colors.black,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

  // Cart item = context.read<AppStateCubit>().products.first;
  //  ShopItem shopItem= ShopItem(product: item, quantity: 2);

//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: Text(
//           "My cart",
//           style: TextStyle(
//             fontSize: 32,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         bottom: false,
//         child: carts.isNotEmpty
//             ? NotEmptyCart()
//             : EmptyCart(),
//       ),
//     );
//   }

  // Widget NotEmptyCart() {
  //   return
