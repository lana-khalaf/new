import 'package:project/Models/favorites-model.dart';

abstract class FavoriteStates {}
class FavoriteInitialState extends FavoriteStates {}
class FavoriteSuccesState extends FavoriteStates {
  final List<FavoriteData> favoritesModel;
  FavoriteSuccesState(this.favoritesModel);
}class FavoriteLoadingState extends FavoriteStates {}
class FavoriteErrortState extends FavoriteStates {
  final String error ; // لاظهر ال  error  عالسكرين
  FavoriteErrortState(this.error);
}