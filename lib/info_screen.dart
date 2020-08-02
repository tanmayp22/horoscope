import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:test_auth/horoscope/utils/Horoscope.dart';
import 'utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  final String data;
  final int color;
  final String date;
  Horoscope horoscope;
  InfoScreen(this.data, {this.color, this.horoscope, this.date});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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

  Future _getData() async {
    if (widget.horoscope == null) {
      await get('https://horoscope-scraper.herokuapp.com/${widget.data}')
          .then((value) {
        widget.horoscope = Horoscope.fromJson(jsonDecode(value.body));
      });
    }
    return widget.horoscope;
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                body: SingleChildScrollView(
              controller: controller,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(widget.color),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyHeader(
                      title: "Today",
                      image: "assets/icons/${widget.data}.svg",
                      textTop: "${widget.data}",
                      textBottom: "${widget.date}",
                      offset: offset,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 30),
                          Center(
                              child: Text("General Horoscope",
                                  style: kTitleTextstyle)),
                          SizedBox(height: 20),
                          generalCard(
                            title: widget.horoscope.horoscope,
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              "Match",
                              style: kTitleTextstyle,
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MatchCard(
                                  title: "Love",
                                  image:
                                      "assets/images/${widget.horoscope.matches.love}.png",
                                  name: "${widget.horoscope.matches.love}",
                                  color: 0xfff44336,
                                ),
                                MatchCard(
                                    title: "Friend",
                                    image:
                                        "assets/images/${widget.horoscope.matches.friendship}.png",
                                    name:
                                        "${widget.horoscope.matches.friendship}",
                                    color: 0xFF008C49),
                                MatchCard(
                                  title: "Career",
                                  image:
                                      "assets/images/${widget.horoscope.matches.career}.png",
                                  name: "${widget.horoscope.matches.career}",
                                  color: 0xFF0094FF,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              "Mood",
                              style: kTitleTextstyle,
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MoodCard(
                                  title: "Vibe",
                                  number:
                                      "${widget.horoscope.starRating.vibe.rating}%",
                                  color: 0xfff44336,
                                ),
                                MoodCard(
                                  title: "Hustle",
                                  number:
                                      "${widget.horoscope.starRating.hustle.rating}%",
                                  color: 0xFF3E008C,
                                ),
                                MoodCard(
                                  title: "Success",
                                  number:
                                      "${widget.horoscope.starRating.success.rating}%",
                                  color: 0xFF0094FF,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
          }
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }
}

class TextCard extends StatelessWidget {
  final String title;
  final int color;

  const TextCard({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 0.5, color: const Color(0xFFD7D7D7)),
        color: Colors.white,
      ),
      child: Text(
        title,
        style: TextStyle(color: Color(this.color)),
      ),
    );
  }
}

class generalCard extends StatelessWidget {
  final String title;

  const generalCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String title;
  final String image;
  final String name;
  final int color;
  const MatchCard({Key key, this.title, this.image, this.name, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: const Color(0xFFD7D7D7)),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Color(this.color),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Image.asset(image, height: 50),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MoodCard extends StatelessWidget {
  final String title;
  final String number;
  final int color;

  const MoodCard({Key key, this.title, this.number, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: const Color(0xFFD7D7D7)),
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Color(this.color),
              fontSize: 12.8,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            number,
            style: TextStyle(
              color: Color(this.color),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHeader extends StatefulWidget {
  final String title;
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  /*final String planet1;
  final String planet2;
  final String planet3;
  final String planet4;*/
  const MyHeader({
    Key key,
    this.title,
    this.image,
    this.textTop,
    this.textBottom,
    this.offset,
    /* this.planet1,
        this.planet2,
        this.planet3,
        this.planet4,*/
  }) : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      /*clipper: MyClipper(),*/
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 60, right: 40),
        height: 360,
        width: double.infinity,
        /*decoration: BoxDecoration(

            color:Color(0xFFB8FFDD),


        ),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, homeRoute);
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      /*"${widget.textTop} \n${widget.textBottom}",*/
                      widget.title,
                      textAlign: TextAlign.center,
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SvgPicture.asset(
                      widget.image,
                      alignment: Alignment.center,
                      height: 80,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      /*"${widget.textTop} \n${widget.textBottom}",*/
                      widget.textTop,
                      textAlign: TextAlign.center,
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.textBottom,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    /*Positioned(
                      top: 0 - widget.offset / 1,
                      left: 125,
                      child: Column(
                        children: <Widget>[
                          Text(
                            /*"${widget.textTop} \n${widget.textBottom}",*/
                            widget.title,
                            textAlign: TextAlign.center,
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),*/

                    /*Positioned(
                      top: (widget.offset < 0) ? 0 : 50 - widget.offset,
                      left: 120,
                      child: SvgPicture.asset(
                        widget.image,
                        alignment: Alignment.center,
                        height: 80,
                        fit: BoxFit.fitWidth,
                      ),
                    ),*/

                    // I dont know why it can't work without container
                  ],
                ),
              ),

              /*child: Stack(
                children: <Widget>[
                  /*Positioned(
                    top: 0 - widget.offset / 1,
                    left: 125,
                    child: Column(
                      children: <Widget>[
                        Text(
                          /*"${widget.textTop} \n${widget.textBottom}",*/
                          widget.title,
                          textAlign: TextAlign.center,
                          style: kHeadingTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),*/

                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(
                          /*"${widget.textTop} \n${widget.textBottom}",*/
                          widget.title,
                          textAlign: TextAlign.center,
                          style: kHeadingTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /*Positioned(
                    top: (widget.offset < 0) ? 0 : 50 - widget.offset,
                    left: 120,
                    child: SvgPicture.asset(
                      widget.image,
                      alignment: Alignment.center,
                      height: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),*/

                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      widget.image,
                      alignment: Alignment.center,
                      height: 80,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  Positioned(
                    top: 170 - widget.offset / 2,
                    left: 80,
                    child: Column(
                      children: <Widget>[
                        Text(
                          /*"${widget.textTop} \n${widget.textBottom}",*/
                          widget.textTop,
                          textAlign: TextAlign.center,
                          style: kHeadingTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.textBottom,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}
