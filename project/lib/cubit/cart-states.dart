import 'package:project/Models/cart-model.dart';
import 'package:project/Models/favorites-model.dart';

abstract class CartStates {}
class CartInitialState extends CartStates {}
class CartSuccesState extends CartStates {
  final num? OrderID;
  CartSuccesState(this.OrderID);
}class CartLoadingState extends CartStates {}
class CartErrortState extends CartStates {
  final String error ; // لاظهر ال  error  عالسكرين
  CartErrortState(this.error);
}