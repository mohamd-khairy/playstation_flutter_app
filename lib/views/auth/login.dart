import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/controller/user.dart';
import 'package:playstation_flutter_app/views/welcome.dart';
class LoginPage extends StatefulWidget{

  @override
  LoginPageState createState() => LoginPageState();
}
  
class LoginPageState extends State<LoginPage> {
  
  User user = new User();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty){
        user.login(_emailController.text.trim().toLowerCase(), _passwordController.text.trim()).whenComplete((){
          if(user.status == 200){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => WelcomePage())
            );
          }else{
            _showDialog();
          }
        });
      }else{
        _showDialog();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:60.0),),
          Container(
            height: 50.0,
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Please Enter Your Address",
                icon: Icon(Icons.email)
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top:20.0),),
          Container(
            height: 50.0,
            child: TextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Please Enter Your Password",
                icon: Icon(Icons.vpn_key),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top:44.0),),
           Container(
            height: 50.0,
            child: RaisedButton(
              onPressed: _login,
              color: Color(0xFF21BFBD),
              child:  Text('Login' , style:  TextStyle(color: Colors.white , backgroundColor: Color(0xFF21BFBD)),),
            ),
          ),
        ],
      ),
    );
  }


  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Failed"),
          content: new Text("email or password is wrong"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}