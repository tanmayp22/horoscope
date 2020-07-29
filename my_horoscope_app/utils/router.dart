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
        return MaterialPageRoute(builder: (_) => SignDetail("aries",color: Color(0xFF298000)));

      case taurusRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('taurus',color: Color(0xFF8C0000)));

      case geminiRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('gemini',color: Color(0xFFFEE605)));

      case cancerRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('cancer',color: Color(0xFF6E6E6E)));

      case leoRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('leo',color: Color(0xFFFF7E06)));

      case virgoRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('virgo',color: Color(0xFFDA20B1)));

      case libraRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('libra',color: Color(0xFF8A06DB)));

      case scorpioRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('scorpio',color: Color(0xFF59FF0B)));

      case sagittariusRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('sagittarius',color: Color(0xFF0FE2FF)));

      case capricornRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('capricorn',color: Color(0xFF14008E)));

      case aquariusRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('aquarius',color: Color(0xFF8B5C30)));

      case piscesRoute:
        return MaterialPageRoute(builder: (_) => SignDetail('pisces',color: Color(0xFF6D28FF)));

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
