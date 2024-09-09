import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/common/app_enums.dart';
import 'package:flutter_boilerplate/core/extensions/date_time_ext.dart';
import 'package:flutter_boilerplate/core/styles/app_colors.dart';
import 'package:flutter_boilerplate/core/styles/app_fonts.dart';
import 'package:get/get.dart';

class AppInput extends StatefulWidget {
  final AppInputType? _type;
  final TextEditingController? controller;
  final bool? enabled;
  final String? hintText;
  final String? value;
  final bool readonly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final double? width;
  final double? height;
  final String? error;

  const AppInput({
    super.key,
    this.controller,
    this.enabled,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.value,
    this.readonly = false,
    this.width,
    this.height,
    this.error,
  }) : _type = AppInputType.normal;

  const AppInput.password({
    super.key,
    this.controller,
    this.enabled,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.value,
    this.readonly = false,
    this.width,
    this.height,
    this.error,
  }) : _type = AppInputType.password;

  const AppInput.textarea({
    super.key,
    this.controller,
    this.enabled,
    this.hintText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.value,
    this.readonly = false,
    this.width,
    this.error,
  })  : _type = AppInputType.textarea,
        height = null,
        prefixIcon = null,
        suffixIcon = null;

  const AppInput.date({
    super.key,
    this.enabled,
    this.value,
    this.readonly = false,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.width,
    this.height,
    this.error,
  })  : _type = AppInputType.date,
        controller = null,
        suffixIcon = null,
        keyboardType = null;

  const AppInput.time({
    super.key,
    this.enabled,
    this.value,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.readonly = false,
    this.width,
    this.height,
    this.error,
  })  : _type = AppInputType.time,
        controller = null,
        suffixIcon = null,
        keyboardType = null;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late final TextEditingController dateController;
  late final TextEditingController dateRangeController;

  bool obscureText = true;
  bool isPasswordEmpty = true;
  DateTime now = DateTime.now();

  Future<DateTime?> selectDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
    return date;
  }

  Future<TimeOfDay?> selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return time;
  }

  @override
  void initState() {
    dateController = TextEditingController();
    dateRangeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    dateRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    if (widget._type == AppInputType.password) {
      return _appInputPassword(theme);
    } else if (widget._type == AppInputType.textarea) {
      return _appInputTextArea(theme);
    } else if (widget._type == AppInputType.date) {
      return _appInputDate(theme);
    } else if (widget._type == AppInputType.time) {
      return _appInputTime(theme);
    } else {
      return _appInputNormal(theme);
    }
  }

  Widget _appInputNormal(ThemeData theme) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChanged,
        initialValue: widget.value,
        readOnly: widget.readonly == true,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        enabled: widget.enabled,
        style: AppFonts.mdRegular.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: (widget.enabled == false || widget.readonly == true)
              ? theme.disabledColor
              : theme.colorScheme.surfaceBright,
          errorText: widget.error,
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          prefix: Visibility(
            visible: widget.prefixIcon == null,
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: AppFonts.mdRegular.copyWith(
            color: (widget.enabled == false || widget.readonly == true)
                ? AppColors.placeholder
                : AppColors.grey,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }

  Widget _appInputPassword(ThemeData theme) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        validator: widget.validator,
        onChanged: (value) {
          setState(() {
            isPasswordEmpty = value.isEmpty;
          });
          widget.onChanged?.call(value);
        },
        controller: widget.controller,
        enabled: widget.enabled,
        obscureText: obscureText,
        style: AppFonts.mdRegular.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: (widget.enabled == false)
              ? theme.disabledColor
              : theme.colorScheme.surfaceBright,
          hintText: widget.hintText,
          hintStyle: AppFonts.mdRegular.copyWith(
            color: (widget.enabled == false)
                ? AppColors.placeholder
                : AppColors.grey,
          ),
          errorText: widget.error,
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          prefix: Visibility(
            visible: widget.prefixIcon == null,
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
            ),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: Visibility(
            visible: !isPasswordEmpty,
            child: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                (obscureText) ? Icons.visibility_off : Icons.visibility,
                color: AppColors.placeholder,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appInputTextArea(ThemeData theme) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChanged,
        controller: widget.controller,
        enabled: widget.enabled,
        minLines: 6,
        maxLines: 50,
        keyboardType: TextInputType.multiline,
        style: AppFonts.mdRegular.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          // fillColor: (widget.enabled == false)
          //     ? theme.disabledColor
          //     : theme.colorScheme.surfaceBright,
          hintText: widget.hintText,
          hintStyle: AppFonts.mdRegular.copyWith(
            color: (widget.enabled == false)
                ? AppColors.placeholder
                : AppColors.grey,
          ),
          errorText: widget.error,
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          prefix: const Padding(padding: EdgeInsets.only(left: 16)),
        ),
      ),
    );
  }

  Widget _appInputDate(ThemeData theme) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        readOnly: true,
        validator: widget.validator,
        keyboardType: TextInputType.datetime,
        controller: dateController,
        enabled: widget.enabled,
        style: AppFonts.mdRegular.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: (widget.enabled == false)
              ? theme.disabledColor
              : theme.colorScheme.surfaceBright,
          hintText: widget.hintText,
          hintStyle: AppFonts.mdRegular.copyWith(
            color: (widget.enabled == false)
                ? AppColors.placeholder
                : AppColors.grey,
          ),
          errorText: widget.error,
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: theme.dividerColor,
              width: 1,
            ),
          ),
          prefix: Visibility(
            visible: widget.prefixIcon == null,
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
            ),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            onPressed: (!widget.readonly)
                ? () async {
                    final selectedDate = await selectDate();
                    setState(() {
                      dateController.text = (selectedDate != null)
                          ? selectedDate
                              .toDayMonthYear(Get.locale?.languageCode)
                          : "";
                      widget.onChanged
                          ?.call(selectedDate?.toIso8601String() ?? "");
                    });
                  }
                : null,
            icon: Icon(
              Icons.calendar_today_outlined,
              weight: 20,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _appInputTime(ThemeData theme) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        readOnly: true,
        validator: widget.validator,
        keyboardType: TextInputType.datetime,
        controller: dateController,
        enabled: widget.enabled,
        style: AppFonts.mdRegular.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: (widget.enabled == false)
              ? theme.disabledColor
              : theme.colorScheme.surfaceBright,
          hintText: widget.hintText,
          hintStyle: AppFonts.mdRegular.copyWith(
            color: (widget.enabled == false)
                ? AppColors.placeholder
                : AppColors.grey,
          ),
          errorText: widget.error,
          contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          prefix: Visibility(
            visible: widget.prefixIcon == null,
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
            ),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            onPressed: (!widget.readonly)
                ? () async {
                    final selectedTime = await selectTime();
                    setState(() {
                      dateController.text = (selectedTime != null)
                          ? selectedTime.format(context)
                          : "";
                      widget.onChanged
                          ?.call(selectedTime?.format(context) ?? "");
                    });
                  }
                : null,
            icon: Icon(
              Icons.timer_outlined,
              size: 20,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
