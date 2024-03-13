import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../widgets/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfoListTile(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Account',
                    style: CustomTextStyles.poppins400style16LightGrey),
              ),
              const CustomListTile(
                  title: 'Edit Profile', leading: IconlyBold.profile),
              _buildDivider(),
              const CustomListTile(
                  title: 'Notification', leading: IconlyBold.notification),
              _buildDivider(isShort: false),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('General',
                    style: CustomTextStyles.poppins400style16LightGrey),
              ),
              const CustomListTile(
                  title: 'Settings', leading: IconlyBold.setting),
              _buildDivider(),
              const CustomListTile(title: 'Security', leading: IconlyBold.lock),
              _buildDivider(),
              const CustomListTile(
                  title: 'Privacy Policy', leading: IconlyBold.shield_done),
              _buildDivider(),
              const CustomListTile(title: 'Log Out', leading: IconlyBold.login),
            ],
          ),
        ));
  }

  Divider _buildDivider({isShort = true}) {
    return Divider(
      indent: isShort ? 50 : 0,
      endIndent: isShort ? 50 : 0,
      thickness: .4,
      color: AppColors.deepBrown,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      title: Text('Profile', style: CustomTextStyles.poppinsBoldStyle20Brown),
      centerTitle: true,
    );
  }
}
