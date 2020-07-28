import 'package:flutter/material.dart';

import '../screens/sign_detail.dart';
import '../screens/sign_selector.dart';
import 'constants.dart';

class Router {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => SelectSign());

      case ariesRoute:
        return MaterialPageRoute(builder: (_) => SignDetail("aries"));

      case taurusRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('taurus'));

      case geminiRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('gemini'));

      case cancerRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('cancer'));

      case leoRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('leo'));

      case virgoRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('virgo'));

      case libraRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('libra'));

      case scorpioRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('scorpio'));

      case sagittariusRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('sagittarius'));

      case capricornRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('capricorn'));

      case aquariusRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('aquarius'));

      case piscesRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('pisces'));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
