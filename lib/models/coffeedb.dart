
import 'package:flutter/material.dart';
import 'coffee.dart';
class CoffeeSystem extends ChangeNotifier{
  List<coffee> _coffeeList = [
    coffee(
     'Black Coffee', 150, 'assets/blackcoffee.png'
    ),coffee(
     'Lattee', 120, 'assets/latte.png'
    ),
    coffee(
     'espresso', 320, 'assets/espresso.png'
    ),
    coffee(
     'cappuccino', 320, 'assets/cappuccino.png'
    ),
    coffee(
     'americano', 320, 'assets/americano.png'
    ),
    coffee(
     'americano', 320, 'assets/americano.png'
    ),
    coffee(
     'macchiato', 320, 'assets/macchiato.png'
    ),
  ];

  List<coffee> _userCartList = [];


  List<coffee> get coffeeList => _coffeeList;

  List<coffee> get userCartList => _userCartList;


  void addtocart(coffee cc){
    _userCartList.add(cc);
    notifyListeners();
  }

  void removefromcart(coffee cc){
    _userCartList.remove(cc);
    notifyListeners();
  }
  void clearcart(){
    _userCartList.clear();
    notifyListeners();
  }

}