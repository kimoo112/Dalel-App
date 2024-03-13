import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    super.key,
    required this.historyList,
    required this.isSouvenirs,
  });
  final List historyList;
  final bool isSouvenirs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: historyList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(22),
            child: Container(
              width: 150,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.offWhite,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 11,
                        spreadRadius: 3,
                        color: AppColors.grey.withOpacity(.8))
                  ]),
              child: Column(
                mainAxisAlignment: isSouvenirs
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: isSouvenirs
                        ? BorderRadius.zero
                        : const BorderRadius.only(
                            topRight: Radius.circular(22),
                            topLeft: Radius.circular(22)),
                    child: Image.asset(
                      historyList[index].image,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(historyList[index].name,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.poppins400style16Brown),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
