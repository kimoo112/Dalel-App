import 'package:dalel/app/dalel_app.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/check_state_changes.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  // // checkStateChanges();
  runApp(const Dalel());
}
