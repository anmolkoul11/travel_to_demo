import 'package:flutter/material.dart';
import 'package:travel_to_demo/util/places.dart';
import 'package:travel_to_demo/widgets/horizontal_place_item.dart';
import 'package:travel_to_demo/widgets/icon_badge.dart';
import 'package:travel_to_demo/widgets/search_bar.dart';
import 'package:travel_to_demo/widgets/vertical_place_item.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // IconButton(
          //   icon: IconBadge(
          //     icon: Icons.notifications_none,
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
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
