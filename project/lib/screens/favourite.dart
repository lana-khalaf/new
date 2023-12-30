// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/Models/cart-model.dart';
// import 'package:project/cubit/favorite-states.dart';
// import 'package:project/cubit/favourite-cubit.dart';
// import 'package:project/widgets/empty_favourite.dart';
// import 'package:project/widgets/favourite-item.dart';

// class FavouritePage extends StatefulWidget {
//   const FavouritePage({super.key});

//   @override
//   State<FavouritePage> createState() => _FavouritePageState();
// }

// class _FavouritePageState extends State<FavouritePage> {

//   @override
//   Widget build(BuildContext context) {

//     return BlocConsumer<FavoritesCubit, FavoriteStates>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state){
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: BackButton(
//             color: Colors.red,
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           centerTitle: true,
//           title: Text(
//             "My Favourite ",
//             style: TextStyle(
//               color: Colors.red,
//               fontSize: 32,
//             ),
//           ),
//         ),
//         body: SafeArea(
//           bottom: false,
//           // child: Visibility(
//           //   visible: favouriteItem.isNotEmpty,
//           //   child: NotEmptyCart(),
//          child:   FavoritesCubit.get(context).favoritesModel.data.isNotEmpty
//               ? NotEmptyFavourite()
//               : EmptyFavourite(),
//           ),

//       );
//         },
//     );
//   }

//   Widget NotEmptyFavourite() {
//     return ListView.builder(
//       itemCount:  FavoritesCubit.get(context).favoritesModel.data.length,
//       //favouriteItem.length,
//       itemBuilder: (context, index) => FavouriteItem(
//        data: FavoritesCubit.get(context).favoritesModel.data[index],
//         // cart: favouriteItem[index],
//         onDelete: () {
//           setState(() {
//             // favouriteItem.removeAt(index);
//           });
//         },
//       ),

//     );
//   }
// }
// // List<Cart> favouriteItem= [
// // Cart(productPrice: 50, id: 1, productId: 1, productName: "paracetamol", image: "assets/images/order_logo2.jpg"),
// // Cart(productPrice: 50, id: 1, productId: 1, productName: "paracetamol", image: "assets/images/order_logo2.jpg"),
// // Cart(productPrice: 50, id: 1, productId: 1, productName: "paracetamol", image: "assets/images/order_logo2.jpg"),
// // Cart(productPrice: 50, id: 1, productId: 1, productName: "paracetamol", image: "assets/images/order_logo2.jpg"),
// // Cart(productPrice: 50, id: 1, productId: 1, productName: "paracetamol", image: "assets/images/order_logo2.jpg")
// // ];

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/cart-model.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/cubit/favorite-states.dart';
import 'package:project/cubit/favourite-cubit.dart';
import 'package:project/widgets/empty_favourite.dart';
import 'package:project/widgets/favourite-item.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit()..getFavorites(),
      child: BlocConsumer<FavoritesCubit, FavoriteStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FavoriteSuccesState) {
            return Scaffold(
              body: ListView.builder(
                itemCount: state.favoritesModel.length,
                itemBuilder: (context, index) => FavouriteItem(
                  data: state.favoritesModel[index],
                  onDelete: () {
                    setState(() {
                      // Handle onDelete logic
                    });
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // Widget NotEmptyFavourite() {
  //   return ListView.builder(
  //     itemCount: FavoritesCubit.get(context).favoritesModel?.data?.length ?? 0,
  //     itemBuilder: (context, index) => FavouriteItem(
  //       data: FavoritesCubit.get(context).favoritesModel!.data[index],
  //       onDelete: () {
  //         setState(() {
  //           // Handle onDelete logic
  //         });
  //       },
  //     ),
  //   );
  // }
}
