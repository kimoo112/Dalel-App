import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key, required this.title, required this.leading, this.onTap})
      : super(key: key);
  final String title;
  final IconData leading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leading,
        color: AppColors.deepBrown,
      ),
      title: Text(
        title,
        style: CustomTextStyles.poppins400style16Brown,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppColors.deepBrown,
      ),
    );
  }
}
