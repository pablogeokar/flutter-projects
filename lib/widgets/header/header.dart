import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Good morning, James!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.content_copy_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/18231436?v=4',
              ),
              child: SizedBox(), // Fallback if image fails to load
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
