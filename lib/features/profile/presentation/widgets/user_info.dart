import 'dart:io';

import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class UserInfoListTile extends StatefulWidget {
  const UserInfoListTile({
    super.key,
  });

  @override
  State<UserInfoListTile> createState() => _UserInfoListTileState();
}

class _UserInfoListTileState extends State<UserInfoListTile> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
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
                            as ImageProvider,
                  ),
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
                  if (state is UserLoading)
                    CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  else if (state is UserLoaded)
                    UserProfileInfo(
                      firstName: state.firstName!,
                      lastName: state.lastName!,
                    )
                  else if (state is UserError)
                    Text('Error: ${state.message}'),
                  Text(
                    FirebaseAuth.instance.currentUser!.email!,
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

class UserProfileInfo extends StatelessWidget {
  final String firstName;
  final String lastName;

  const UserProfileInfo({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$firstName $lastName",
          style: CustomTextStyles.poppins500style24Black,
        ),
      ],
    );
  }
}
