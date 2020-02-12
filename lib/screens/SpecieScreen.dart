import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Film.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'DetailPage.dart';

class SpecieScreen extends StatefulWidget {
  @override
  _SpecieScreenState createState() => _SpecieScreenState();
}

class _SpecieScreenState extends State<SpecieScreen> {
  TextEditingController _specieList = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredTitle = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Specie List');
  Dio dio = Dio();
  _SpecieScreenState() {
    _specieList.addListener(() {
      if (_specieList.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredTitle = names;
        });
      } else {
        setState(() {
          _searchText = _specieList.text;
        });
      }
    });
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

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredTitle.length; i++) {
        if (filteredTitle[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredTitle[i]);
        }
      }
      filteredTitle = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredTitle.length,
      itemBuilder: (BuildContext context, int index) {
        return _searchText.isEmpty
            ? null
            : new ListTile(
                title: Text(filteredTitle[index]['name']),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(filteredTitle[index], 'SPECIE'),
                  ),
                ),
              );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _specieList,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredTitle = names;
        _specieList.clear();
      }
    });
  }

  void _getNames() async {
    final response = await dio.get('https://swapi.co/api/species');
    List tempList = new List();
    for (int i = 0; i < response.data['results'].length; i++) {
      tempList.add(response.data['results'][i]);
    }
    setState(() {
      names = tempList;
      names.shuffle();
      filteredTitle = names;
    });
  }
}
