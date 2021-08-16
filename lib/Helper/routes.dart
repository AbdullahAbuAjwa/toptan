import 'package:flutter/material.dart';
import 'package:toptan/Pages/addtional_services_screen.dart';
import 'package:toptan/Pages/bank_accounts_screen.dart';
import 'package:toptan/Pages/change_password_screen.dart';
import 'package:toptan/Pages/chat_screen.dart';
import 'package:toptan/Pages/check_internet_screen.dart';
import 'package:toptan/Pages/create_pos_screen.dart';
import 'package:toptan/Pages/edit_profile_screen.dart';
import 'package:toptan/Pages/faq_screen.dart';
import 'package:toptan/Pages/financial_movements_screen.dart';
import 'package:toptan/Pages/forget_pass_screen.dart';
import 'package:toptan/Pages/qr_code_scanner_page.dart';
import 'package:toptan/Pages/send_request_order.dart';
import 'package:toptan/Pages/service_details_screen.dart';
import 'package:toptan/Pages/home_screen.dart';
import 'package:toptan/Pages/line_screen.dart';
import 'package:toptan/Pages/login_screen.dart';
import 'package:toptan/Pages/products_screen.dart';
import 'package:toptan/Pages/notification_screen.dart';
import 'package:toptan/Pages/order_balance_screen.dart';
import 'package:toptan/Pages/prices_screen.dart';
import 'package:toptan/Pages/privacy_policy_screen.dart';
import 'package:toptan/Pages/products_company_screen.dart';
import 'package:toptan/Pages/send_request_screen.dart';
import 'package:toptan/Pages/order_details_screen.dart';
import 'package:toptan/Pages/service_price_screen.dart';
import 'package:toptan/Pages/services_screen.dart';

import 'package:toptan/Pages/term_of_use_screen.dart';
import 'package:toptan/Pages/web_view_screen.dart';

Map<String, Widget Function(BuildContext)> ROUTES = {
  'move_to_products_screen': (ctx) => ProductsScreen(),
  'move_to_services_screen': (ctx) => ServicesScreen(),
  'move_to_products_company_screen': (ctx) => ProductsCompanyScreen(),
  'move_to_service_details_screen': (ctx) => ServiceDetailsScreen(),
  'move_to_financial_movements_screen': (ctx) => FinancialMovementsScreen(),
  'move_to_super_line_screen': (ctx) => LineScreen(),
  'move_to_chat_screen': (ctx) => ChatScreen(),
  'move_to_send_request_screen': (ctx) => SendRequestScreen(),
  'move_to_send_request_order_screen': (ctx) => SendRequestOrderScreen(),
  'move_to_order_details_screen': (ctx) => OrderDetailsScreen(),
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
  'move_to_faq_screen': (ctx) => FaqScreen(),
  'move_to_privacy_policy_screen': (ctx) => PrivacyPolicyScreen(),
  'move_to_additional_services_screen': (ctx) => AdditionalServicesScreen(),
  'move_to_webView_screen': (ctx) => WebViewScreen(),
  'move_to_check_internet_screen': (ctx) => CheckInternetScreen(),
  'move_to_change_pass_screen': (ctx) => ChangePasswordScreen(),
  'move_to_qr_code_scanner_screen': (ctx) => QRScannerScreen(),
};
