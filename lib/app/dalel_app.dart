import 'package:dalel/core/api/dio_consumer.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/home/presentation/logic/cubit/historical_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../features/cart/presentation/logic/cart_provider.dart';

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TheCart();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HistoricalCubit(DioConsumer(dio: Dio())),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
