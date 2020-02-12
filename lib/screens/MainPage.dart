import 'package:flutter/material.dart';
import './FilmScreen.dart';
import './PeopleScreen.dart';
import './SpecieScreen.dart';
import './StarshipScreen.dart';
import './VehicleScreen.dart';
import './PlanetScreen.dart';
import '../models/People.dart';
import 'package:splashscreen/splashscreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Splash extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new _MyAppState(),
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.asset('assets/images/splash.png'),
      //backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}

class _MyAppState extends State<MyApp> {
  List<String> topics = [
    "FILMS",
    "PEOPLE",
    "PLANETS",
    "SPECIES",
    "STARSHIP",
    "VEHICLES"
  ];

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
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Container(
                  height: 150,
                  width: 300,
                  child: Image.asset(
                    'assets/images/splash1.png',
                    fit: BoxFit.cover,
                  ),
                  constraints: new BoxConstraints.expand(height: 190.0),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: topics.length,
                itemBuilder: (BuildContext ctx, int index) => Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          child: Card(
                            elevation: 4.0,
                            margin: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(64, 75, 96, .9)),
                              child: ListTile(
                                title: Text(
                                  "${topics[index]}",
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  if (topics[index] == "FILMS") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FilmScreen()),
                                    );
                                  }
                                  if (topics[index] == "PEOPLE") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PeopleScreen()),
                                    );
                                  }
                                  if (topics[index] == "PLANETS") {
                                    print(topics[index]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlanetScreen()),
                                    );
                                  }
                                  if (topics[index] == "SPECIES") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SpecieScreen()),
                                    );
                                  }
                                  if (topics[index] == "STARSHIP") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StarshipScreen()),
                                    );
                                  }
                                  if (topics[index] == "VEHICLES") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VehicleScreen()),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
          ],
        ));
  }
}
