import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorService {
  final StreamController<String> _errorController = StreamController<String>.broadcast();

  Stream<String> get errorStream => _errorController.stream;

  void showError(String message) {
    _errorController.add(message);
  }

  void apiError(DioError err) {
    if (err.isNetworkError) {
      showError("Network error: \nServer not found. Check your internet connection");
    } else if (err.response != null) {
      showError("Server error: \n${err.response!.statusCode}");
    } else {
      showError("Unknown error: \n${err.message}");
    }
  }

  void unknownError(Object err) {
    showError("Unknown error: \n$err");
  }
}

extension on DioError {
  bool get isNetworkError {
    return type == DioErrorType.other || type == DioErrorType.connectTimeout;
  }

  bool get isServerError {
    return type == DioErrorType.response;
  }
}
