
import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/views/homePages/devices.dart';

class HomePage extends StatefulWidget{

  HomePage({Key key , this.title}): super(key:key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
    
}
  
class _HomePageState  extends State<HomePage>{

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
            padding: EdgeInsets.only(left: 40.0),
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
          DevicesPage(),
        ],
      ),
    );
  }


}