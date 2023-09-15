import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffety/consts/colors.dart' as appColors;
import 'package:coffety/consts/styles.dart' as fontStyles;
import 'package:coffety/components/widgetbase.dart';
import 'package:coffety/models/coffee.dart';
import 'package:coffety/models/coffeedb.dart';
import 'package:coffety/components/customBottomSheet.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {


  @override
  Widget build(BuildContext context) {
    bool hasBoughtSomething = false;

    String checkIsPlural(){
      if(context.read<CoffeeSystem>().userCartList.length == 1 ){
        return "item";
      }else{
        return "items";
      }
    }

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
              Provider.of<CoffeeSystem>(context, listen:false).removefromcart(cc);
              Navigator.pop(context);

            },false);
          });
    }
    
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
Consumer<CoffeeSystem>(builder: (BuildContext context, value, Widget? child){
  if(!context.read<CoffeeSystem>().userCartList.isEmpty){
    return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: context.read<CoffeeSystem>().userCartList.length,
                itemBuilder: (context, index) {
                  final coffeeItem = context.read<CoffeeSystem>().userCartList[index];
                  return coffeeCard(
                      coffeeItem.name.toString(),
                      coffeeItem.imagePath.toString(),
                      coffeeItem.price.toString(),
                      Icons.delete_outline_rounded, () {
                    showCustomBottomSheet(
                        context,
                        coffeeItem.name.toString(),
                        coffeeItem.price.toString(),
                        coffeeItem.imagePath.toString(),
                        coffeeItem
                    );

                  });
                },
              ),
            ),
            GestureDetector(
              onTap: (){
                showDialog(context: context, builder: (context){
                 return  AlertDialog(
                   title: Text("Order Placed Successfully"),
                   content:Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [

                       Icon(Icons.check_circle_outline, color: Colors.greenAccent,size: 100,),
                       Text('You will recive your order Soon'),
                     ],
                   ),

                 );
                });
                hasBoughtSomething = true;
                Provider.of<CoffeeSystem>(context, listen:false).clearcart();

              },
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
                        'Pay for ${ context.read<CoffeeSystem>().userCartList.length} ${checkIsPlural()}',
                        style: fontStyles.btnMedTextStyle,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.check,
                        color: appColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }else if(hasBoughtSomething == true){
    return Column(
      children: [
        SizedBox(height: 80,),
        Center(
          child: Image.asset('assets/happy.png',
            height: 200,),
        ),
        SizedBox(height: 30,),
        Text('Thanks for buying. Enjoy!!!',style:fontStyles.smallTextStyle,),
      ],
    );
  }
  else{
    return Column(
      children: [
        SizedBox(height: 80,),
        Center(
          child: Image.asset('assets/loneliness.png',
          height: 200,),
        ),
        SizedBox(height: 30,),
        Text('So Lonely Here!. Just Order Something plz',style:fontStyles.smallTextStyle,),
      ],
    );
  }

}),

        ],
      );
    
  }
}
