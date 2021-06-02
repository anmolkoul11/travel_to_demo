import 'package:flutter/material.dart';
import 'package:travel_to_demo/res/custom_colors.dart';
import 'package:travel_to_demo/screens/main_screen.dart';
import 'package:travel_to_demo/screens/sign_in_screen.dart';
import 'package:travel_to_demo/util/const.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();


}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: Constants.appName,
//       theme: Constants.lightTheme,
//       darkTheme: Constants.darkTheme,
//       home: _MyAppState(),
//     );
//   }
// }

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        backgroundColor: Colors.black,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('Welcome to TravelTo',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,

            color: Colors.amber

          ),),
         //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        //backgroundColor:CustomColors.firebaseNavy,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),

        loaderColor: Colors.amber
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: Constants.appName,
       theme: Constants.lightTheme,
       darkTheme: Constants.darkTheme,
      home: SignInScreen(),
    );
  }
}


