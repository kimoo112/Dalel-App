import 'dart:io';

import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: context.read<AuthCubit>().imagePath == ''
                          ? null
                          : FileImage(File(context.read<AuthCubit>().imagePath))
                              as ImageProvider),
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      context.read<AuthCubit>().pickImageFromGallery();
                    },
                    mini: true,
                    child: Icon(
                      Icons.edit,
                      color: AppColors.offWhite,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Abdo Gamal",
                    style: CustomTextStyles.poppinsBoldStyle16Brown,
                  ),
                  Text(
                    "Abdo125@gmail.com",
                    style: CustomTextStyles.poppins400style16LightGrey,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(IconlyBold.edit, color: AppColors.lightGrey),
              ),
            ],
          ),
        );
      },
    );
  }
}
