import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:jnovel_eink/router.dart';
import 'package:jnovel_eink/services/jnovel/jnovel.dart';
import 'package:jnovel_eink/services/jnovel/login.dart';
import 'package:jnovel_eink/theme_data.dart';
import 'package:jnovel_eink/views/login/login.dart';
import 'package:jnovel_eink/views/misc/loading_screen.dart';
import 'package:jnovel_eink/router.dart';

class Home extends StatelessWidget with GetItMixin {
  Home({Key? key}) : super(key: key);

  final getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    final initialized = watchOnly((JNovelApi api) => api.initialized);

    if (!initialized) {
      return const Scaffold(
        body: LoadingScreen(),
      );
    }

    final loggedIn = watchOnly((JNovelApi api) => api.loggedIn);
    if (loggedIn) {
      return MaterialApp.router(
        theme: themeData,
        routerConfig: goRouterConfig,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Login to J-Novel Club"),
        ),
        body: LoginScreen(),
      );
    }
  }
}
