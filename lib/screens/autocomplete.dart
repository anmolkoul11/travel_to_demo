import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:travel_to_demo/widgets/search_bar.dart';
import 'package:travel_to_demo/util/search_data.dart';
import 'package:get/get.dart';

import 'package:travel_to_demo/util/places.dart';
import 'package:travel_to_demo/widgets/vertical_place_item.dart';

class SearchPlace extends SearchDelegate<SearchData> {
final jsonString;
SearchPlace(this.jsonString);


  final lastOnes = ['suggest'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using
    else {
      return Column(
        children: <Widget>[
          //Build the results based on the searchResults stream in the searchBloc
          Container()
        ],
      );
    }
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: <Widget>[
        //Build the results based on the searchResults stream in the searchBloc
        Container()
      ],
    );
  }





}

// class AutoCompleteSearch extends StatefulWidget {
//   @override
//   _AutoCompleteState createState() => new _AutoCompleteState();
// }
//
// class _AutoCompleteState extends State<AutoCompleteSearch> {
//   GlobalKey<AutoCompleteTextFieldState<SearchData>> key = new GlobalKey();
//
//   AutoCompleteTextField searchTextField;
//
//   TextEditingController controller = new TextEditingController();
//
//   _AutoCompleteState();
//
//   void _loadData() async {
//     await DataViewModel.loadData();
//   }
//
//   @override
//   void initState() {
//     _loadData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//         child: new Center(
//             child: new Column(children: <Widget>[
//               new Column(children: <Widget>[
//                 searchTextField = AutoCompleteTextField<SearchData>(
//                     style: new TextStyle(color: Colors.black, fontSize: 16.0),
//                     decoration: new InputDecoration(
//                         suffixIcon: Container(
//                           width: 85.0,
//                           height: 60.0,
//                         ),
//                         contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
//                         filled: true,
//                         hintText: 'Search Place Name',
//                         hintStyle: TextStyle(color: Colors.black)),
//                     itemSubmitted: (item) {
//                       setState(() => searchTextField.textField.controller.text =
//                           item.name);
//                     },
//                     clearOnSubmit: false,
//                     key: key,
//                     suggestions: DataViewModel.sdata,
//                     itemBuilder: (context, item) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text(item.name,
//                             style: TextStyle(
//                                 fontSize: 16.0
//                             ),),
//                           Padding(
//                             padding: EdgeInsets.all(15.0),
//                           ),
//                           Text(item.location,
//                           )
//                         ],
//                       );
//                     },
//                     itemSorter: (a, b) {
//                       return a.name.compareTo(b.name);
//                     },
//                     itemFilter: (item, query) {
//                       return item.name
//                           .toLowerCase()
//                           .startsWith(query.toLowerCase());
//                     }),
//               ]),
//             ])));
//   }
// }
