import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class TopCards extends StatelessWidget {
  const TopCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCard(
          icon: Icons.account_balance_wallet_outlined,
          title: '\$143,624',
          subtitle: 'Your bank\nbalance',
          hasMenuButton: true,
        ),
        const SizedBox(width: 20),
        _buildCard(
          icon: Icons.timelapse,
          title: '12',
          subtitle: 'Uncategorized\ntransactions',
          hasMenuButton: true,
        ),
        const SizedBox(width: 20),
        _buildCard(
          icon: Icons.people_outlined,
          title: '7',
          subtitle: 'Employees\nworking today',
          hasMenuButton: true,
        ),
        const SizedBox(width: 20),
        _buildCard(
          icon: Icons.credit_card_outlined,
          title: '\$3,287.49',
          subtitle: 'This week\'s\ncard spending',
          hasMenuButton: true,
        ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool hasMenuButton = false,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 24),
                ),
                if (hasMenuButton)
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
