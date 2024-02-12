import 'dart:async';

import 'package:eticon_api/eticon_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kino_app/firebase_options.dart';
import 'package:kino_app/repository/get_it.dart';
import 'package:kino_app/repository/kino_repository.dart';
import 'package:kino_app/router/router.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Api.init(
      urls: [
        'https://api.kinopoisk.dev/v1.4/movie',
      ],

      );
  await GetStorage.init();
  getIt.registerLazySingleton(() => KinoRepository());
  SgAppData.instance.hasInternet = await InternetConnectionChecker().hasConnection;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 800),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}