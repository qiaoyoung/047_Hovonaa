import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/chat_message.dart';

class ChatStorage {
  static const String _prefix = 'chat_messages_';

  static String _keyForVideo(String videoId) => '$_prefix$videoId';

  static Future<List<ChatMessage>> loadMessages(String videoId) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _keyForVideo(videoId);
    final raw = prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> data = jsonDecode(raw) as List<dynamic>;
      return data
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveMessages(String videoId, List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _keyForVideo(videoId);
    final data = messages.map((m) => m.toJson()).toList();
    await prefs.setString(key, jsonEncode(data));
  }

  static Future<void> addMessage(String videoId, ChatMessage message) async {
    final existing = await loadMessages(videoId);
    existing.add(message);
    await saveMessages(videoId, existing);
  }
}


