import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              customNavigate(context, "/qrScannerView");
            },
            icon: Icon(
              Icons.qr_code_scanner,
              color: AppColors.deepBrown,
            ),
          ),
          Text(
            AppStrings.appName,
            style: CustomTextStyles.pacifico400style64.copyWith(fontSize: 25),
          )
        ],
      ),
    );
  }
}
