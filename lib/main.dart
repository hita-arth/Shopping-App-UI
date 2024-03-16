import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
import 'package:shop_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Groteska', //use another font here for the rest of uis font
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 0, 0),
            primary: const Color.fromARGB(255, 0, 0, 0),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'NOTHING', fontSize: 13.5, color: Colors.black)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontFamily: 'Groteska',
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          useMaterial3: true,
        ),
        title: 'Shopping app',
        home: const HomeScreen(),
      ),
    );
  }
}
