import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const BitcoinTickerApp());
}

class BitcoinTickerApp extends StatelessWidget {
  const BitcoinTickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: const PriceScreen(),
    );
  }
}
