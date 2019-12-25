
import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/views/homePages/details.dart';

class DevicesPage extends StatefulWidget{

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 185.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
      ),
      child: ListView(
        primary: false,
        padding: EdgeInsets.only(left: 45.0,right: 40.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 45.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 330.0,
              child: ListView(
                children: <Widget>[
                  _deviceItem("assets/images/p.jpg","device number 1","\$100")
                ],
              ),
            ),
          ),
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
                child: Center(
                  child: Icon(Icons.search, color:Colors.black),
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
                child: Center(
                  child: Text('logout' , style:  TextStyle(color: Colors.white , fontSize: 15.0 ),),
                ), 
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _deviceItem(String imgPath , String foodName , String price){
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DetailsPage(heroTag: imgPath,deviceName: foodName,deviceNumber: price)
            )
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }

}