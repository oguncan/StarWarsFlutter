import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  Map<String, dynamic> _listItems;
  String topic;
  DetailPage(this._listItems, this.topic);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text("Star Wars"),
          centerTitle: true,
        ),
        body: topicList(context));
  }

  Widget topicList(BuildContext context) {
    if (topic == "FILM") {
      return new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            Container(
              child: new Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              constraints: new BoxConstraints.expand(width: 400),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.movie,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Container(
                    width: 90.0,
                    child: new Divider(color: Colors.green),
                  ),
                  Text(
                    _listItems['title'],
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Director: ${_listItems['director']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Producer: ${_listItems['producer']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: Text(
                            "Episode: ${_listItems['episode_id']}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 150),
                  Text("Merhaba")
                ],
              )),
            ),
          ],
        ),
      );
    } else if (topic == "PEOPLE") {
      return new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            Container(
              child: new Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              constraints: new BoxConstraints.expand(height: 700.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Container(
                    width: 90.0,
                    child: new Divider(color: Colors.green),
                  ),
                  Text(
                    _listItems['name'],
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Height: ${_listItems['height']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Mass: ${_listItems['mass']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Gender: ${_listItems['gender']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                ],
              )),
            ),
          ],
        ),
      );
    } else if (topic == "PLANET") {
      return new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            Container(
              child: new Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              constraints: new BoxConstraints.expand(width: 400),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.airplanemode_active,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Container(
                    width: 90.0,
                    child: new Divider(color: Colors.green),
                  ),
                  Text(
                    "Name: ${_listItems['name']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Rotation Period: ${_listItems['rotation_period']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Orbital Period: ${_listItems['orbital_period']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: Text(
                            "Climate: ${_listItems['climate']}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )),
                    ],
                  ),
                  SizedBox(height: 150),
                ],
              )),
            ),
          ],
        ),
      );
    } else if (topic == "SPECIE") {
      return new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            Container(
              child: new Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              constraints: new BoxConstraints.expand(width: 400),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.category,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Container(
                    width: 90.0,
                    child: new Divider(color: Colors.green),
                  ),
                  Text(
                    "Name: ${_listItems['name']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Classification: ${_listItems['classification']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Designation: ${_listItems['designation']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: Text(
                            "Average Height: ${_listItems['average_height']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 150),
                ],
              )),
            ),
          ],
        ),
      );
    } else if (topic == "STARSHIP") {
      return new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            Container(
              child: new Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              constraints: new BoxConstraints.expand(width: 400),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Container(
                    width: 90.0,
                    child: new Divider(color: Colors.green),
                  ),
                  Text(
                     "Name: ${_listItems['name']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Model: ${_listItems['model']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Manufacturer: ${_listItems['manufacturer']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: Text(
                            "Length: ${_listItems['length']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 150),
                  
                ],
              )),
            ),
          ],
        ),
      );
    } else {
      return new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            Container(
              child: new Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
              constraints: new BoxConstraints.expand(width: 400),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Container(
                    width: 90.0,
                    child: new Divider(color: Colors.green),
                  ),
                  Text(
                    "Name: ${_listItems['name']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Model: ${_listItems['model']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Manufacturer: ${_listItems['manufacturer']}",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 6,
                          child: Text(
                            "Length: ${_listItems['length']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 150),
                 
                ],
              )),
            ),
          ],
        ),
      );
    }
  }
}
