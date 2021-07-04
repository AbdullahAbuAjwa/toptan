import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toptan/Pages/addtional_services_screen.dart';
import 'package:toptan/Pages/bank_accounts_screen.dart';
import 'package:toptan/Pages/faq_screen.dart';
import 'package:toptan/Pages/home_screen.dart';
import 'package:toptan/Pages/login_screen.dart';
import 'package:toptan/Pages/notification_screen.dart';
import 'package:toptan/Pages/order_balance_screen.dart';
import 'package:toptan/Pages/paysell_screen.dart';
import 'package:toptan/Pages/prices_screen.dart';
import 'package:toptan/Pages/service_price_screen.dart';
import 'package:toptan/Pages/super_box_screen.dart';
import 'package:toptan/Pages/term_of_use_screen.dart';
import 'Pages/chat_screen.dart';
import 'Pages/create_pos_screen.dart';
import 'Pages/edit_profile_screen.dart';
import 'Pages/financial_movements_screen.dart';
import 'Pages/forget_pass_screen.dart';
import 'Pages/google_play_screen.dart';
import 'Pages/line_screen.dart';
import 'Pages/mobile_screen.dart';
import 'Pages/privacy_policy_screen.dart';
import 'Pages/products_screen.dart';
import 'Pages/reset_pass_wcreen.dart';
import 'Pages/send_request_screen.dart';
import 'Pages/service_name_screen.dart';
import 'Pages/services_screen.dart';
import 'Pages/splash_screen.dart';
import 'Pages/super_online_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        'move_to_mobile_screen': (ctx) => MobileScreen(),
        'move_to_services_screen': (ctx) => ServicesScreen(),
        'move_to_pay_sell_screen': (ctx) => PaySellScreen(),
        'move_to_products_screen': (ctx) => ProductsScreen(),
        'move_to_google_play_screen': (ctx) => GooglePlayScreen(),
        'move_to_super_box_screen': (ctx) => SuperBoxScreen(),
        'move_to_financial_movements_screen': (ctx) => FinancialMovementsScreen(),
        'move_to_super_online_screen': (ctx) => SuperOnlineScreen(),
        'move_to_super_line_screen': (ctx) => LineScreen(),
        'move_to_chat_screen': (ctx) => ChatScreen(),
        'move_to_send_request_screen': (ctx) => SendRequestScreen(),
        'move_to_service_name_screen': (ctx) => ServiceNameScreen(),
        'move_to_home_screen': (ctx) => HomeScreen(),
        'move_to_login_screen': (ctx) => LoginScreen(),
        'move_to_term_of_use_screen': (ctx) => TermOfUseScreen(),
        'move_to_create_pos_screen': (ctx) => CreatePOSScreen(),
        'move_to_edit_profile_screen': (ctx) => EditProfileScreen(),
        'move_to_notification_screen': (ctx) => NotificationScreen(),
        'move_to_prices_screen': (ctx) => PricesScreen(),
        'move_to_service_prices_screen': (ctx) => ServicePriceScreen(),
        'move_to_bank_accounts_screen': (ctx) => BankAccountsScreen(),
        'move_to_order_balance_screen': (ctx) => OrderBalanceScreen(),
        'move_to_forget_password_screen': (ctx) => ForgetPasswordScreen(),
        'move_to_reset_password_screen': (ctx) => ResetPasswordScreen(),
        'move_to_faq_screen': (ctx) => FaqScreen(),
        'move_to_privacy_policy_screen': (ctx) => PrivacyPolicyScreen(),
        'move_to_additional_services_screen': (ctx) =>
            AdditionalServicesScreen(),
      },
    );
  }
}
