import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final bool isOnline;

  const StatusIndicator({super.key, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isOnline ? const Color(0xFF4CAF50) : Colors.grey[600],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: (isOnline ? const Color(0xFF4CAF50) : Colors.grey[600]!)
                .withValues(alpha: 0.5),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
