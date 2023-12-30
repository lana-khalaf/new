// import 'package:project/cubit/states.dart';

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
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/cubit/states.dart';
import 'package:project/cubit/token.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  late UserModel userModel;
  Future<void> userLogin({
    required String phone_number,
    required String password,
  }) async {
    emit(LoginLoadingState());
   try{ var value = await DioHelper.postData(
      url: LOGIN,
      data: {
        'phone_number': phone_number, // Use the provided parameter instead of an empty string
        'password': password, // Use the provided parameter instead of an empty string
      },
    ); 
     
      print(value.data);
      userModel= UserModel.fromJson(value.data);
    AuthManager.storeToken(userModel.token!);
      emit(LoginSuccesState());
    } catch(error) {
      // print(error.toString());
      // emit(LoginErrortState(error.toString()));
      if (error is DioError) {
    print('DioError: ${error.message}');
    // Handle DioError specifically
  } else {
    print('Unexpected error: $error');
    // Handle other types of errors
  }
  emit(LoginErrortState(error.toString()));
    }
  }
  IconData suffix =Icons.visibility_outlined;
  bool isPassowrd= true;
  void changePasswordVisibility(){
isPassowrd = !isPassowrd;
suffix = isPassowrd ? Icons.visibility_outlined : Icons.visibility;
emit(loginChangePasswordVisibilityState());
  }
 
}
