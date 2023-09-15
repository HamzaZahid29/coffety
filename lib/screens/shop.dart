import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffety/consts/colors.dart' as appColors;
import 'package:coffety/consts/styles.dart' as fontStyles;
import 'package:coffety/components/widgetbase.dart';
import 'package:coffety/components/customBottomSheet.dart';
import 'package:coffety/models/coffee.dart';
import 'package:coffety/models/coffeedb.dart';


class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {


  @override
  Widget build(BuildContext context) {
    void showCustomBottomSheet(

        BuildContext context, String name, String price, String path,coffee cc) {
      showModalBottomSheet(

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

          ),
          context: context,
          builder: (BuildContext context) {
            return CustomBottomSheet(path,name,(){
              Provider.of<CoffeeSystem>(context, listen: false).addtocart(cc);
              Navigator.pop(context);
            },true);
          });
    }

    return Consumer(builder: (BuildContext context, value, Widget? child) {
      return Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: appColors.secColor,
                    borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.menu,
                  color: appColors.mainColor,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Have a sip',
                style: fontStyles.medTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: context.read<CoffeeSystem>().coffeeList.length,
            itemBuilder: (context, index) {
              final coffeeItem = context.read<CoffeeSystem>().coffeeList[index];
              return coffeeCard(
                  coffeeItem.name.toString(),
                  coffeeItem.imagePath.toString(),
                  coffeeItem.price.toString(),
                  Icons.add, () {
                showCustomBottomSheet(
                    context,
                    coffeeItem.name.toString(),
                    coffeeItem.price.toString(),
                    coffeeItem.imagePath.toString(),
                    coffeeItem
                );

              });
            },
          )),

        ],
      );
    });
  }
}
