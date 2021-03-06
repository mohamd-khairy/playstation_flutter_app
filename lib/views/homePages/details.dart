
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playstation_flutter_app/controller/user.dart';

class DetailsPage extends StatefulWidget{
  final id;
  final heroTag;
  final deviceName;
  final deviceNumber;

  DetailsPage({this.id,this.heroTag,this.deviceName,this.deviceNumber});

  @override
  DetailsPageState createState() => DetailsPageState();
}
  
class DetailsPageState extends State<DetailsPage> {

  var selectedCard = 'WEIGHT';

  User user = new User();

  Future<Session> session;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
    void initState() {
      super.initState();
      session = user.openSettion(widget.id);
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
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
        title: Text('Details',
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
      body: FutureBuilder<Session>(
            future: session,
            builder: (context, snapshot) {
              void _addMarket() {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text("Add Market Item")),
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: "Item Name",
                                    hintText: "Please Enter item name",
                                    icon: Icon(Icons.description)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _priceController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "Item Price",
                                    hintText: "Please Enter valid price",
                                    icon: Icon(Icons.confirmation_number)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    RaisedButton(
                                      child: Text("Submit"),
                                      onPressed: () {},
                                    ),
                                    RaisedButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      );
                    }
                  );
              }
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height - 80.0,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                        ),
                        Positioned(
                          top: 75.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45.0),
                                topRight: Radius.circular(45.0),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height - 100.0,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Positioned(
                          top: 30.0,
                          left: (MediaQuery.of(context).size.width / 2) - 100.0,
                          child: Hero(
                            tag:widget.heroTag,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.heroTag),
                                  fit: BoxFit.cover
                                )
                              ),
                              height: 200.0,
                              width: 200.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 250.0,
                          left: 25.0,
                          right: 25.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(widget.deviceName,
                                    style: TextStyle(fontFamily: 'Montserrat',fontSize: 22.0,fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 25.0,
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text("Start : "+snapshot.data.start_date),
                                        Text("End   : "+snapshot.data.start_date),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(widget.deviceNumber,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                    color:Colors.grey,
                                  ),),
                                  Container(
                                    height: 25.0,
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  Container(
                                    width: 125.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17.0),
                                      color: Color(0xFF7A9BEE),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                          Text("Market ", style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Montserrat",
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                          InkWell(
                                          onTap: (){
                                            _addMarket();
                                          },
                                          child: Container(
                                            height: 25.0,
                                            width: 25.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.0),
                                              color: Colors.white, 
                                            ),
                                            child: Center(
                                              child: Icon(Icons.add,color: Color(0xFF7A9BEE) , size: 20.0),
                                            ),
                                          ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Container(
                                height: 150.0,
                                child: ListView(
                                  scrollDirection : Axis.horizontal,
                                  children: <Widget>[
                                    _buildInfoCard('WEIGHT','300','G'),
                                    SizedBox(width:10.0),
                                    _buildInfoCard('HEIGHT','300','G'),
                                    SizedBox(width:10.0),
                                    _buildInfoCard('TEST','300','G'),
                                    SizedBox(width:10.0),
                                    _buildInfoCard('TweEST','300','G'),
                                    SizedBox(width:10.0),
                                    _buildInfoCard('TEewST','300','G'),
                                    SizedBox(width:10.0),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)),
                                    color: Colors.black,
                                  ),
                                  height: 50.0,
                                  child: Center(
                                    child: Text('\$52.00', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
                                  ),
                                ),
                              )
                            ],
                          )
                        ),
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center( child: CircularProgressIndicator(),);
            },
          ),
      );
  }

  Widget _buildInfoCard(String cardTitle, String info , String unit){
    return InkWell(
      onTap: (){
        _selectedCard(cardTitle);
      },
      child: AnimatedContainer( 
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75
          ) 
        ),
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15.0),
              child: Text(cardTitle,
                style:  TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: cardTitle == selectedCard ? Colors.white : Colors.black,
                )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15.0),
              child: Column(
                  children: <Widget>[
                    Text(info, style:  TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                    ),
                    Text(unit, style:  TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black),
                    )
                  ], 
             ),
            ),
          ],
        ),
        )
    );
  }


  _selectedCard(cardTitle){
    setState(() {
      selectedCard = cardTitle;
    });
  }
}


class Session {
  final int id;
  final int device_id;
  final String start_date;
  final status;

  Session({this.device_id, this.id, this.start_date, this.status});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      device_id: json['device_id'],
      id: json['id'],
      status: json['status'],
      start_date: json['start_date'],
    );
  }
}


         