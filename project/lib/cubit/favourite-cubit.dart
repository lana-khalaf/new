 import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/favorites-model.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/cubit/favorite-states.dart';
import 'package:project/cubit/register-states.dart';
import 'package:project/Models/login-model.dart';
import 'package:project/cubit/token.dart';

// Map<int,bool> favorites = {
//     1:false, 2:true , 3:true , 4: false
//   };
// homeModel.data.products.forEach((Element)){
//   favorites.addAll({
//     Element.id:Element.inFavourites,
//   });
// }
// void changeFavorites(int productId){
//   DioHelper.postData(url: url, data: data). then((value) {}).catchError((error) {});
// }
// class FavouriteCubit extends Cubit<>
class FavoritesCubit extends Cubit<FavoriteStates> {
  FavoritesCubit() : super(FavoriteInitialState());

  static FavoritesCubit get(context) => BlocProvider.of(context);
 FavoritesModel? favoritesModel ;
void getFavorites ()
async {
 emit(FavoriteLoadingState());
   try{
    String? token = await AuthManager.getToken();
     var value = await DioHelper.getDate(
      url: FAVORITES ,
     token: token,
     
    ); 
      // print(value.data.toString());
      //  favoritesModel = FavoritesModel.fromJson(jsonDecode(value.data));
    
      // emit(FavoriteSuccesState(favoritesModel!));
       if (value.statusCode != 200) {
      // Handle HTML error response
      emit(FavoriteErrortState('HTML error response'));
      print('dfjka');
    } else {
      List<FavoriteData> favoriteData = List.generate(value.data['Data'].length, (index) => FavoriteData.fromJson(value.data['Data'][index])) ;
      emit(FavoriteSuccesState(favoriteData));
      print('jlk');
    }
    } catch(error) {
      // print(error.toString());
      
      if (error is DioError) {
    print('DioError: ${error.message}');
    emit(FavoriteErrortState(error.toString()));
    // Handle DioError specifically
  } else {
    print('Unexpected error: $error');
    emit(FavoriteErrortState(error.toString()));
    // Handle other types of errors
  }
    }
}
 
}