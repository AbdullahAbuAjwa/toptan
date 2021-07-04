import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:toptan/Pages/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Slide> slides = [];

  Widget description() {
    return Column(
      children: [
        Text(
          'iOS 11 Wireframes\nfor iPhone X',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 28,
            color: const Color(0xff323b4a),
            letterSpacing: 0.336,
            height: 1.2142857142857142,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
        Text(
          'Make amazing and clean iOS 11 wireframes for your next app project.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            color: const Color(0xff323b4a),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        pathImage: 'assets/images/welcome1.png',
        heightImage: 300,
        backgroundImageFit: BoxFit.scaleDown,
        widgetDescription: description(),
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        pathImage: 'assets/images/welcome2.png',
        heightImage: 200,
        backgroundImageFit: BoxFit.scaleDown,
        widgetDescription: description(),
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        pathImage: 'assets/images/welcome3.png',
        heightImage: 300,
        backgroundImageFit: BoxFit.scaleDown,
        widgetDescription: description(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        slides: this.slides,
        nameDoneBtn: 'Get Started',
        onDonePress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return LoginScreen();
              },
            ),
          );
        },
        colorSkipBtn: Color(0xff08A8FF),
        colorDoneBtn: Color(0xff08A8FF),
        colorPrevBtn: Color(0xff08A8FF),
        colorActiveDot: Color(0xff08A8FF),
        borderRadiusSkipBtn: 15,
        showSkipBtn: false,
        nameNextBtn: 'Skip',
      ),
    );
  }
}