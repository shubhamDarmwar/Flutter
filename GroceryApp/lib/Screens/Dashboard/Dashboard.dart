import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/Dashboard/Home.dart';
import 'package:grocery_app/Screens/Favourites/favourite.dart';
import 'package:grocery_app/Screens/More/More.dart';
import 'package:grocery_app/Screens/MyCart/MyCart.dart';
import 'package:grocery_app/Screens/Profile/Profile.dart';

class Dashboard extends StatefulWidget {
  static const route = 'Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home(),
    MyCart(),
    Favourites(),
    Profile(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: _getBottomNavigationBar(),
        ),
        onWillPop: () async {
          if (_currentIndex == 0) {
            return true;
          } else {
            setState(() {
              _currentIndex = 0;
            });
            return false;
          }
        });
  }

  Widget _getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _getItems(),
      currentIndex: _currentIndex,
      onTap: (index) => _changeTab(index),
    );
  }

  _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

//store  my cart favourites profile more
  List<BottomNavigationBarItem> _getItems() {
    List<BottomNavigationBarItem> items = List();
    return items
      ..add(_getBottomNavigationItem(icon: Icons.store, title: 'Store'))
      ..add(
          _getBottomNavigationItem(icon: Icons.shopping_cart, title: 'My Cart'))
      ..add(_getBottomNavigationItem(icon: Icons.favorite, title: 'Favourites'))
      ..add(_getBottomNavigationItem(
          icon: Icons.person_outline, title: 'Profile'))
      ..add(_getBottomNavigationItem(icon: Icons.more_horiz, title: 'More'));
  }

  BottomNavigationBarItem _getBottomNavigationItem(
      {@required IconData icon, @required String title}) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: Icon(
        icon,
        size: 24.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
