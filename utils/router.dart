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
            builder: (_) => InfoScreen(
                  "Aries",
                  color: 0xFF298000,
                  date: "Mar 21 -Apr 19",
                ));

      case taurusRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Taurus',
                  color: 0xFF8C0000,
                  date: "Apr 20 - May 20",
                ));

      case geminiRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Gemini',
                  color: 0xFFFEE605,
                  date: "May 21 - Jun 20",
                ));

      case cancerRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Cancer',
                  color: 0xFF6E6E6E,
                  date: "Jun 21 - Jul 22",
                ));

      case leoRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Leo',
                  color: 0xFFFF7E06,
                  date: "Jul 23 - Aug 22",
                ));

      case virgoRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Virgo',
                  color: 0xFFDA20B1,
                  date: "Aug 23 - Sept 22",
                ));

      case libraRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Libra',
                  color: 0xFF8A06DB,
                  date: "Sept 23 - Oct 22",
                ));

      case scorpioRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Scorpio',
                  color: 0xFF59FF0B,
                  date: "Oct 23 - Nov 21",
                ));

      case sagittariusRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Sagittarius',
                  color: 0xFF0FE2FF,
                  date: "Nov 22 - Dec 21",
                ));

      case capricornRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Capricorn',
                  color: 0xFF14008E,
                  date: "Dec 22 - Jan 19",
                ));

      case aquariusRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Aquarius',
                  color: 0xFF8B5C30,
                  date: "Jan 20 - Feb 18",
                ));

      case piscesRoute:
        return MaterialPageRoute(
            builder: (_) => InfoScreen(
                  'Pisces',
                  color: 0xFF6D28FF,
                  date: "Feb 19 - Mar 20",
                ));

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
