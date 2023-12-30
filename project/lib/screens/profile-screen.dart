

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/Profile-states.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/profile-cubit.dart';
import 'package:project/cubit/token.dart';

import 'package:project/screens/update-profile-screen.dart';
import 'package:project/screens/welcome-screen.dart';
import 'package:project/widgets/custom-button.dart';
import 'package:project/widgets/custom-profile-listTile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
         if(state is ProfileSuccesState){
          print(state.userModel.phone_number);
          print(state.userModel.name);
           phoneController.text =state.userModel.phone_number!;
          nameController.text =state.userModel.name!;
       
         }
        },
        builder: (context, state) {
         
          var model =ProfileCubit.get(context).userModel;
          nameController.text =model?.phone_number ?? "";
          nameController.text =model?.name ?? "";
       
          if (state is ProfileSuccesState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UpdateProfilePage();
                      },
                    ),
                  );
                },
              ),
              backgroundColor: Colors.blue,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Account'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          const SizedBox(height: 20),
                          ProfileInfo(
                            icon: Icons.person,
                            subtitle: model?.name ?? "Default Name",
                            title: "NAME",
                            controller: nameController,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'name must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 29),
                          ProfileInfo(
                            icon: Icons.phone,
                            subtitle: model?.phone_number ?? "Default Name",
                            title: "Phone Number",
                            controller: phoneController,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'phone must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 29),
                          CustomButton(
                            text: 'LOGOUT',
                            color: Colors.blue,
                            colorText: Colors.white,
                            press: ()async {
                       var temp =  await  DioHelper.getDate(url:"http://127.0.0.1:8000/api/user/logout" );
                       print(temp);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return WelcomeScreen();
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

