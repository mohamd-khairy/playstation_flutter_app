
import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/controller/user.dart';
import 'package:playstation_flutter_app/views/homePages/details.dart';

class DevicesPage extends StatelessWidget{
  List list;
  DevicesPage({this.list});
              
  User user = new User();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context , int index){ 
      
    String imgPath = "assets/images/${list[index]['pc_number']}.png";
    String foodName = list[index]['pc_name'];
    String type = list[index]['game_type']['device_type']['type_name_en'];

      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Image(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0,
                  ),
                ),
                SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(
                      type,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.grey,
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: (){
              // user.openSettion();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetailsPage(id:list[index]['id'] ,heroTag: imgPath,deviceName: foodName,deviceNumber: type)
                )
              );
            },
          )
        ],
      );
    });
  }
}

