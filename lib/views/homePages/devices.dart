
import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/views/homePages/details.dart';

class DevicesPage extends StatelessWidget{
  List list;
  DevicesPage({this.list});

    String imgPath ="assets/images/1.png";
    String foodName = "device number 1" ;
    String price = "\$100";

  @override
  Widget build(BuildContext context) {
    // return Text(list.length.toString());
    return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context , int index){ 
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
                      price,
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetailsPage(heroTag: imgPath,deviceName: foodName,deviceNumber: price)
                )
              );
            },
          )
        ],
      );
    });
  }
}

