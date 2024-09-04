import 'package:flutter_boilerplate/core/extensions/string_ext.dart';
import 'package:flutter_boilerplate/core/services/remote/responses/error_detail_response.dart';

abstract class Utils {
  Utils._();

  static String? getErrorMessage(List<ErrorDetailResponse>? errors,
      [String? attr = null]) {
    if (errors?.isEmpty == true) {
      return null;
    } else {
      final message = errors?.where((e) => e.attr == attr).firstOrNull?.detail;
      return message?.capitalize();
    }
  }
}
