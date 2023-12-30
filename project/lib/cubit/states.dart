import 'package:project/Models/login-model.dart';

abstract class LoginStates {}
class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccesState extends LoginStates {
  // final LoginModel loginModel;
  // LoginSuccesState(this.loginModel);
}
class LoginErrortState extends LoginStates {
  final String error ; // لاظهر ال  error  عالسكرين
  LoginErrortState(this.error);
}
class loginChangePasswordVisibilityState extends LoginStates {}
