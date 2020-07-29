import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:test_auth/my_horoscope_app/utils/constants.dart';
import 'constant.dart';
import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'utils/router.dart';

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
        elevation: 0,
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
                SizedBox(height: 140),
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
                            image: "assets/images/aries.png",
                            title: "Aries",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, leoRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/leo.png",
                            title: "Leo",
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
                            Navigator.pushNamed(context, cancerRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/cancer.png",
                            title: "Cancer",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, piscesRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/pisces.png",
                            title: "Pisces",
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
                            Navigator.pushNamed(context, taurusRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/taurus.png",
                            title: "Taurus",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, virgoRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/virgo.png",
                            title: "Virgo",
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
                            image: "assets/images/sagittarius.png",
                            title: "Sagittarius",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, geminiRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/gemini.png",
                            title: "Gemini",
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
                            Navigator.pushNamed(context, scorpioRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/scorpio.png",
                            title: "Scorpio",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, libraRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/libra.png",
                            title: "Libra",
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
                            Navigator.pushNamed(context, capricornRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/capricorn.png",
                            title: "Capricorn",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, aquariusRoute);
                          },
                          child: SymptomCard(
                            image: "assets/images/aquarius.png",
                            title: "Aquarius",
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
  const SymptomCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 140,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
