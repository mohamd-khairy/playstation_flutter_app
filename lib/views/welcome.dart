
import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/controller/user.dart';
import 'package:playstation_flutter_app/views/home.dart';
import 'package:playstation_flutter_app/views/homePages/active.dart';
import 'package:playstation_flutter_app/views/homePages/devices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget{

  WelcomePage({Key key , this.title}): super(key:key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
    
}
  
class _WelcomePageState  extends State<WelcomePage>{

  User user =new User();

  _save(String token) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0 , left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:25.0),
          Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Row(
              children: <Widget>[
                Text("All",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.0,
                ),),
                SizedBox(width: 10.0,),
                Text("Devices",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 25.0,
                ),),
              ],
            ),
          ),
          SizedBox(height:40.0),
          // devices widget
           Container(
              height: MediaQuery.of(context).size.height - 180.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 45.0,right: 40.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30.0,bottom: 10.0),
                    child:  Container(
                height: MediaQuery.of(context).size.height - 300.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      child: FutureBuilder<List>(
                        builder: (context,snapshot){
                              Center( child: CircularProgressIndicator(),);
                              if(snapshot.hasData){
                                return DevicesPage(list:snapshot.data);
                              }else if(snapshot.hasError) {
                                return Center( child: Text(snapshot.error));
                              }else{
                                return Center( child: Text("there is no Device now."));
                              }
                        },
                        future: user.devices(),
                      ),
                    ),
                  ),
                ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: (){},
                          child: Center(
                            child: Icon(Icons.search, color:Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ActiveDevicesPage()));
                          },
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 55.0,right: 2.0,top: 4.0),
                                    child: Text('1', style: TextStyle(fontSize: 15.0),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Icon(Icons.open_in_new, color:Colors.black),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                      Container(
                        height: 65.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0XFF1C1428),
                        ),
                        child: InkWell(
                          onTap: (){
                            _save('0');
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                          },
                          child: Center(
                            child: Text('logout' , style:  TextStyle(color: Colors.white , fontSize: 15.0 ),),
                          ),
                        ), 
                      )
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }


}