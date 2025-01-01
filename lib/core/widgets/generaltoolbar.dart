import 'package:flutter/material.dart';

class GeneralToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const GeneralToolbar({
    super.key,
    required this.title,
    this.showBackButton = true, // Defaults to showing the back button
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true, // Centers the title
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      )
          : null, // If back button is not needed, set it to null
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}