import 'package:dalel/core/functions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../logic/cart_provider.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 111,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 14,
                  spreadRadius: 4,
                  color: AppColors.grey.withOpacity(.7))
            ],
            color: AppColors.offWhite,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22), topRight: Radius.circular(22))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: CustomTextStyles.poppinsBoldStyle16Brown,
                  ),
                  Consumer<TheCart>(
                    builder: (BuildContext context, cart, Widget? child) {
                      return Text(
                        '\$ ${cart.priceOfProducts.toInt()}',
                        style: CustomTextStyles.poppins400style16Brown,
                      );
                    },
                  ),
                ],
              ),
            ),
            Consumer<TheCart>(
                builder: (BuildContext context, cart, Widget? child) {
              return CustomBtn(
                text: 'Checkout Now',
                color: AppColors.primaryColor,
                textColor: AppColors.offWhite,
                onPressed: () {
                  customNavigate(context, "/cardScreen");
                  cart.deleteAllFromCart();
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
