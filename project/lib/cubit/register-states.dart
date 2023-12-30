import 'package:project/Models/login-model.dart';

abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterSuccesState extends RegisterStates {
  // final LoginModel loginModel;
  // RegisterSuccesState(this.loginModel);
}
class RegisterErrortState extends RegisterStates {
  final String error ; // لاظهر ال  error  عالسكرين
  RegisterErrortState(this.error);
}
class RegisterChangePasswordVisibilityState extends RegisterStates {}