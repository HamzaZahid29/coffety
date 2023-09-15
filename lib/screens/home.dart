import 'package:flutter/material.dart';
import 'package:coffety/consts/colors.dart' as appColors;
import 'package:coffety/consts/styles.dart' as fontStyles;
import 'package:coffety/components/widgetbase.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'shop.dart';
import 'cart.dart';

class home extends StatefulWidget {
  static String screenkey = '/homekey';
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentScreen = 0;
  List<Widget> screenLsit = [shop(), cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28),
          child: screenLsit[currentScreen],
        ),
      ),
      bottomNavigationBar: Container(
        
        child: GNav(
          onTabChange: (value) {
            setState(() {
              currentScreen = value;
            });
          },
          mainAxisAlignment: MainAxisAlignment.center,
          gap: 12,
          padding: EdgeInsets.all(20),
          activeColor: appColors.mainColor,
          tabBackgroundColor: appColors.secColor,
          color: appColors.secColor,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "home",
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "cart",
            ),
          ],
        ),
      ),
    );
  }
}
