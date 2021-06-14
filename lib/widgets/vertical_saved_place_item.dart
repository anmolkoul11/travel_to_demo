import 'package:flutter/material.dart';
import 'package:travel_to_demo/screens/detailsavedplace.dart';
// import 'package:transparent_image/transparent_image.dart';
import '../screens/details.dart';

class VerticalSavedPlaceItem extends StatelessWidget {
  final Map splace;
  final int index;
  VerticalSavedPlaceItem({this.splace, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          height: 70.0,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network("${splace["img"]}",
                  height: 70.0,
                  width: 70.0,
                  fit: BoxFit.cover,
                  excludeFromSemantics: true,
                ),
              ),

              SizedBox(width: 15.0),
              Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width - 130.0,
                child: ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Expanded(
                      // alignment: Alignment.centerLeft,
                      child: Text(
                        "${splace["name"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Expanded(
                          // alignment: Alignment.centerLeft,
                          child: Text(
                            "${splace["location"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),

                  ],
                ),
              ),
            ],
          ),
        ),

        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return DetailSavedPlace(index);
              },
            ),
          );
        },
      ),
    );
  }
}
