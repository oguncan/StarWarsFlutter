import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/People.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'DetailPage.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  TextEditingController _peopleFilter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  _PeopleScreenState() {
    _peopleFilter.addListener(() {
      if (_peopleFilter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _peopleFilter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
    // _peopleList().then((okunanDeger) {
    //   people = okunanDeger;
    //   print(people.name);
    // });
    // _peopleList();
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return _searchText.isEmpty
            ? null
            : new ListTile(
                title: Text(filteredNames[index]['name']),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(filteredNames[index], 'PEOPLE'),
                  ),
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      body: Container(
        child: _buildList(),
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _peopleFilter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _peopleFilter.clear();
      }
    });
  }

  void _getNames() async {
    final response = await dio.get('https://swapi.co/api/people');
    List tempList = new List();
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  }
}

// HTTP PACKAGE DENEME

// SafeArea(
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
// child: FutureBuilder(
//     future: _peopleList(),
//     builder: (ctx, AsyncSnapshot<People> snapshot) {
//       if (snapshot.hasData) {
//         return ListTile(
//           title: Text(snapshot.data.name),
//         );
//       }
//       else
//       {
//         return Center(child: CircularProgressIndicator());
//       }
//     })
// child: SearchBar<People>(
//   onSearch: search,
//   onItemFound: (People post, int index) {
//     return ListTile(
//       title: Text(post.name),
//       subtitle: Text(post.height),
//     );
//   },
// ),
//   ),
// ),
// appBar: AppBar(
//   title: _appBarTitle,
//   leading: new IconButton(
//     icon: _searchIcon,
//     onPressed: _searchPressed,
//   ),
// ),
// body: Container(child: Text("Merhaba People")),
// resizeToAvoidBottomPadding: false,
// Future<List<People>> search(String search) async {
//   await Future.delayed(Duration(seconds: 2));
//   return List.generate(search.length, (int index) {
//     return People();
//   });
// }

// People people;
// List peopleList;

// Future<String> _peopleList() async {
//   var response = await http.get("https://swapi.co/api/people/");

//   // if (response.statusCode == 200) {
//   //   return People.fromJson(json.decode(response.body));
//   // } else {
//   //   throw Exception("Baglanamadik ${response.statusCode}");
//   // }
//   for (int i = 0; i < response.data['results'].length; i++) {
//     tempList.add(response.data['results'][i]);
//   }
//   setState(() {
//     names = tempList;
//     names.shuffle();
//     filteredNames = names;
//   });
//   setState(() {
//     var data = json.decode(response.body);
//     peopleList = data['results'];
//   });
//   return 'Successfull';
// }
