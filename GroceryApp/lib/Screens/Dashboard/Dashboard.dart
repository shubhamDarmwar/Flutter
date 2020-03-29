import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/Profile/Profile.dart';
import 'package:grocery_app/Screens/login/Login.dart';

class Dashboard extends StatefulWidget {
  static const route = 'Dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: _getMenuDrawer(),
      body: _createCardList(),
    );
  }

  Widget _createCardList() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _getCardRow();
                  }))
        ],
      ),
    );
  }

  Widget _getCardRow() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 100,
      width: double.maxFinite,
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: () {
            print('Card Row tapped');
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.redAccent,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Fruits and Vegetables',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                    Text(
                      'Potato,Tomato, Apple',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                          fontSize: 13.0),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMenuDrawer() {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  margin: EdgeInsets.only(left: 0.0, right: 16.0, top: 8.0),
                  child: Icon(
                    Icons.person,
                    size: 100.0,
                    color: Colors.black38,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0),
                  child: _getUserProfileDetails(),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
        ListTile(
          title: Text('My profile'),
          onTap: () { 
            Navigator.of(context).pushNamedAndRemoveUntil(
                  Profile.route, (Route<dynamic> route) => false);
          }),
        ListTile(
          title: Text('Menu 2'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Menu 3'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Menu 4'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Menu 5'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Menu 6'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
            title: Text('Log Out'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Login.route, (Route<dynamic> route) => false);
            }),
      ],
    ));
  }

  _getUserProfileDetails() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Name',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Developer',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
          )
        ]);
  }
}
