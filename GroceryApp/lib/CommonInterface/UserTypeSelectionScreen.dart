import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/login/Login.dart';

import '../Screens/login/Login.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  static const route = 'UserTypeSelection';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(child: 
              Text(
                'I am,',
              style: TextStyle(color: Colors.black,
              fontSize: 16), 
              ),
            ),
            Container(
              child: FlatButton(
                child: Text('Consumer'),
                onPressed: () => onPressConsumer(context),
              ),
            ),
            Container(
              child: FlatButton(
                child: Text('Shopkeeper'),
                onPressed: () => onPressShopkeeper(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onPressConsumer(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: 
  (context) => Login(isConsumer: true,)
  )
  );
}

void onPressShopkeeper(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: 
  (context) => Login(isConsumer: false,)
  )
  );
}
