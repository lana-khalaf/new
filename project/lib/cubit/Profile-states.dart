import 'package:project/Models/login-model.dart';

abstract class ProfileStates {}
class ProfileInitialState extends ProfileStates {}
class ProfileLoadingState extends ProfileStates {}
class ProfileSuccesState extends ProfileStates {
  final UserModel userModel;
  ProfileSuccesState(this.userModel);

}
class ProfileErrortState extends ProfileStates {
  final String error ; // لاظهر ال  error  عالسكرين
  ProfileErrortState(this.error);
}