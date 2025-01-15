import 'package:flutter/material.dart';

class GeneralToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final Icon? backIcon; // New parameter for back icon
  final VoidCallback? onMenuPressed;
  final VoidCallback? onCalendarPressed;

  const GeneralToolbar({
    super.key,
    required this.title,
    this.showBackButton = false, // Defaults to not showing the back button
    this.backIcon = const Icon(Icons.arrow_back, color: Colors.black), // Default back icon
    this.onMenuPressed,
    this.onCalendarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // White background color
      elevation: 1.0, // Subtle shadow
      centerTitle: true, // Centers the title
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black, // Black text color
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: showBackButton && backIcon != null
          ? IconButton(
        icon: backIcon!,
        onPressed: () => Navigator.pop(context),
      )
          : null, // If back button is not needed or backIcon is null, leading is null
      actions: [
        IconButton(
          icon: const Icon(Icons.calendar_today, color: Colors.black),
          onPressed: onCalendarPressed, // Calendar button logic
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}