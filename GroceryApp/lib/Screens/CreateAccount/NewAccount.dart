import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/Dashboard/Dashboard.dart';

class NewAccount extends StatefulWidget {
  static const route = 'NewAccount';
  @override
  _NewAccountState createState() => _NewAccountState();
}

enum TextFieldIdentifier { usernmae, passowrd, confirmPassword, mobileNumber }

class _NewAccountState extends State<NewAccount> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();
  FocusNode _mobileNoFocusNode = FocusNode();
  FocusNode _createAccountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
          child: Column(
            children: <Widget>[
              textField(
                  context: context,
                  textLabel: 'Username',
                  controller: _usernameController,
                  identifier: TextFieldIdentifier.usernmae),
              SizedBox(height: 16),
              textField(
                  context: context,
                  textLabel: 'Password',
                  controller: _passwordController,
                  identifier: TextFieldIdentifier.passowrd),
              SizedBox(height: 16),
              textField(
                  context: context,
                  textLabel: 'Confirm Password',
                  controller: _confirmPassController,
                  identifier: TextFieldIdentifier.confirmPassword),
              SizedBox(height: 16),
              textField(
                  context: context,
                  textLabel: 'Mobile Number',
                  controller: _mobileController,
                  identifier: TextFieldIdentifier.mobileNumber),
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50,
                      child: FlatButton(
                        // focusNode: _signInFocusNode,
                        child: Text(
                          'Create Account',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        color: Colors.black87, //AppColors.loginButtonColor,
                        onPressed: () => _createAccountAPICall(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(
      {String textLabel,
      TextEditingController controller,
      // bool isPasswordField = false,
      // bool isNumberField = false,
      @required TextFieldIdentifier identifier,
      @required BuildContext context}) {
    return TextField(
      enableSuggestions: false,
      keyboardType: _isNumberField(identifier)
          ? TextInputType.number
          : TextInputType.text,
      cursorColor: Colors.black,
      showCursor: true,
      controller: controller,
      obscureText: _isPasswordField(identifier) ? true : false,
      focusNode: _getFocusNode(identifier),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
      ),
      decoration:
          _inputDecoration(textLabel), //AppColors.loginTextFieldUnderLine
      textInputAction: _getTextInputAction(identifier),
      // onChanged: isPasswordField ? _checkPassword : _checkUsername,
      onSubmitted: (String focusVal) {
        switch (identifier) {
          case TextFieldIdentifier.usernmae:
            FocusScope.of(context).requestFocus(_passwordFocusNode);
            break;
          case TextFieldIdentifier.passowrd:
            FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            break;
          case TextFieldIdentifier.confirmPassword:
            FocusScope.of(context).requestFocus(_mobileNoFocusNode);
            break;
          case TextFieldIdentifier.mobileNumber:
            FocusScope.of(context).requestFocus(_createAccountFocusNode);
            _createAccountAPICall();
            break;
        }
      },
    );
  }

  _createAccountAPICall() {
    Navigator.pushNamed(context, Dashboard.route);
  }

  TextInputAction _getTextInputAction(TextFieldIdentifier identifier) {
    switch (identifier) {
      case TextFieldIdentifier.usernmae:
      case TextFieldIdentifier.passowrd:
      case TextFieldIdentifier.confirmPassword:
        return TextInputAction.next;
        break;
      case TextFieldIdentifier.mobileNumber:
        return TextInputAction.done;
        break;
    }
    return null;
  }

  bool _isPasswordField(TextFieldIdentifier identifier) {
    switch (identifier) {
      case TextFieldIdentifier.passowrd:
      case TextFieldIdentifier.confirmPassword:
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  bool _isNumberField(TextFieldIdentifier identifier) {
    switch (identifier) {
      case TextFieldIdentifier.mobileNumber:
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  FocusNode _getFocusNode(TextFieldIdentifier identifier) {
    switch (identifier) {
      case TextFieldIdentifier.usernmae:
        break;
      case TextFieldIdentifier.passowrd:
        return _passwordFocusNode;
        break;
      case TextFieldIdentifier.confirmPassword:
        return _confirmPasswordFocusNode;
        break;
      case TextFieldIdentifier.mobileNumber:
        return _mobileNoFocusNode;
        break;
    }
    return null;
  }

  InputDecoration _inputDecoration(String textLabel) {
    return InputDecoration(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
            color: Colors.black), //AppColors.loginTextFieldLabelColor),
        labelText: textLabel,
        // errorText: _errorText(isPasswordField),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black45,
                width: 1.5)), //AppColors.loginTextFieldUnderLine
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.5)));
  }
}
