import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffety/models/coffee.dart';
import 'models/coffeedb.dart';
import 'screens/home.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>CoffeeSystem(),
      child: MaterialApp(
        initialRoute: splash_screen.screenkey,
        routes: {
         home.screenkey : (contex){
           return const home();
         },
         splash_screen.screenkey : (contex){
           return const splash_screen();
         }
        },
      ),
    )
  );
}

