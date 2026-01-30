import 'package:flutter/material.dart';
import '../models/user.dart';

class UserAvatar extends StatelessWidget {
  final User user;
  final double radius;

  const UserAvatar({
    super.key,
    required this.user,
    this.radius = 20,
  });

  Color _getColorFromUsername(String username) {
    final colors = [
      const Color(0xFF5E80FE),
      const Color(0xFFFF6B9D),
      const Color(0xFF00BFA5),
      const Color(0xFFFF9800),
      const Color(0xFF9C27B0),
      const Color(0xFF00BCD4),
      const Color(0xFFF44336),
      const Color(0xFF4CAF50),
      const Color(0xFF3F51B5),
      const Color(0xFFE91E63),
      const Color(0xFF009688),
      const Color(0xFFFF5722),
      const Color(0xFF673AB7),
      const Color(0xFFFFEB3B),
      const Color(0xFF795548),
    ];
    
    int hash = 0;
    for (int i = 0; i < username.length; i++) {
      hash = username.codeUnitAt(i) + ((hash << 5) - hash);
    }
    return colors[hash.abs() % colors.length];
  }

  String _getInitials(String username) {
    if (username.isEmpty) return '?';
    if (username.length == 1) return username.toUpperCase();
    
    final words = username.split(RegExp(r'\s+'));
    if (words.length > 1) {
      return (words[0][0] + words[1][0]).toUpperCase();
    }
    
    return username.substring(0, 2).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (user.avatarUrl != null && user.avatarUrl!.isNotEmpty) {
      final fallbackColor = _getColorFromUsername(user.username);
      final initials = _getInitials(user.username);
      final size = radius * 2;

      return SizedBox(
        width: size,
        height: size,
        child: ClipOval(
          child: Image.asset(
            user.avatarUrl!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: fallbackColor,
                child: Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: radius * 0.6,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: _getColorFromUsername(user.username),
      child: Text(
        _getInitials(user.username),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.6,
        ),
      ),
    );
  }
}

