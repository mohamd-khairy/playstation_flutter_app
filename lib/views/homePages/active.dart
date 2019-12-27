
import 'package:flutter/material.dart';
import 'package:playstation_flutter_app/views/homePages/details.dart';

class ActiveDevicesPage extends StatefulWidget{

  @override
  ActiveDevicesPageState createState() => ActiveDevicesPageState();
}

class ActiveDevicesPageState extends State<ActiveDevicesPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Active Devices',
          style: TextStyle(fontFamily: 'Montserrat',fontSize: 18.0,color: Colors.white),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: (){},
              color: Colors.white,
            ),
          ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                  _deviceItem("assets/images/1.png","device number 1","\$100"),
                  _deviceItem("assets/images/2.png","device number 1","\$100"),
                  _deviceItem("assets/images/3.png","device number 1","\$100"),
                  _deviceItem("assets/images/4.png","device number 1","\$100"),
                  _deviceItem("assets/images/5.png","device number 1","\$100"),
                  _deviceItem("assets/images/6.png","device number 1","\$100"),
                  _deviceItem("assets/images/7.png","device number 1","\$100"),
                  _deviceItem("assets/images/8.png","device number 1","\$100"),
                  _deviceItem("assets/images/9.png","device number 1","\$100"),                  ],
                ),
              ),
            )
          ],
        ),
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
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }

}