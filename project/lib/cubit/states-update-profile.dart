import 'package:project/Models/login-model.dart';

abstract class UpdateStates {}
class UpdateInitialState extends UpdateStates {}
class UpdateLoadingState extends UpdateStates {}
class UpdateSuccesState extends UpdateStates {
  // final LoginModel loginModel;
  // LoginSuccesState(this.loginModel);
}
class UpdateErrortState extends UpdateStates {
  final String error ; // لاظهر ال  error  عالسكرين
  UpdateErrortState(this.error);
}
