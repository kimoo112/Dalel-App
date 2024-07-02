import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../logic/cart_provider.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 11,
                spreadRadius: 3,
                color: AppColors.grey.withOpacity(.8))
          ]),
      child: Consumer<TheCart>(
          builder: (BuildContext context, cart, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  color: AppColors.offWhite2,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(
                        cart.cartProducts[index].image,
                      ),
                      fit: BoxFit.fitWidth)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  cart.cartProducts[index].name,
                  style: CustomTextStyles.poppins500style14Brown,
                ),
                Text(
                  'Size : 2',
                  style: CustomTextStyles.poppins400style12,
                ),
                Row(
                  children: [
                    Text(
                      cart.cartProducts[index].price.toString(),
                      style: CustomTextStyles.poppins400style14LightGrey,
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
