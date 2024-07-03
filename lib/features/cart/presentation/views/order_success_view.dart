import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesSucccesOrder),
          Text('Order Success', style: CustomTextStyles.poppins500style24),
          const SizedBox(
            height: 20,
          ),
          Text("""Thank you for your order here and your
package will be sent to your address very
quickly and fast good product""",
              style: CustomTextStyles.poppins400style14LightGrey,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 100,
          ),
          CustomBtn(
            text: 'Back To Home',
            onPressed: () {
              customReplacementNavigate(context, "/homeNavBar");
            },
          )
        ],
      ),
    );
  }
}
