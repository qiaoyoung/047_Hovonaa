import 'package:shared_preferences/shared_preferences.dart';

class HiddenPostStorage {
  static const String _key = 'hidden_post_ids';

  /// 获取所有隐藏的帖子 ID
  static Future<Set<String>> getHiddenPostIds() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> hiddenIds = prefs.getStringList(_key) ?? [];
    return hiddenIds.toSet();
  }

  /// 隐藏帖子
  static Future<void> hidePost(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    final hiddenIds = await getHiddenPostIds();
    hiddenIds.add(postId);
    await prefs.setStringList(_key, hiddenIds.toList());
  }

  /// 取消隐藏帖子
  static Future<void> unhidePost(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    final hiddenIds = await getHiddenPostIds();
    hiddenIds.remove(postId);
    await prefs.setStringList(_key, hiddenIds.toList());
  }

  /// 检查帖子是否被隐藏
  static Future<bool> isPostHidden(String postId) async {
    final hiddenIds = await getHiddenPostIds();
    return hiddenIds.contains(postId);
  }

  /// 清空所有隐藏的帖子
  static Future<void> clearAllHidden() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

