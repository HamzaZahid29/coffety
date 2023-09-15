import 'package:flutter/material.dart';
import 'package:coffety/consts/colors.dart' as appColors;
import 'package:coffety/consts/styles.dart' as fontStyles;
import 'package:coffety/models/coffee.dart';

class CustomBottomSheet extends StatelessWidget {
  String path,name;
  void Function()? OnTapFunction;
  bool isBuying;


  CustomBottomSheet(this.path, this.name, this.OnTapFunction, this.isBuying);

  @override
  Widget build(BuildContext context) {

    return isBuying ? SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                    Border.all(width: 2.0, color: appColors.secColor),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Image.asset(
                    path,
                    height: 100,
                  )),
            ),
            Text(name),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Oh great $name is a perfect choice. Add it to cart?",
              style: fontStyles.boldMedTextStyle,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: OnTapFunction,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColors.secColor,
                  ),
                  padding: const EdgeInsets.all(26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to cart',
                        style: fontStyles.btnMedTextStyle,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: appColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ) : SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                    Border.all(width: 2.0, color: appColors.secColor),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Image.asset(
                    path,
                    height: 100,
                  )),
            ),
            Text(name),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Do you want to remove $name from cart ",
              style: fontStyles.boldMedTextStyle,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: OnTapFunction,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColors.secColor,
                  ),
                  padding: const EdgeInsets.all(26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Yeah',
                        style: fontStyles.btnMedTextStyle,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.cancel_sharp,
                        color: appColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
