import 'package:flutter/material.dart';
import 'package:grocery_app/CommonInterface/UserTypeSelectionScreen.dart';
import 'Screens/CreateAccount/CreateAccount.dart';
import 'Screens/CreateAccount/NewAccount.dart';
import 'Screens/Dashboard/Dashboard.dart';
import 'Screens/login/Login.dart';
import 'Screens/Profile/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black, //AppColors.primaryColor,
        primaryColorDark: Colors.black,
        //  inputDecorationTheme: InputDecorationTheme(
        //   border: OutlineInputBorder(),
        //   isDense: true,
        // )
      ),
      initialRoute: UserTypeSelectionScreen.route,
      routes: {
        Profile.route: (context) => Profile(),
        Login.route: (context) => Login(),
        Dashboard.route: (context) => Dashboard(),
        NewAccount.route: (context) => NewAccount(),
        CreateAccount.route: (context) => CreateAccount(),
        UserTypeSelectionScreen.route: (context) => UserTypeSelectionScreen()
      },
    );
  }
}
