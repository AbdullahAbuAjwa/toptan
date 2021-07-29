import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHomeScreenCard extends StatelessWidget {
  List? items;
  String? image;
  String? link;

  SliderHomeScreenCard({this.items, this.image, this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('move_to_webView_screen', arguments: {'link': link});
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 170.0,
            autoPlay: true,
            viewportFraction: 0.9,
          ),
          items: items!.map((i) {
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
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
