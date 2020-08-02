import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'utils/constants.dart';
import 'package:flutter/material.dart';
import 'utils/router.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horoscope',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      onGenerateRoute: Router().generateRoute,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          "Choose a Sign",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kBackgroundColor,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 120),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ariesRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Aries.png",
                            title: "Aries",
                            title2: "Mar 21 -Apr 19",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, taurusRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Taurus.png",
                            title: "Taurus",
                            title2: "Apr 20 - May 20",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, geminiRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Gemini.png",
                            title: "Gemini",
                            title2: "May 21 - Jun 20",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, cancerRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Cancer.png",
                            title: "Cancer",
                            title2: "Jun 21 - Jul 22",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, leoRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Leo.png",
                            title: "Leo",
                            title2: "Jul 23 - Aug 22",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, virgoRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Virgo.png",
                            title: "Virgo",
                            title2: "Aug 23 - Sept 22",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, libraRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Libra.png",
                            title: "Libra",
                            title2: "Sept 23 - Oct 22",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, scorpioRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Scorpio.png",
                            title: "Scorpio",
                            title2: "Oct 23 - Nov 21",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, sagittariusRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Sagittarius.png",
                            title: "Sagittarius",
                            title2: "Nov 22 - Dec 21",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, capricornRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Capricorn.png",
                            title: "Capricorn",
                            title2: "Dec 22 - Jan 19",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, aquariusRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Aquarius.png",
                            title: "Aquarius",
                            title2: "Jan 20 - Feb 18",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, piscesRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/Pisces.png",
                            title: "Pisces",
                            title2: "Feb 19 - Mar 20",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final String title2;
  const SymptomCard({
    Key key,
    this.image,
    this.title2,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.5, color: const Color(0xFFD7D7D7)),
        color: Colors.white,
        /*boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
        ],*/
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          SizedBox(height: 10),
          Text(
            "${title}",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "${title2}",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
