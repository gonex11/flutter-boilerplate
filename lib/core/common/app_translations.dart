import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        'selectFromGallery': 'Select from Gallery',
        'openCamera': 'Open Camera',
        'uploadPhoto': 'Upload Photo',
        'uploadVideo': 'Upload Video',
        'gallery': 'Gallery',
        'camera': 'Camera',
        'microphone': 'Microphone',
        'cancel': 'Cancel',
        'openSetting': 'Open Setting',
        'requestPermissionTitle': "@appName Need Access Your @permissionType",
        'permissionMessage':
            'You have denied permission. The app cannot be used without this permission. Please agree to grant permission.',
      },
      'id': {
        'selectFromGallery': 'Pilih dari Galeri',
        'openCamera': 'Buka Kamera',
        'uploadPhoto': 'Unggah Foto',
        'uploadVideo': 'Unggah Vidio',
        'gallery': 'Galeri',
        'camera': 'Kamera',
        'microphone': 'Mikrofon',
        'cancel': 'Batal',
        'openSetting': 'Buka Pengaturan',
        'requestPermissionTitle':
            "@appName Membutuhkan Akses Ke @permissionType",
        'permissionMessage':
            'Anda telah menolak izin. Aplikasi tidak dapat digunakan tanpa izin ini. Silakan pertimbangkan untuk memberikan izin.',
      },
    };
  }
}
