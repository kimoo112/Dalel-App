import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/cart/presentation/views/order_success_view.dart';
import '../../features/cart/presentation/widgets/credit_card.dart';
import '../../features/home/presentation/views/home_navbar.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/qr/presention/view/qr_scanner_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/onBoarding",
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: "/forgotPassword",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: "/homeNavBar",
      builder: (context, state) => const HomeNavBarWidget(),
    ),
    GoRoute(
      path: "/cartView",
      builder: (context, state) => const CartView(),
    ),
    GoRoute(
      path: "/orderSuccessView",
      builder: (context, state) => const OrderSuccessView(),
    ),
    GoRoute(
      path: "/cardScreen",
      builder: (context, state) => const CardScreen(),
    ),
    GoRoute(
      path: "/homeView",
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: "/qrScannerView",
      builder: (context, state) => const QRScannerView(),
    ),
  ],
);
