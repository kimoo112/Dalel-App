import 'package:dalel/features/profile/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../widgets/check_out_card.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mQHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: mQHeight * .7,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 12, 
                itemBuilder: (BuildContext context, int index) {
                  return  CustomListTile(
                      title: 'Product ${index }', leading: Icons.abc_outlined);
                },
              ),
            ),
            const CheckOutCard(),
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('My Cart', style: CustomTextStyles.poppins500style18Brown),
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.trash),
        ),
      ],
    );
  }
}
