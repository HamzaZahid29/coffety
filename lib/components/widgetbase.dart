import 'package:flutter/material.dart';
import 'package:coffety/consts/colors.dart' as appColors;
class coffeeCard extends StatelessWidget {
  String name,path,price;
  IconData iconData;
  final void Function()? func;

  coffeeCard(this.name, this.path, this.price, this.iconData, this.func);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color:appColors.secColor
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListTile(

          contentPadding: EdgeInsets.all(20),
          title: Text(name),
          leading: Image.asset(path),
          subtitle: Text(price),
          trailing: GestureDetector(
              onTap: func,
              child: Icon(iconData)),
        ),
      ),
    );
  }
}
