import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_to_demo/screens/home.dart';
import 'package:travel_to_demo/screens/select_categories.dart';
import 'package:travel_to_demo/widgets/icon_badge.dart';
import 'package:travel_to_demo/screens/person_account.dart';
import 'package:travel_to_demo/screens/favorites.dart';
import 'package:travel_to_demo/screens/community.dart';
import 'package:travel_to_demo/screens/user_info_screen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key key,User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  PageController _pageController;
  static bool _firstlogin=false;
  int _page = 0;
  // bool _isEmailVerified;
  User _user;


   transition(context) {
    Future.delayed(Duration.zero,() {Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCategories(user: _user,)));});
    _firstlogin=false;

  }

  @override
   Widget build(BuildContext context) {
    if(_firstlogin==true){

      transition(context);
      setState(() {

      });
    }
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => index > 0?(index>1?(index>2?UserInfoScreen(user: _user,):Community()):Favorites()):Home(user: _user,)),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7.0),
            barIcon(icon: Icons.home, page: 0),
            barIcon(icon: Icons.bookmark, page: 1),
            barIcon(icon: Icons.mode_comment, page: 2, badge: true),
            barIcon(icon: Icons.person, page: 3),
            SizedBox(width: 7.0),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),

    );

  }



  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
    void initState() {
    _user = widget._user;


      // _isEmailVerified = _user.emailVerified;
    //     final _cTime=_user.metadata.creationTime;
    //    final _fTime=_user.metadata.lastSignInTime;
    //    print("ctime");print(_cTime);
    // print("_fTime");print(_fTime);
    //   if(_cTime == _fTime ){
    //     _firstlogin=true;
    //
    //   }
    // print(_firstlogin);
      super.initState();

      _pageController = PageController();
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
          _page == page ? Theme.of(context).accentColor : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}
