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
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/end-points.dart';
import 'package:project/cubit/register-states.dart';
import 'package:project/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister({
     required String name,
    required String phone_number,
    required String password,
  }) async {
    emit(RegisterLoadingState());
   try{ var value = await DioHelper.postData(
      url: REGISTER,
      data: {
        'phone_number': phone_number,
         'name': name, // Use the provided parameter instead of an empty string
        'password': password, // Use the provided parameter instead of an empty string
      },
    ); 
      print(value.data);
      emit(RegisterSuccesState());
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
  emit(RegisterErrortState(error.toString()));
    }
  }
  IconData suffix =Icons.visibility_outlined;
  bool isPassowrd= true;
  void changePasswordVisibility(){
isPassowrd = !isPassowrd;
suffix = isPassowrd ? Icons.visibility_outlined : Icons.visibility;
emit(RegisterChangePasswordVisibilityState());
  }
}
