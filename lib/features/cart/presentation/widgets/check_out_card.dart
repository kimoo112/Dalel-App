import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';

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
                  Text(
                    '\$ 250',
                    style: CustomTextStyles.poppins400style16Brown,
                  ),
                ],
              ),
            ),
            CustomBtn(
              text: 'Checkout Now',
              color: AppColors.primaryColor,
              textColor: AppColors.offWhite,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
