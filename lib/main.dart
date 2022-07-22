import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/main_page.dart';
import 'package:modern_ecommerce/providers/cart_provider.dart';
import 'package:modern_ecommerce/screens/auth/login_screen.dart';
import 'package:modern_ecommerce/seller_main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Cart())
    ],
    child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: app,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initial,
      routes: {
        initial: (context) => const LoginScreen(),
        homeR: (context) => const MainPage(),
        sellerHome: (context) => const SellerMainPage(),
      },
    );
  }
}
