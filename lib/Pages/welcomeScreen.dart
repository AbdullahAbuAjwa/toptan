import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Helper/app_shared.dart';
import 'package:toptan/Provider/work_throw_provider.dart';
import 'package:toptan/Widgets/slide_card.dart';
import 'package:easy_localization/easy_localization.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<WorkThrowProvider>(context)
        .getWorkThrow(Localizations.localeOf(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<WorkThrowProvider>(context).items!.length == 0
          ? Container(
              color: Colors.white,
            )
          : IntroductionScreen(
              rawPages: Provider.of<WorkThrowProvider>(context).items!.map((e) {
                return SlideCard(
                  title: e.title,
                  image: e.image,
                  details: e.details,
                );
              }).toList(),
              onDone: () {},
              done: ElevatedButton(
                onPressed: () {
                  AppShared.sharedPreferencesController!.notShowIntro(false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: Text('get_started'.tr()),
              ),
              next: Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('next'.tr()),
                ),
              ),
            ),
    );
  }
}
