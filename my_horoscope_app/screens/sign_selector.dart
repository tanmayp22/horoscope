import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:test_auth/my_horoscope_app/utils/constants.dart';

class SelectSign extends StatelessWidget {
  final List<String> listSign = [
    'aries',
    'taurus',
    'gemini',
    'cancer',
    'leo',
    'virgo',
    'libra',
    'scorpio',
    'sagittarius',
    'capricorn',
    'aquarius',
    'pisces'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () {},
                  child: ListTile(
                    title: Text(listSign[index]),
                    onTap: () {
                      Navigator.pushNamed(context, '/' + listSign[index]);
                      // get('http://192.168.43.188:5000/' +
                      //         (index + 1).toString())
                      //     .then((value) =>
                      //         print(jsonDecode(value.body)['horoscope']));
                      // print("index {${index + 1}} pressed");
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
