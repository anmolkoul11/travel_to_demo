import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:travel_to_demo/screens/main_screen.dart';
import 'package:travel_to_demo/util//formfield.dart';


// ignore: must_be_immutable



class SelectCategories extends StatefulWidget {

  SelectCategories({Key key, User user})
      : _user = user,
        super(key: key);
  final User _user;
  _SelectCategories createState() => _SelectCategories();
}

class _SelectCategories extends State<SelectCategories> {
  static List<Category> _categories = setter();
  User _user;
  final _items = _categories
      .map((category) => MultiSelectItem<Category>(category, category.name))
      .toList();
  List<Category> _selectedAnimals = [];
  //List<Animal> _selectedAnimals2 = [];
  //List<Animal> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Category> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  Route _routeToMainScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainScreen(user: _user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  @override
  void initState() {
    _user = widget._user;
    _selectedAnimals5 = _categories;

    super.initState();
  }

  // ignore: non_constant_identifier_names
  ButtonAction(){

    Navigator.pop((context));
  }

  @override
  Widget build(BuildContext context) {
    int size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Categories"),

      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              MultiSelectDialogField(
                items: _items,
                title: Text("Categories"),
                itemsTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                selectedItemsTextStyle: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                ),
                unselectedColor: Colors.white,
                selectedColor: Colors.amber,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.amber,
                ),
                buttonText: Text(
                  "Select at least 3 of your Favorite Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  _selectedAnimals = results;
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(

                onPressed: null,
                child: const Text('Disabled'),
              ),
              ElevatedButton(

                onPressed:() {ButtonAction();
                },

                child: const Text('Enabled'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[700],
                    ),


              ),
              // ElevatedButton(onPressed: ButtonAction(), child: const Text("Done"))
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
              //       Container(
              //         decoration: BoxDecoration(
              //           color: Theme.of(context).primaryColor.withOpacity(.4),
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         child: Column(
              //           children: <Widget>[
              //             MultiSelectBottomSheetField(
              //               initialChildSize: 0.4,
              //               listType: MultiSelectListType.CHIP,
              //               searchable: true,
              //               buttonText: Text("Favorite Animals"),
              //               title: Text("Animals"),
              //               items: _items,
              //               onConfirm: (values) {
              //                 _selectedAnimals2 = values;
              //               },
              //               chipDisplay: MultiSelectChipDisplay(
              //                 onTap: (value) {
              //                   setState(() {
              //                     _selectedAnimals2.remove(value);
              //                   });
              //                 },
              //               ),
              //             ),
              //             _selectedAnimals2 == null || _selectedAnimals2.isEmpty
              //                 ? Container(
              //                 padding: EdgeInsets.all(10),
              //                 alignment: Alignment.centerLeft,
              //                 child: Text(
              //                   "None selected",
              //                   style: TextStyle(color: Colors.black54),
              //                 ))
              //                 : Container(),
              //           ],
              //         ),
              //       ),
              //       SizedBox(height: 40),
              //       //################################################################################################
              //       // MultiSelectBottomSheetField with validators
              //       //################################################################################################
              //       MultiSelectBottomSheetField<Animal>(
              //         key: _multiSelectKey,
              //         initialChildSize: 0.7,
              //         maxChildSize: 0.95,
              //         title: Text("Animals"),
              //         buttonText: Text("Favorite Animals"),
              //         items: _items,
              //         searchable: true,
              //         validator: (values) {
              //           if (values == null || values.isEmpty) {
              //             return "Required";
              //           }
              //           List<String> names = values.map((e) => e.name).toList();
              //           if (names.contains("Frog")) {
              //             return "Frogs are weird!";
              //           }
              //           return null;
              //         },
              //         onConfirm: (values) {
              //           setState(() {
              //             _selectedAnimals3 = values;
              //           });
              //           _multiSelectKey.currentState.validate();
              //         },
              //         chipDisplay: MultiSelectChipDisplay(
              //           onTap: (item) {
              //             setState(() {
              //               _selectedAnimals3.remove(item);
              //             });
              //             _multiSelectKey.currentState.validate();
              //           },
              //         ),
              //       ),
              //       SizedBox(height: 40),
              //       //################################################################################################
              //       // MultiSelectChipField
              //       //################################################################################################
              //       MultiSelectChipField(
              //         items: _items,
              //         initialValue: [_animals[4], _animals[7], _animals[9]],
              //         title: Text("Animals"),
              //         headerColor: Colors.blue.withOpacity(0.5),
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.blue[700], width: 1.8),
              //         ),
              //         selectedChipColor: Colors.blue.withOpacity(0.5),
              //         selectedTextStyle: TextStyle(color: Colors.blue[800]),
              //         onTap: (values) {
              //           //_selectedAnimals4 = values;
              //         },
              //       ),
              //       SizedBox(height: 40),
              //       //################################################################################################
              //       // MultiSelectDialogField with initial values
              //       //################################################################################################
              //       MultiSelectDialogField(
              //         onConfirm: (val) {
              //           _selectedAnimals5 = val;
              //         },
              //         items: _items,
              //         initialValue:
              //         _selectedAnimals5, // setting the value of this in initState() to pre-select values.
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}