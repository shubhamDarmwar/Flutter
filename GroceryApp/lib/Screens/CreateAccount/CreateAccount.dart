import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/CreateAccount/NewAccount.dart';

class CreateAccount extends StatelessWidget {
  static const route = 'CreateAccount';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Choose Action',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        print('Buyer tapped');
                        Navigator.pushNamed(context, NewAccount.route);
                      },
                      child: Text(
                        'Buyer',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, NewAccount.route);
                      },
                      child: Text(
                        'Seller',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
