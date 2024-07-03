import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../widgets/user_info.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().loadImage();
    context.read<AuthCubit>().fetchUserData();
  }

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              CustomListTile(
                title: 'Log Out',
                leading: IconlyBold.login,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  setState(() {});
                  context.pushReplacement("/signIn");
                },
              ),
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
