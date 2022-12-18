import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jnovel_eink/services/jnovel/classes.dart';
import 'package:jnovel_eink/services/jnovel/login.dart';
import 'package:jnovel_eink/services/secure_store.dart';

class JNovelApi extends ChangeNotifier {
  final Dio dio = Dio();
  final String baseUrl = "https://labs.j-novel.club";
  final String apiPath = "/app/v1";

  Map<String, dynamic> get defaultHeaders => {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };

  bool _initialized = false;

  bool get initialized => _initialized;

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  String? _token;

  String? get token => _token;

  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  ProfileInfo? _profileInfo;

  ProfileInfo? get profileInfo => _profileInfo;

  set profileInfo(ProfileInfo? value) {
    _profileInfo = value;
    notifyListeners();
  }

  JNovelApi() {
    dio.options.baseUrl = baseUrl + apiPath;
    init();
  }

  void init() async {
    final token = await SecureStore.read("api_token");
    if (token != null) {
      print("Token found");
      this.token = token;
      if (await checkToken()) {
        print("Token is valid");
        getProfileData();
      } else {
        print("Token is invalid");
        this.token = null;
        await SecureStore.delete("api_token");
      }
    }
    initialized = true;
  }
}
