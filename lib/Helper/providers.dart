import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:toptan/Provider/bank_account_provider.dart';
import 'package:toptan/Provider/cart_provider.dart';
import 'package:toptan/Provider/connect_provider.dart';
import 'package:toptan/Provider/line_provider.dart';
import 'package:toptan/Provider/notification_provider.dart';
import 'package:toptan/Provider/orders_provider.dart';
import 'package:toptan/Provider/prices_provider.dart';
import 'package:toptan/Provider/user_provider.dart';
import 'package:toptan/Provider/chat_provider.dart';
import 'package:toptan/Provider/companies_products_provider.dart';
import 'package:toptan/Provider/contact_us_provider.dart';
import 'package:toptan/Provider/faq_provider.dart';
import 'package:toptan/Provider/order_balance_provider.dart';
import 'package:toptan/Provider/pages_provider.dart';
import 'package:toptan/Provider/pos_provider.dart';
import 'package:toptan/Provider/service_prices_provider.dart';
import 'package:toptan/Provider/service_provider.dart';
import 'package:toptan/Provider/slider_provider.dart';
import 'package:toptan/Provider/work_throw_provider.dart';

List<SingleChildWidget> providers = [
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
  ChangeNotifierProvider.value(value: ChatProvider()),
  ChangeNotifierProvider.value(value: ServiceProvider()),
  ChangeNotifierProvider.value(value: CompaniesProductsProvider()),
  ChangeNotifierProvider.value(value: LineProvider()),
  ChangeNotifierProvider.value(value: CartProvider()),
  ChangeNotifierProvider.value(value: OrderProvider()),
  ChangeNotifierProvider.value(value: WorkThrowProvider()),
];
