import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/CreateAccount/CreateAccount.dart';
import 'package:grocery_app/Screens/Dashboard/Dashboard.dart';

class Login extends StatefulWidget {
  static const route = 'Login';
  Login({Key key, bool isConsumer}) : super(key: key,);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool _isConsumer = true;
  
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _signInFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  bool _isValidUsername = true;
  bool _isValidPassword = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        // Image(
        //     image: AssetImage("/food.jpg"),
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover),

        Image.asset(
          'assets/food.jpeg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: Text('Login Page'),
          //   centerTitle: true,
          // ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                color: Colors.white38,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      textField(
                          textLabel: 'Username',
                          controller: _usernameController,
                          isPasswordField: false,
                          context: context),
                      SizedBox(
                        height: 10,
                      ),
                      textField(
                          textLabel: 'Password',
                          controller: _passwordController,
                          isPasswordField: true,
                          context: context),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 50,
                              child: FlatButton(
                                focusNode: _signInFocusNode,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white,fontSize: 16),
                                ),
                                color:
                                    Colors.black87, //AppColors.loginButtonColor,
                                onPressed: () => _doLogin(context),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('New User?'),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, CreateAccount.route);
                            },
                            child: Text('Create an Account',style: TextStyle(color: Colors.deepOrangeAccent),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget textField(
      {String textLabel,
      TextEditingController controller,
      bool isPasswordField,
      @required BuildContext context}) {
    return TextField(
      cursorColor: Colors.black,
      showCursor: true,
      controller: controller,
      obscureText: isPasswordField ? true : false,
      focusNode: isPasswordField ? _passwordFocusNode : null,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelStyle: TextStyle(
              color: Colors.black), //AppColors.loginTextFieldLabelColor),
          labelText: textLabel,
          errorText: _errorText(isPasswordField),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5)), //AppColors.loginTextFieldUnderLine
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5))), //AppColors.loginTextFieldUnderLine
      textInputAction:
          isPasswordField ? TextInputAction.done : TextInputAction.next,
      onChanged: isPasswordField ? _checkPassword : _checkUsername,
      onSubmitted: (String focusVal) {
        if (isPasswordField) {
          FocusScope.of(context).requestFocus(_signInFocusNode);
          _doLogin(context);
        } else {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        }
      },
    );
  }

  _doLogin(BuildContext context) {
    print('isConsuemr');
    print(_isConsumer);
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    if (username == "") {
      setState(() {
        _isValidUsername = false;
      });
      return;
    } else if (password == "") {
      setState(() {
        _isValidUsername = true;
        _isValidPassword = false;
      });
      return;
    }
    setState(() {
      _isValidUsername = true;
      _isValidPassword = true;
    });
    Navigator.pushNamed(context, Dashboard.route);
  }

  String _errorText(bool isPasswordField) {
    switch (isPasswordField) {
      case true:
        if (!_isValidPassword) {
          return 'Please enter password';
        }
        break;
      case false:
        if (!_isValidUsername) {
          return 'Please enter username';
        }
        break;
    }
    return null;
  }

  void _checkUsername(String text) {
    final username = _usernameController.text.trim();
    setState(() {
      if (username == "") {
        _isValidUsername = false;
      } else {
        _isValidUsername = true;
      }
    });
  }

  void _checkPassword(String text) {
    final password = _passwordController.text;
    setState(() {
      if (password == "") {
        _isValidPassword = false;
      } else {
        _isValidPassword = true;
      }
    });
  }
}
