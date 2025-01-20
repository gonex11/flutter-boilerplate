import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/alert_dialog_helper.dart';
import 'package:flutter_boilerplate/shared/utils/app_enums.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:flutter_boilerplate/shared/widgets/app_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AppMediaInput extends StatefulWidget {
  final AppMediaType _type;
  final Function(dynamic value) onSelect;

  const AppMediaInput.image({super.key, required this.onSelect})
      : _type = AppMediaType.image;

  const AppMediaInput.video({super.key, required this.onSelect})
      : _type = AppMediaType.video;

  @override
  State<AppMediaInput> createState() => _AppMediaInputState();
}

class _AppMediaInputState extends State<AppMediaInput> {
  dynamic file;

  void openMediaOption(AppMediaType mediaType) {
    final colorScheme = Get.theme.colorScheme;
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return _appMediaOptionBottomSheet(mediaType);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget._type == AppMediaType.image) {
      return _appMediaImage();
    } else {
      return _appMediaVideo();
    }
  }

  Widget _appMediaOptionBottomSheet(AppMediaType mediaType) {
    final ImagePicker imagePicker = Get.find<ImagePicker>();

    Future<void> pickMedia() async {
      if (mediaType == AppMediaType.image) {
        file = await imagePicker.pickMultiImage();
      } else {
        file = await imagePicker.pickVideo(source: ImageSource.gallery);
      }

      widget.onSelect(file);

      if (mounted) Get.back();
    }

    void selectFromGallery() async {
      final deviceInfo = Get.find<DeviceInfoPlugin>();
      final androidInfo = await deviceInfo.androidInfo;
      final sdkVersion = androidInfo.version.sdkInt;

      PermissionStatus storageStatus;
      PermissionStatus photoStatus;
      PermissionStatus videoStatus;

      if (sdkVersion <= 32) {
        if (!mounted) return;

        storageStatus = await Permission.storage.status;
        if (storageStatus.isDenied) {
          storageStatus = await Permission.storage.request();
        } else if (storageStatus.isPermanentlyDenied) {
          AlertDialogHelper.showGalleryPermissionDialog();
        }

        if (storageStatus.isGranted) {
          await pickMedia();
        }
      } else {
        photoStatus = await Permission.photos.status;
        videoStatus = await Permission.videos.status;

        if (photoStatus.isDenied && videoStatus.isDenied) {
          final permissions =
              await [Permission.photos, Permission.videos].request();
          photoStatus = permissions[Permission.photos]!;
          videoStatus = permissions[Permission.videos]!;
        } else if (photoStatus.isPermanentlyDenied &&
            videoStatus.isPermanentlyDenied) {
          AlertDialogHelper.showGalleryPermissionDialog();
        }

        if (photoStatus.isGranted && videoStatus.isGranted) {
          await pickMedia();
        }
      }
    }

    void takeCamera() async {
      PermissionStatus status = await Permission.camera.status;

      if (status.isDenied) {
        status = await Permission.camera.request();
      } else if (status.isPermanentlyDenied) {
        AlertDialogHelper.showCameraPermissionDialog();
      }

      if (status.isGranted) {
        if (mediaType == AppMediaType.image) {
          file = await imagePicker.pickImage(source: ImageSource.camera);
        } else {
          file = await imagePicker.pickVideo(source: ImageSource.camera);
        }

        widget.onSelect(file);

        if (mounted) Get.back();
      }
    }

    final theme = Get.theme;
    final colorScheme = theme.colorScheme;

    return AppBottomSheet(
      center: true,
      children: [
        ListTile(
          dense: true,
          onTap: selectFromGallery,
          leading: Icon(
            Icons.image_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
          title: Text(
            AppLocalizations.selectFromGallery(),
            style: AppFonts.mdMedium.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
        Divider(color: theme.dividerColor),
        ListTile(
          dense: true,
          onTap: takeCamera,
          leading: Icon(
            Icons.camera_alt_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
          title: Text(
            AppLocalizations.openCamera(),
            style: AppFonts.mdMedium.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _appMediaImage() {
    final theme = Get.theme;
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => openMediaOption(
                widget._type,
              ),
              child: Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    width: 1,
                    color: theme.dividerColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image_rounded,
                      color: AppColors.placeholder,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.uploadPhoto(),
                      textAlign: TextAlign.center,
                      style: AppFonts.xsMedium.copyWith(
                        color: AppColors.placeholder,
                        letterSpacing: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appMediaVideo() {
    final theme = Get.theme;
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => openMediaOption(
                widget._type,
              ),
              child: Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    width: 1,
                    color: theme.dividerColor,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.video_camera_back_rounded,
                      color: AppColors.placeholder,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.uploadVideo(),
                      textAlign: TextAlign.center,
                      style: AppFonts.xsMedium.copyWith(
                        color: AppColors.placeholder,
                        letterSpacing: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
