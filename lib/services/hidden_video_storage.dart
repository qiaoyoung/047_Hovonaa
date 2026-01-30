import 'package:shared_preferences/shared_preferences.dart';

class HiddenVideoStorage {
  static const String _key = 'hidden_video_ids';

  /// 获取所有隐藏的视频 ID
  static Future<Set<String>> getHiddenVideoIds() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> hiddenIds = prefs.getStringList(_key) ?? [];
    return hiddenIds.toSet();
  }

  /// 隐藏视频
  static Future<void> hideVideo(String videoId) async {
    final prefs = await SharedPreferences.getInstance();
    final hiddenIds = await getHiddenVideoIds();
    hiddenIds.add(videoId);
    await prefs.setStringList(_key, hiddenIds.toList());
  }

  /// 取消隐藏视频
  static Future<void> unhideVideo(String videoId) async {
    final prefs = await SharedPreferences.getInstance();
    final hiddenIds = await getHiddenVideoIds();
    hiddenIds.remove(videoId);
    await prefs.setStringList(_key, hiddenIds.toList());
  }

  /// 检查视频是否被隐藏
  static Future<bool> isVideoHidden(String videoId) async {
    final hiddenIds = await getHiddenVideoIds();
    return hiddenIds.contains(videoId);
  }

  /// 清空所有隐藏的视频
  static Future<void> clearAllHidden() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

