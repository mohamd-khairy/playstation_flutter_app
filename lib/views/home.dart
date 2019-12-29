import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/views/auth/login.dart';
import 'package:playstation_flutter_app/views/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}
  
class HomePageState extends State<HomePage> {

  read() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value= prefs.get(key) ?? 0;
    if(value != '0'){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage()));
    }
  }
  
  @override
  initState(){
    read();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          SizedBox(height:40.0),
          Center(
            child:Text("Login",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.0,
              ),
            ),
          ),
          SizedBox(height:40.0),
          // devices widget
          Container(
            height: MediaQuery.of(context).size.height - 260.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0) ,
              topRight: Radius.circular(75.0) ,
              bottomLeft: Radius.circular(75.0) ,
              bottomRight: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 45.0,right: 40.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0,bottom: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: LoginPage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}