import 'dart:io';

import 'package:proyecto_flutter/utils/connectivity_checker.dart';

class ConnectivityHelper extends ConnectivityChecker {
  @override
  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      print(result);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
