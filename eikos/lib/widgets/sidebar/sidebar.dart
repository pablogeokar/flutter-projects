import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: AppColors.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/logo.png',
              width: 40,
              height: 40,
              color: AppColors.textLight,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'dappr',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.white24),
          _buildSidebarItem(Icons.home_outlined, isActive: true),
          _buildSidebarItem(Icons.domain_outlined),
          _buildSidebarItem(Icons.account_balance_outlined),
          _buildSidebarItem(Icons.mail_outline),
          _buildSidebarItem(Icons.play_circle_outline),
          _buildSidebarItem(Icons.people_outline),
          _buildSidebarItem(Icons.description_outlined),
          _buildSidebarItem(Icons.timer_outlined),
          const Spacer(),
          _buildSidebarItem(Icons.settings_outlined),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border:
            isActive
                ? const Border(
                  left: BorderSide(color: AppColors.textLight, width: 3),
                )
                : null,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isActive ? AppColors.textLight : Colors.white54,
          size: 24,
        ),
        onPressed: () {},
      ),
    );
  }
}
