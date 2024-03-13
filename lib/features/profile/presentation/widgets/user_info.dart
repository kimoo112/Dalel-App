import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Karim MOhamed',
        style: CustomTextStyles.poppinsBoldStyle16Brown,
      ),
      subtitle: Text(
        'karimMOhamed@gmail.com',
        style: CustomTextStyles.poppins400style16LightGrey,
      ),
      leading: const CircleAvatar(),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(IconlyBold.edit, color: AppColors.lightGrey),
      ),
    );
  }
}
