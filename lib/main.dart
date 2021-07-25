import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toptan/Provider/contact_us_provider.dart';
import 'package:toptan/Provider/faq_provider.dart';
import 'package:toptan/Provider/order_balance_provider.dart';
import 'package:toptan/Provider/pages_provider.dart';
import 'package:toptan/Provider/pos_provider.dart';
import 'package:toptan/Provider/service_prices_provider.dart';
import 'package:toptan/Provider/slider_provider.dart';

import 'Helper/app_shared.dart';
import 'Helper/routes.dart';
import 'Helper/share_preferences.dart';
import 'package:flutter/material.dart';
import 'Pages/splash_screen.dart';
import 'Provider/bank_account_provider.dart';
import 'Provider/connect_provider.dart';
import 'Provider/user_provider.dart';
import 'Provider/notification_provider.dart';
import 'Provider/prices_provider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _connectionStatus = '';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: NotificationProvider()),
        ChangeNotifierProvider.value(value: SliderProvider()),
        ChangeNotifierProvider.value(value: FAQProvider()),
        ChangeNotifierProvider.value(value: PagesProvider()),
        ChangeNotifierProvider.value(value: ContactUsProvider()),
        ChangeNotifierProvider.value(value: PointOfSaleProvider()),
        ChangeNotifierProvider.value(value: PricesProvider()),
        ChangeNotifierProvider.value(value: ServicePricesProvider()),
        ChangeNotifierProvider.value(value: BankAccountProvider()),
        ChangeNotifierProvider.value(value: ConnectivityProvider()),
        ChangeNotifierProvider.value(value: OrderBalanceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Toptan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: _connectionStatus.toString() == ConnectivityResult.none.toString()
            ? Scaffold(
                backgroundColor: Color(0xff08A8FF),
                body: AlertDialog(
                  title: Text('no_internet'.tr()),
                  content: Text('check_internet'.tr()),
                ),
              )
            : SplashScreen(),
        routes: ROUTES,
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  AppShared.sharedPreferencesController =
      await SharedPreferencesController.instance;

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ar'),
      Locale('tr'),
    ],
    fallbackLocale: Locale('en'),
    path: 'assets/lang',
    saveLocale: true,
    child: MyApp(),
  ));
}
//todo
//pushNamedAndRemoveUntil('name',ModalRoute().withName('name'));
//pushNamedAndRemoveUntil('name',(route) => false);
//mobile in shared preference
