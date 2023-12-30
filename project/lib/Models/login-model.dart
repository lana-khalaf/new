// class LoginModel {
//   // bool status;
//   // String message;
//    UserData? data;
// LoginModel.fromJson(Map<String,dynamic> json){
//   //  message =json['message'];
//    data =json['data'] != null ? UserData.fromJson(json['data']) : null;
  
// }
// }

// class UserData{
// late int id ;
// late final  String name ;
//  late String phone_number;
//  late String token;
// UserData({
//   required this.id,
//   required this.name,
//   required this.phone_number,
//   required this.token,
// });
// UserData.fromJson(Map<String,dynamic> json){
//   id =json['id'];
//    name =json['name'];
//     phone_number =json['phone_number'];
//      token =json['token'];
// }
// }

class UserModel {
  int? id;
  String? name;
  String? phone_number;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.phone_number,
      this.token
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone_number = json['phone_number'];
     token = json['token'];
   
  }
   
}