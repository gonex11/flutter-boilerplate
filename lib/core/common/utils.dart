import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/common/app_constants.dart';
import 'package:flutter_boilerplate/data/data_sources/local/db/adapters/user_type.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/services/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/presentation/widgets/no_internet_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class Utils {
  Utils._();

  static Future<void> initProject() async {
    await Hive.initFlutter();
    Hive..registerAdapter(UserTypeAdapter());

    await Future.any([
      Hive.openBox<UserType>(AppConstants.boxNames.users),
    ]);
  }

  static showBottomSheet(Widget child) {
    Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      child,
    );
  }

  static showNoInternetBottomSheet() {
    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      NoInternetBottomSheet(),
    );
  }

  static String? getErrorMessage(List<ErrorDetailResponse>? errors,
      [String? attr = null]) {
    if (errors?.isEmpty == true) {
      return null;
    } else {
      final message = errors?.where((e) => e.attr == attr).firstOrNull?.detail;
      return message?.capitalize;
    }
  }
}
