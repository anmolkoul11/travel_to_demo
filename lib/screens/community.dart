import 'package:flutter/material.dart';
import 'package:travel_to_demo/util/blogs.dart';
import 'package:travel_to_demo/util/places.dart';
import 'package:travel_to_demo/widgets/horizontal_place_item.dart';
import 'package:travel_to_demo/widgets/icon_badge.dart';
import 'package:travel_to_demo/widgets/search_bar.dart';
import 'package:travel_to_demo/widgets/vertical_place_item.dart';
import 'package:travel_to_demo/screens/notifications.dart';



class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Community Blogs",
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
      // padding: EdgeInsets.only(top: 10.0, left: 20.0),
      // height: 250.0,
      // width: MediaQuery.of(context).size.width,
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   primary: false,
      //   itemCount: places == null ? 0.0 : places.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     Map place = places.reversed.toList()[index];
      //     return HorizontalPlaceItem(place: place);
      //   },
      // ),
    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
       child: ListView.builder(
         primary: false,
        physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true,
         itemCount: blogs == null ? 0 : blogs.length,
         itemBuilder: (BuildContext context, int index) {
           Map blog = blogs[index];
          return VerticalPlaceItem(place: blog);
         },
       ),
    );
  }
}
