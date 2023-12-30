
// class LoginCubit extends Cubit<LoginState>
// {
//   LoginCubit() : super(LoginInitialState());
//   static LoginCubit get(context) => BlocProvider.of(context);
// }
import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/cubit/dio-helper.dart';
// import 'package:project/cubit/end-points.dart';
// import 'package:project/cubit/states.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitialState());

//   static LoginCubit get(context) => BlocProvider.of(context);
// void userLogin(
//   {required String email,
//   required String passowrd,
//   }){
//   DioHelper.postData(url:LOGIN,data:
//   {'email':'',
//   'passowrd':'',
//   },
//   ).then((value) { print(value.data);
//   emit(LoginSuccesState());
//   }
//   ).catchError(error){
//     emit(LoginErrortState(error.toString()));
//   };
// }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/login-model.dart';
import 'package:project/cubit/Profile-states.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/cubit/logout-states.dart';
import 'package:project/cubit/register-states.dart';
import 'package:project/cubit/states.dart';
import 'package:project/cubit/token.dart';

class UpdateProfileCubit extends Cubit<UpdateStates> {
  UpdateProfileCubit() : super(UpdateInitialState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

   UserModel? userModel;
 
 void updateUserData({
  required String name,
   required String phone,
  

 }


 ) async{

 
 emit(UpdateLoadingState());
 print('loading');
   try{
    String? token = await AuthManager.getToken();
     var value = await DioHelper.putData(
      url: UPDATE_PROFILE ,
     token: token,
     data : {
      'name': name,
      'phone': phone,
      
     },
    ); 
      print(value.data.toString());
        emit(UpdateSuccesState(userModel!));
        print('success');
     
        // emit(UpdateErrortState('User model is null'));
      
    } catch(error) {
      // print(error.toString());
      
      if (error is DioError) {
    print('DioError: ${error.message}');
    emit(UpdateErrortState(error.toString()));
    // Handle DioError specifically
  } else {
    print('Unexpected error: $error');
    emit(UpdateErrortState(error.toString()));
    // Handle other types of errors
  }
    }

 }
}