import 'package:dalel/features/cart/data/models/history_bazar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../logic/cart_provider.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    super.key,
    required this.historyList,
  });
  final List<HistoryBazarModel> historyList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: historyList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final product = historyList[index];
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
                    color: AppColors.grey.withOpacity(.8),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: product.isSouvenirs
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: product.isSouvenirs
                            ? BorderRadius.zero
                            : const BorderRadius.only(
                                topRight: Radius.circular(22),
                                topLeft: Radius.circular(22),
                              ),
                        child: Image.asset(product.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          product.name.toString(),
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.poppins400style16Brown,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "${product.price}",
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.poppins400style16Brown,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Consumer<TheCart>(
                      builder:
                          (BuildContext context, addToCart, Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              color: AppColors.offWhite,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: 2,
                                    color: AppColors.black.withOpacity(.24))
                              ]),
                          child: IconButton(
                            onPressed: () {
                              addToCart.addToCart(product);
                            },
                            icon: const Icon(CupertinoIcons.add),
                          ),
                        );
                      },
                    ),
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
