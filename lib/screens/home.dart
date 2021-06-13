import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_to_demo/screens/select_categories.dart';
import 'package:travel_to_demo/util/places.dart';
import 'package:travel_to_demo/widgets/horizontal_place_item.dart';
import 'package:travel_to_demo/widgets/icon_badge.dart';
import 'package:travel_to_demo/widgets/search_bar.dart';
import 'package:travel_to_demo/widgets/vertical_place_item.dart';
import 'package:travel_to_demo/screens/notifications.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key key,User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  static bool _firstlogin=false;
  int _page = 0;
  // bool _isEmailVerified;
  User _user;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.place),
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectCategories(user: _user,)),
          );},
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );}
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          buildHorizontalList(context),
          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 20.0),
      height: 280.0,
      width: MediaQuery.of(context).size.width,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places == null ? 0.0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.reversed.toList()[index];
          return HorizontalPlaceItem(place: place,index: places.length-index-1);
        },
      ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),

      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: places == null ? 0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places[index];
          return VerticalPlaceItem(place: place,index: index);
        },
      ),
    );
  }

  @override
  void initState() {
    _user = widget._user;


    // _isEmailVerified = _user.emailVerified;
    final _cTime=_user.metadata.creationTime;
    final _fTime=_user.metadata.lastSignInTime;
    if(_cTime == _fTime ){
      _firstlogin=true;
    }
    super.initState();



  }

}


