// import 'package:flutter/material.dart';EasyLocalization
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/cubit/favourite-cubit.dart';
// import 'package:project/cubit/profile-cubit.dart';
// import 'package:project/screens/cart-item.dart';
// import 'package:project/screens/edit-profile-screen.dart';
// import 'package:project/screens/cart-page.dart';
// import 'package:project/screens/favourite.dart';

// import 'package:project/screens/login-screen.dart';
// import 'package:project/screens/my-orders-screen.dart';
// import 'package:project/screens/order-details.dart';
// import 'package:project/screens/profile-screen.dart';
// import 'package:project/screens/register-screen.dart';
// import 'package:project/screens/welcome-screen.dart';
// import 'package:project/widgets/custom-empty-cart.dart';

// void main() {
//   runApp(const Project());
// }

// class Project extends StatelessWidget {
//   const Project({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // return MultiBlocProvider(
//     //   providers: [
//     //     BlocProvider(
//     //       create: (context) => FavoritesCubit()..getFavorites()..getUserData(),

//     //     )
//     //   ],
//     //   child: BlocConsumer<Cubit, >(
//     //     listener: (context, state) {
//     //       // TODO: implement listener
//     //     },
//     //     builder: (context, state) {
//           return  MaterialApp(

//         routes: {
//           //     'LoginPage': (context) => LoginPage(),
//           //     'register': (context) => RegisterPage(),
//           //     // 'mainPage': (context) => mainPage(),
//           'profilePage': (context) => ProfilePage(),
//           'welcomePage': (context) => WelcomeScreen(),
//           // 'favourite': (context) => FavouritePage(),
//         },
//         debugShowCheckedModeBanner: false,
//         // home: WelcomeScreen(),
//          home: MultiBlocProvider(
//         providers: [
//           BlocProvider<ProfileCubit>(
//             create: (BuildContext context) => ProfileCubit(),
//           ),
//           // Add other BlocProviders here if needed
//         ],
//         child: ProfilePage(),
//       );

//         }
// //       )

// //     );
// //   }
// }

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/notification-model.dart';
import 'package:project/app-localization.dart';
import 'package:project/cubit/dio-helper.dart';
import 'package:project/cubit/favourite-cubit.dart';
import 'package:project/cubit/profile-cubit.dart';
import 'package:project/cubit/update-profile-cubit.dart';
import 'package:project/screens/cart-item.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/widgets/custom-order.dart';
import 'generated/l10n.dart';
import 'package:project/screens/cart-page.dart';
import 'package:project/screens/favourite.dart';

import 'package:project/screens/login-screen.dart';
import 'package:project/screens/my-orders-screen.dart';
import 'package:project/screens/order-details.dart';
import 'package:project/screens/profile-screen.dart';
import 'package:project/screens/register-screen.dart';
import 'package:project/screens/update-profile-screen.dart';
import 'package:project/screens/welcome-screen.dart';
import 'package:project/widgets/custom-empty-cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: "assets/lang",
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      child: const Project(),
    ),
  );
}
      late var temp;
        List<Notificatioin> notes =[];

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {

     Future.delayed(
      Duration(seconds: 3),
      () async {
        await Future.delayed(
          Duration(seconds: 3),
          () async {
            temp = await DioHelper.getDate(
                url:
                    "http://127.0.0.1:8000/api/user/GetPharmacistNotifications");
            List<Notificatioin> notes = List.generate(
                temp.data['Notifications'].length,
                (index) =>
                    Notificatioin.fromJson(temp.data['Notifications'][index]));
            print(notes);
          },
        );
        if (notes.isNotEmpty) {
          notes.forEach((element) {
            if (notes.contains(element)) {
              AwesomeNotifications().createNotification(
                  content: NotificationContent(
                id: 10,
                channelKey: 'basic_channel',
                actionType: ActionType.Default,
                title: 'Hello World!',
                body: 'This is my first notification!',
              ));
            }
          });
        }
      },
    );
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,

//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate

//       ],
//         supportedLocales: [
// Locale('en'),
// Locale('ar')
//       ],
//       localeResolutionCallback: (devicelocale,supportedLocales){
//       for(var locale in supportedLocales){
//   if(devicelocale!=null&&devicelocale.languageCode == locale.languageCode){
//           return devicelocale;
//         }
//       }

//         return supportedLocales.first;
//       },
      routes: {
        'profilePage': (context) => ProfilePage(),
        'welcomePage': (context) => WelcomeScreen(),
      },
      debugShowCheckedModeBanner: false,

      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileCubit>(
            create: (BuildContext context) => ProfileCubit(),
          ),

          BlocProvider<UpdateProfileCubit>(
            create: (BuildContext context) => UpdateProfileCubit(),
          ),
          // Add other BlocProviders here if needed
        ],
        child: MyOrdersPage(),
      ),
    );
  }
}
