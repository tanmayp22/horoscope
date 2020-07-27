import 'package:flutter/cupertino.dart';
import 'package:horoscope/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
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

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF008C49),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                title: "Today",
                image: "assets/icons/aries.svg",
                textTop: "Aries",
                textBottom: "21 March - 20 April",
                offset: offset,
              ),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Keywords",
                        style: kTitleTextstyle,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            textCard1(
                              title: "Love",
                            ),
                            textCard2(
                              title: "Health",
                            ),
                            textCard3(
                              title: "Friendship",
                            ),
                          ],
                        ),
                    ),

                    SizedBox(height: 20),
                    Center(child: Text("General Horoscope", style: kTitleTextstyle)),
                    SizedBox(height: 20),
                    generalCard(
                      title: "You may be in an especially nurturing mood today, Aries. You might reach out to every living thing around you, from plants to pets to friends, children, and romantic partners. There's a danger of being too helpful and supportive, which some could find stifling. Your loved ones like to see you relaxed and happy, so channel some energy into indulging yourself. Go for a massage or other treat. Live a little!Dig deep into matters of the heart with a psychic love reading. Get an accurate prediction today!",
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
                          matchCard1(
                            title: "Love",
                            image: "assets/images/leo.png",
                            name: "Leo",
                          ),
                          matchCard2(
                            title: "Friend",
                            image: "assets/images/taurus.png",
                            name: "Taurus",
                          ),
                          matchCard3(
                            title: "Career",
                            image: "assets/images/libra.png",
                            name: "Libra",
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
                          moodCard1(
                            title: "vibe",
                            number: "50%",
                          ),
                          moodCard2(
                            title: "Hustle",
                            number:"40%",
                          ),
                          moodCard3(
                            title: "Success",
                            number: "30%",
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
      ),
    );
  }
}



class textCard1 extends StatelessWidget {
  final String title;

  const textCard1({
    Key key,
    this.title,
  }) : super(key: key);

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
      child:
          Text(
            title,
            style: TextStyle(color: Colors.red),
          ),


    );
  }
}

class textCard2 extends StatelessWidget {
  final String title;

  const textCard2({
    Key key,
    this.title,
  }) : super(key: key);

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
      child:
      Text(
          title,
        style: TextStyle(color: Color(0xFFFF7E06)),
      ),


    );
  }
}

class textCard3 extends StatelessWidget {
  final String title;

  const textCard3({
    Key key,
    this.title,
  }) : super(key: key);

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
      child:
      Text(
        title,
        style: TextStyle(color: Color(0xFF008C49)),
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
      padding: EdgeInsets.only(left: 12,right: 12),

      child:
      Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.black45),
      ),


    );
  }
}

class matchCard1 extends StatelessWidget {
  final String title;
  final String image;
  final String name;
  const matchCard1({
    Key key,
    this.title,
    this.image,
    this.name,

  }) : super(key: key);

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
            style: TextStyle(color: Colors.red,),
          ),
          SizedBox(height: 5,),
          Image.asset(image, height: 50),
          SizedBox(height: 5,),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class matchCard2 extends StatelessWidget {
  final String title;
  final String image;
  final String name;
  const matchCard2({
    Key key,
    this.title,
    this.image,
    this.name,

  }) : super(key: key);

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
            style: TextStyle(color: Color(0xFF008C49)),
          ),
          SizedBox(height: 5,),
          Image.asset(image, height: 50),
          SizedBox(height: 5,),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class matchCard3 extends StatelessWidget {
  final String title;
  final String image;
  final String name;
  const matchCard3({
    Key key,
    this.title,
    this.image,
    this.name,

  }) : super(key: key);

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
            style: TextStyle(color: Color(0xFF0094FF)),
          ),
          SizedBox(height: 5,),
          Image.asset(image, height: 50),
          SizedBox(height: 5,),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class moodCard1 extends StatelessWidget {
  final String title;
  final String number;
  const moodCard1({
    Key key,
    this.title,
    this.number,

  }) : super(key: key);

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
            style: TextStyle(color: Colors.red,),
          ),
          SizedBox(width: 5,),
          Text(
            number,
            style: TextStyle(color: Colors.red,),
          ),
        ],
      ),
    );
  }
}

class moodCard2 extends StatelessWidget {
  final String title;
  final String number;
  const moodCard2({
    Key key,
    this.title,
    this.number,

  }) : super(key: key);

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
            style: TextStyle(color: Color(0xFF3E008C)),
          ),
          SizedBox(width: 5,),
          Text(
            number,
            style: TextStyle(color: Color(0xFF3E008C)),
          ),
        ],
      ),
    );
  }
}

class moodCard3 extends StatelessWidget {
  final String title;
  final String number;
  const moodCard3({
    Key key,
    this.title,
    this.number,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 116,
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
            style: TextStyle(color: Color(0xFF0094FF)),
          ),
          SizedBox(width: 5,),
          Text(
            number,
            style: TextStyle(color: Color(0xFF0094FF)),
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
  const MyHeader(
      {Key key, this.title, this.image, this.textTop, this.textBottom, this.offset,
       /* this.planet1,
        this.planet2,
        this.planet3,
        this.planet4,*/})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      /*clipper: MyClipper(),*/
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 60, right: 20),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InfoScreen();
                    },
                  ),
                );
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
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
                  ),
                  Positioned(
                    top:(widget.offset < 0) ? 0 : 50-widget.offset,
                    left: 110,
                    child: SvgPicture.asset(
                      widget.image,
                      alignment: Alignment.center,
                      width: 80,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}


