// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './ProfileHeader.dart';

class Profile extends StatefulWidget {
  static const route = "Profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(title: Text('Profile'),),
        body: ListView(
          children: <Widget>[
            ProfileHeader(),
            creatButton('My Orders'),
            creatButton('Favorites'),
            creatButton('Change Password'),
            creatButton('Logout'),
          ],
        ),
      ),
    );
  }

  ListTile creatButton(String title){
    return ListTile(
      title: Text(title),
      onTap: () => this.buttonTapped()
      
      );
  }
  void buttonTapped(){
    print('button pressed');
  }
}

