
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
import 'package:project/cubit/register-states.dart';
import 'package:project/cubit/states.dart';
import 'package:project/cubit/token.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

   UserModel? userModel;
 
 void getUserData() async{

 
 emit(ProfileLoadingState());
 print('loading');
   try{
    String? token = await AuthManager.getToken();
     var value = await DioHelper.getDate(
      url: PROFILE ,
     token: token,
    ); 
      print(value.data.toString());
       userModel = UserModel.fromJson(value.data[0]);
    
     if (userModel != null) {
        emit(ProfileSuccesState(userModel!));
        print('success');
      } else {
        emit(ProfileErrortState('User model is null'));
      }
    } catch(error) {
      // print(error.toString());
      
      if (error is DioError) {
    print('DioError: ${error.message}');
    emit(ProfileErrortState(error.toString()));
    // Handle DioError specifically
  } else {
    print('Unexpected error: $error');
    emit(ProfileErrortState(error.toString()));
    // Handle other types of errors
  }
    }

 }
}