import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignDetail extends StatefulWidget {
  final String data;

  SignDetail(this.data);

  @override
  _SignDetailState createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
  @override
  void initState() {
    super.initState();
  }

  Future _getData() async {
    var response = await get('http://192.168.43.188:5000/' + widget.data);
    var body = response.body;
    return jsonDecode(body);
  }

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(snapshot.data['horoscope']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                  "Sex: ${snapshot.data['star_rating']['Sex']['rating']}"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                    snapshot.data['star_rating']['Sex']
                                        ['message'],
                                    textAlign: TextAlign.center),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                  "Hustle ${snapshot.data['star_rating']['Hustle']['rating']}"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                    snapshot.data['star_rating']['Hustle']
                                        ['message'],
                                    textAlign: TextAlign.center),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                  "Vibe: ${snapshot.data['star_rating']['Vibe']['rating']}"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  snapshot.data['star_rating']['Vibe']
                                      ['message'],
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                  "Success: ${snapshot.data['star_rating']['Success']['rating']}"),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                    snapshot.data['star_rating']['Success']
                                        ['message'],
                                    textAlign: TextAlign.center),
                              )
                            ],
                          )
                        ],
                      )
                    ]),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
