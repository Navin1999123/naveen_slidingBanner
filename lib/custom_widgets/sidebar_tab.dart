import 'package:flutter/material.dart';

class SidebarTab extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SidebarTab({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
    );
  }
}
