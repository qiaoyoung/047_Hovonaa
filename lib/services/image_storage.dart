import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImageStorage {
  static Future<String> getChatImagesDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final chatImagesDir = Directory(path.join(appDir.path, 'chat_images'));
    if (!await chatImagesDir.exists()) {
      await chatImagesDir.create(recursive: true);
    }
    return chatImagesDir.path;
  }

  static Future<String> saveImage(File imageFile) async {
    final chatImagesDir = await getChatImagesDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'image_$timestamp${path.extension(imageFile.path)}';
    final savedPath = path.join(chatImagesDir, fileName);
    
    final savedFile = await imageFile.copy(savedPath);
    return savedFile.path;
  }

  static Future<String> getImagePath(String fileName) async {
    final chatImagesDir = await getChatImagesDirectory();
    return path.join(chatImagesDir, fileName);
  }

  static bool isLocalPath(String imagePath) {
    return !imagePath.startsWith('assets/');
  }
}

