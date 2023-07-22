import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_icon.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({
    super.key,
    required this.titleAppBar,
    required this.icon,
    this.onPressed,
  });
  final String titleAppBar;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleAppBar,
            style: const TextStyle(
              fontSize: 29,
            ),
          ),
          APPBarIcon(
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
