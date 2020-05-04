import 'package:flutter/material.dart';

import 'MenuDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _createCardList();
  }

  Widget _createCardList() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
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
      ),
      drawer: MenuDrawer(),
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
}
