import 'package:flutter/material.dart';
import '../main.dart';
import '../info_screen.dart';
import 'constants.dart';

class Router {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case ariesRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen("aries", color: 0xFF298000));

      case taurusRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('taurus', color: 0xFF8C0000));

      case geminiRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('gemini', color: 0xFFFEE605));

      case cancerRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('cancer', color: 0xFF6E6E6E));

      case leoRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('leo', color: 0xFFFF7E06));

      case virgoRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('virgo', color: 0xFFDA20B1));

      case libraRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('libra', color: 0xFF8A06DB));

      case scorpioRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('scorpio', color: 0xFF59FF0B));

      case sagittariusRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('sagittarius', color: 0xFF0FE2FF));

      case capricornRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('capricorn', color: 0xFF14008E));

      case aquariusRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('aquarius', color: 0xFF8B5C30));

      case piscesRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen('pisces', color: 0xFF6D28FF));

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
