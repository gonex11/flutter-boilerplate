import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/common/app_binding.dart';
import 'package:flutter_boilerplate/shared/responses/error_detail_response.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

abstract class AppUtils {
  AppUtils._();

  static Future<void> initProject() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppBinding().dependencies();
  }

  static void showBottomSheet(Widget child) {
    Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      child,
    );
  }

  static String? getErrorMessage(List<ErrorDetailResponse>? errors,
      [String? attr]) {
    if (errors?.isEmpty == true) {
      return null;
    } else {
      final message = errors?.where((e) => e.attr == attr).firstOrNull?.detail;
      return message?.capitalize;
    }
  }

  static FormFieldValidator<String?> passwordValidator([
    String? confirmText,
    int min = 8,
  ]) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
        errorText: AppLocalizations.passwordRequiredMessage,
      ),
      FormBuilderValidators.minLength(
        min,
        errorText: AppLocalizations.passwordMinCharacterMessage(min),
      ),
      FormBuilderValidators.hasUppercaseChars(
        errorText: AppLocalizations.passwordUpperCaseMessage,
      ),
      FormBuilderValidators.hasLowercaseChars(
        errorText: AppLocalizations.passwordLowerCaseMessage,
      ),
      FormBuilderValidators.hasNumericChars(
        errorText: AppLocalizations.passwordNumberMessage,
      ),
      FormBuilderValidators.hasSpecialChars(
        errorText: AppLocalizations.passwordSpecialCharacterMessage,
      ),
      (value) => (confirmText == null || value == confirmText)
          ? null
          : AppLocalizations.passwordNotMatchMessage,
    ]);
  }
}
