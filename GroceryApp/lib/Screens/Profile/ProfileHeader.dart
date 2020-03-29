import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/food.jpeg',
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          // color: Colors.grey[300],
          child: Row(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.stretch,

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profileImage.png'),
                    radius: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shubham",
                      style: this.headerTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Wakad, Pune',
                      style: this.bodyTextStyle(),
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
  TextStyle bodyTextStyle() {
    return TextStyle(fontSize: 18);
  }

  TextStyle headerTextStyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
    );
  }
}
