import 'package:flutter/material.dart';

class EmptyFavourite extends StatelessWidget {
  const EmptyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset('assets/images/no-favourites.png',
       fit: BoxFit.fill,),
      );
  }
}