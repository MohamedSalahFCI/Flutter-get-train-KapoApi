import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_train_data_from_kapo_api/train.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ReadTrainData extends StatefulWidget {
  @override
  _ReadTrainDataState createState() => _ReadTrainDataState();
}

class _ReadTrainDataState extends State<ReadTrainData> {
  final String _url = "https://booking-python.herokuapp.com/api/v1/dates";
  List _data;

  Future<Train> getData() async {
    print("a7na hna");
    var res = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});

    final _resBody = json.decode(res.body);
    return new Train.fromJson(_resBody);
  }

  Widget _listView(_data) => new ListView.builder(
        itemCount: _data == null ? 0 : _data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            elevation: 4.0,
            color: Colors.grey,
            child: Container(
              height: 90,
              child: Column(
                children: <Widget>[
                  new Text(
                    _data[index].to,
                    textAlign: TextAlign.start,
                  ),
                  //new Text("${_data.length}"),
                ],
              ),
            ),
          );
        },
      );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("yes momo Real Train Data api "),
      ),
      body: FutureBuilder<Train>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LiquidPullToRefresh(
              showChildOpacityTransition: false,
              child: _listView(snapshot.data.myData),
              onRefresh: () => getData(),
            );

            //_listView(snapshot.data.myData);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          return new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}

/*
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_train_data_from_kapo_api/train.dart';

class ReadTrainData extends StatefulWidget {
  @override
  _ReadTrainDataState createState() => _ReadTrainDataState();
}

class _ReadTrainDataState extends State<ReadTrainData> {
  final String _url = "https://booking-python.herokuapp.com/api/v1/dates";
  List _data;

  Future<Train> getData() async {
    var res = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});

    final _resBody = json.decode(res.body);
    return new Train.fromJson(_resBody);
  }

  Widget _listView(_data) => new ListView.builder(
        itemCount: _data == null ? 0 : _data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            elevation: 4.0,
            color: Colors.grey,
            child: Container(
              height: 90,
              child: Column(
                children: <Widget>[
                  new Text(
                    _data[index].to,
                    textAlign: TextAlign.start,
                  ),
                  //new Text("${_data.length}"),
                ],
              ),
            ),
          );
        },
      );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("yes momo Real Train Data api "),
      ),
      body: FutureBuilder<Train>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _listView(snapshot.data.myData);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          return new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}

 */
