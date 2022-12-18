import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jnovel_eink/services/errors/errors.dart';
import 'package:jnovel_eink/services/jnovel/classes.dart';
import 'package:jnovel_eink/services/jnovel/jnovel.dart';
import 'package:jnovel_eink/services/secure_store.dart';
import 'package:restart_app/restart_app.dart';

extension Login on JNovelApi {
  bool get loggedIn => token != null;

  void login(String login, String password) async {
    if (token != null) {
      return;
    }

    try {
      final response = await dio.request("/auth/login",
          data: {
            "login": login,
            "password": password,
            "slim": true,
          },
          queryParameters: {
            "format": "json",
          },
          options: Options(
            method: "POST",
          ));

      if (response.statusCode == 200 || response.statusCode == 201) {
        token = response.data['id'];
        SecureStore.save('api_token', token!);
        getProfileData();
      }
    } catch (e) {
      if (e is DioError) {
        GetIt.instance.get<ErrorService>().apiError(e);
      } else {
        GetIt.instance.get<ErrorService>().unknownError(e);
      }
    }
  }

  void logout() async {
    if (token == null) {
      return;
    }

    try {
      final response = await dio.request(
        "/auth/logout",
        options: Options(
          method: "POST",
          headers: defaultHeaders,
        ),
        queryParameters: {
          "format": "json",
        },
      );

      print(response);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Logged out");
        token = null;
        SecureStore.delete('api_token');
        Restart.restartApp();
      }
    } catch (e) {
      if (e is DioError) {
        print(e);
        GetIt.instance.get<ErrorService>().apiError(e);
      } else {
        GetIt.instance.get<ErrorService>().unknownError(e);
      }
    }
  }

  Future<bool> checkToken() async {
    final token = this.token;
    if (token == null) {
      return false;
    }
    try {
      final response = await dio.get("/me",
          options: Options(
            headers: defaultHeaders,
          ),
          queryParameters: {
            "format": "json",
          });
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.other || e.type == DioErrorType.connectTimeout) {
          // No internet connection, token might still be valid
          return true;
        }
      }
      return false;
    }
  }

  Future<void> getProfileData() async {
    try {
      final response = await dio.get("/me",
          options: Options(
            headers: defaultHeaders,
            responseType: ResponseType.json,
          ),
          queryParameters: {
            "format": "json",
          });
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        final profileInfo = ProfileInfo.fromJson(data);

        print(profileInfo);
        this.profileInfo = profileInfo;
      }
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.other || e.type == DioErrorType.connectTimeout) {
          GetIt.instance.get<ErrorService>().apiError(e);
        }
      } else {
        GetIt.instance.get<ErrorService>().unknownError(e);
      }
    }
  }
}
