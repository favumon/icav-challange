import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

enum BottomSheetType { accountLocked, emailVerification }

@lazySingleton
class AlertService {
  final GetInterface _get;

  AlertService(this._get);

  void showAlertSnackbar({required String title, required String message}) {
    _get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  }

  void showSuccessSnackbar({required String title, required String message}) {
    _get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
  }
}
