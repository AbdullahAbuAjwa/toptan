import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 185.0,
          autoPlay: true,
          viewportFraction: 0.9,
        ),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x15000000),
                      offset: Offset(0, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'iOS 11 Wireframes\nfor iPhone X',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: const Color(0xff4a494b),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: Text(
                              'Make amazing and clean iOS 11\nwireframes for your next app project.',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: const Color(0xff4a494b),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        'assets/images/mobile.png',
                        height: 120,
                        width: 120,
                      ),
                    ))
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
