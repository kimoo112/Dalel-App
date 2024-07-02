import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../logic/cart_provider.dart';
import '../widgets/check_out_card.dart';
import '../widgets/custom_product_card.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mQHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: mQHeight * .7,
              child: Consumer<TheCart>(
                  builder: (BuildContext context, cart, Widget? child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.cartProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomProductCard(
                      index: index,
                    );
                  },
                );
              }),
            ),
            const CheckOutCard(),
          ],
        ));
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      title: Text('My Cart', style: CustomTextStyles.poppins500style18Brown),
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      actions: [
        Consumer<TheCart>(builder: (BuildContext context, cart, Widget? child) {
          return IconButton(
            onPressed: () {
              cart.deleteAllFromCart();
            },
            icon: const Icon(CupertinoIcons.trash),
          );
        }),
      ],
    );
  }
}
