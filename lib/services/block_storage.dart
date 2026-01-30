import 'package:shared_preferences/shared_preferences.dart';

class BlockStorage {
  static const String _blockedUsersKey = 'blocked_users';
  static const String _reportedUsersKey = 'reported_users';

  static Future<Set<String>> getBlockedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final blockedList = prefs.getStringList(_blockedUsersKey) ?? [];
    return blockedList.toSet();
  }

  static Future<bool> isUserBlocked(String userId) async {
    final blockedUsers = await getBlockedUsers();
    return blockedUsers.contains(userId);
  }

  static Future<void> blockUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final blockedList = prefs.getStringList(_blockedUsersKey) ?? [];
    if (!blockedList.contains(userId)) {
      blockedList.add(userId);
      await prefs.setStringList(_blockedUsersKey, blockedList);
    }
  }

  static Future<void> unblockUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final blockedList = prefs.getStringList(_blockedUsersKey) ?? [];
    blockedList.remove(userId);
    await prefs.setStringList(_blockedUsersKey, blockedList);
  }

  static Future<void> reportUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final reportedList = prefs.getStringList(_reportedUsersKey) ?? [];
    if (!reportedList.contains(userId)) {
      reportedList.add(userId);
      await prefs.setStringList(_reportedUsersKey, reportedList);
    }
  }

  static Future<bool> isUserReported(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final reportedList = prefs.getStringList(_reportedUsersKey) ?? [];
    return reportedList.contains(userId);
  }
}

