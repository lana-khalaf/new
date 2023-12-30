import 'package:flutter/material.dart';
import 'package:project/Models/cart-model.dart';

class ShopItem{
  final Cart product ; //هون لازم اخد المنتج من غنى 
  final int quantity;

  ShopItem({required this.product, required this.quantity});

}
