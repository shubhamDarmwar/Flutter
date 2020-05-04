import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/Profile/Profile.dart';
import 'package:grocery_app/Screens/login/Login.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getMenuDrawer(context);
  }

  Widget _getMenuDrawer(context) {
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
              Navigator.pushNamed(context, Profile.route);
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     Profile.route, (Route<dynamic> route) => false);
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
