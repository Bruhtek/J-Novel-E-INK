import 'package:flutter/material.dart';
import 'package:jnovel_eink/services/errors/errors.dart';
import 'package:jnovel_eink/services/jnovel/jnovel.dart';
import 'package:jnovel_eink/theme_data.dart';
import 'views/home.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<JNovelApi>(JNovelApi());
  getIt.registerSingleton<ErrorService>(ErrorService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'J-Novel E-Ink',
      theme: themeData,
      home: Home(),
    );
  }
}
