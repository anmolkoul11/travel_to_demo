import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_to_demo/screens/autocomplete.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key,User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _SearchBarState createState() => _SearchBarState();
}


class _SearchBarState extends State<SearchBar> {

  static bool _firstlogin=false;
  final TextEditingController _searchControl = new TextEditingController();
  int _page = 0;
  // bool _isEmailVerified;
  User _user;
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   _searchControl.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: TextField(

        controller: _searchControl,
        readOnly: true,
        onTap: () async {
          // generate a new token here
          final sessionToken = "Uuid().v4()";
          final result = await showSearch(context: context,delegate: SearchPlace()
            
          );
          // This will change the text displayed in the TextField

        },
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey[300],
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "E.g: New York, United States",
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.blueGrey[300],
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
        ),
        maxLines: 1,

      ),
    );
  }


}
