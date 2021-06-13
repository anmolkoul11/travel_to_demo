import 'dart:convert';
import 'package:travel_to_demo/util/places.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:travel_to_demo/screens/main_screen.dart';
import 'package:travel_to_demo/util//formfield.dart';
import 'package:http/http.dart' as http;


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
  Future<List<dynamic>> fetchData(String string) async{
    final response = await http.get(Uri.parse('https://recommend-dest.herokuapp.com/cat?title='+string));
    if (response.statusCode==200){
      List<dynamic> stringList = jsonDecode(response.body) ;
      setState(() {
        places = stringList;
      });

      print(stringList);
      return stringList;
    }
    else{
      print(string);
      throw Exception('Failed to Fetch data from Heroku');
    }
  }

  buttonAction(String string) async{
    var result = await fetchData(string);

     Navigator.pop((context));
     Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(user: _user,)));
  }

  @override
  Widget build(BuildContext context) {
    int size;
    String _res = "Temples,Mughal";
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
                  var concat = "";

                  _selectedAnimals.forEach((item){
                    concat = concat + "" + item.nameid +",";

                  });
                   _res = concat.substring(0,concat.length-1);

                },
              ),
              SizedBox(height: 50),
              ElevatedButton(

                onPressed: null,
                child: const Text('Disabled'),
              ),
              ElevatedButton(

                onPressed:() {buttonAction(_res);

                },

                child: const Text('Enabled'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[700],
                    ),


              ),

            ],
          ),
        ),
      ),
    );
  }
}