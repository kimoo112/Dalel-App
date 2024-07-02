import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/model/historical_model/historical_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../features/home/presentation/views/historical_periods_details_view.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
      {super.key, required this.model, required this.routePath});
  final HistoricalModel model;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoricalDetailsView(
                description: model.content!,
                image: model.image!,
                name: model.title!,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 243, 233),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 10,
                  offset: const Offset(0, 7))
            ]),
        width: 164,
        height: 96,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 15),
            SizedBox(
              height: 64,
              width: 47,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  imageUrl: model.image!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 47,
                      height: 64,
                      color: AppColors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              width: 65,
              child: Text(
                model.title!,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: CustomTextStyles.poppins500style18Brown.copyWith(
                    fontSize: 10,
                    color: AppColors.deepBrown,
                    fontFamily: "Almarai"),
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
