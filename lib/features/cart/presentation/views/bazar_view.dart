import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/cart/data/models/history_bazar_model.dart';
import 'package:dalel/features/cart/presentation/widgets/history_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BazarView extends StatelessWidget {
  const BazarView({super.key});

  @override
  Widget build(BuildContext context) {
    final souvenirsList = getHistoryBazarProducts
        .where((product) => product.isSouvenirs)
        .toList();
    final booksList = getHistoryBazarProducts
        .where((product) => product.isSouvenirs == false)
        .toList();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            context.push('/cartView');
          },
          child: Icon(
            CupertinoIcons.cart,
            color: AppColors.offWhite,
          ),
        ),
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'History Books',
                  style: CustomTextStyles.poppins400style20,
                ),
                HistoryListView(
                  historyList: booksList,
                ),
                Text(
                  'Historical Souvenirs',
                  style: CustomTextStyles.poppins400style20,
                ),
                HistoryListView(
                  historyList: souvenirsList,
                ),
              ],
            ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      title: Text('Bazar', style: CustomTextStyles.poppinsBoldStyle20Brown),
      centerTitle: true,
    );
  }
}
