import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_to_demo/res/custom_colors.dart';
import 'package:travel_to_demo/util/places.dart';
import 'package:travel_to_demo/widgets/horizontal_place_item.dart';
import 'package:travel_to_demo/widgets/icon_badge.dart';
import 'package:travel_to_demo/widgets/search_bar.dart';
import 'package:travel_to_demo/widgets/vertical_place_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_to_demo/res/custom_colors.dart';
import 'package:travel_to_demo/screens/sign_in_screen.dart';
import 'package:travel_to_demo/util/authentication.dart';
import 'package:travel_to_demo/widgets/app_bar_title.dart';


class PersonAccount extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Account",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // buildUserInfo(context)
          // buildHorizontalList(context),
          // buildVerticalList(),
        ],
      ),
    );
  }



  // buildUserInfo(BuildContext context){
  //   return Scaffold(
  //
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.only(
  //           left: 16.0,
  //           right: 16.0,
  //           bottom: 20.0,
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Row(),
  //             ClipOval(
  //               child: Material(
  //                 color: CustomColors.firebaseGrey.withOpacity(0.3),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Icon(
  //                     Icons.person,
  //                     size: 42,
  //                     color: CustomColors.firebaseGrey,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 16.0),
  //             Text(
  //               'Hello',
  //               style: TextStyle(
  //                 color: CustomColors.firebaseGrey,
  //                 fontSize: 26,
  //               ),
  //             ),
  //             SizedBox(height: 8.0),
  //             Text(
  //               widget._user.displayName,
  //               style: TextStyle(
  //                 color: CustomColors.firebaseYellow,
  //                 fontSize: 26,
  //               ),
  //             ),
  //             SizedBox(height: 24.0),
  //             _isEmailVerified
  //                 ? Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 ClipOval(
  //                   child: Material(
  //                     color: Colors.greenAccent.withOpacity(0.6),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(4.0),
  //                       child: Icon(
  //                         Icons.check,
  //                         size: 20,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 8.0),
  //                 Text(
  //                   'Email is verified',
  //                   style: TextStyle(
  //                     color: Colors.greenAccent,
  //                     fontSize: 20,
  //                     letterSpacing: 0.5,
  //                   ),
  //                 ),
  //               ],
  //             )
  //                 : Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 ClipOval(
  //                   child: Material(
  //                     color: Colors.redAccent.withOpacity(0.8),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(4.0),
  //                       child: Icon(
  //                         Icons.close,
  //                         size: 20,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 8.0),
  //                 Text(
  //                   'Email is not verified',
  //                   style: TextStyle(
  //                     color: Colors.redAccent,
  //                     fontSize: 20,
  //                     letterSpacing: 0.5,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 8.0),
  //             Visibility(
  //               visible: !_isEmailVerified,
  //               child: Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   _verificationEmailBeingSent
  //                       ? CircularProgressIndicator(
  //                     valueColor: AlwaysStoppedAnimation<Color>(
  //                       CustomColors.firebaseGrey,
  //                     ),
  //                   )
  //                       : ElevatedButton(
  //                     style: ButtonStyle(
  //                       backgroundColor: MaterialStateProperty.all(
  //                         CustomColors.firebaseGrey,
  //                       ),
  //                       shape: MaterialStateProperty.all(
  //                         RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                       ),
  //                     ),
  //                     onPressed: () async {
  //                       setState(() {
  //                         _verificationEmailBeingSent = true;
  //                       });
  //                       await _user.sendEmailVerification();
  //                       setState(() {
  //                         _verificationEmailBeingSent = false;
  //                       });
  //                     },
  //                     child: Padding(
  //                       padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
  //                       child: Text(
  //                         'Verify',
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                           color: CustomColors.firebaseNavy,
  //                           letterSpacing: 2,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(width: 16.0),
  //                   IconButton(
  //                     icon: Icon(Icons.refresh),
  //                     onPressed: () async {
  //                       User user = await Authentication.refreshUser(_user);
  //
  //                       if (user != null) {
  //                         setState(() {
  //                           _user = user;
  //                           _isEmailVerified = user.emailVerified;
  //                         });
  //                       }
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 24.0),
  //             Text(
  //               'You are now signed in using Firebase Authentication. To sign out of your account click the "Sign Out" button below.',
  //               style: TextStyle(
  //                   color: CustomColors.firebaseGrey.withOpacity(0.8),
  //                   fontSize: 14,
  //                   letterSpacing: 0.2),
  //             ),
  //             SizedBox(height: 16.0),
  //             _isSigningOut
  //                 ? CircularProgressIndicator(
  //               valueColor: AlwaysStoppedAnimation<Color>(
  //                 Colors.redAccent,
  //               ),
  //             )
  //                 : ElevatedButton(
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all(
  //                   Colors.redAccent,
  //                 ),
  //                 shape: MaterialStateProperty.all(
  //                   RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //               ),
  //               onPressed: () async {
  //                 setState(() {
  //                   _isSigningOut = true;
  //                 });
  //                 await FirebaseAuth.instance.signOut();
  //                 setState(() {
  //                   _isSigningOut = false;
  //                 });
  //                 Navigator.of(context)
  //                     .pushReplacement(_routeToSignInScreen());
  //               },
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
  //                 child: Text(
  //                   'Sign Out',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                     letterSpacing: 2,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  //
  //
  // }














   buildHorizontalList(BuildContext context) {
     return Container(
  //     padding: EdgeInsets.only(top: 10.0, left: 20.0),
  //     height: 250.0,
  //     width: MediaQuery.of(context).size.width,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       primary: false,
  //       itemCount: places == null ? 0.0 : places.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map place = places.reversed.toList()[index];
  //         return HorizontalPlaceItem(place: place);
  //       },
  //     ),
     );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      // child: ListView.builder(
      //   primary: false,
      //   physics: NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: places == null ? 0 : places.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     Map place = places[index];
      //     return VerticalPlaceItem(place: place);
      //   },
      // ),
    );
  }
}
