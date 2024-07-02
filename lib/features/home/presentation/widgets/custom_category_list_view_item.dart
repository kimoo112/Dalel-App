import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem(
      {super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey,
                blurRadius: 10,
                offset: const Offset(0, 7))
          ]),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            title,
            style: CustomTextStyles.poppins500style14
                .copyWith(fontFamily: 'Almarai'),
          )
        ],
      ),
    );
  }
}
