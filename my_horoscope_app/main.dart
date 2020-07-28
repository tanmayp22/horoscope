import 'package:flutter/material.dart';

import './utils/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // routes: {
      //   '/': (context) => SelectSign(),
      //   '/aries': (context) => SignDetail(),
      // },
      onGenerateRoute: Router().generateRoute,
      // onUnknownRoute: (settings) {
      //   print(settings.name);
      //   return null;
      // },
      // initialRoute: homeRoute,
    );
  }
}
