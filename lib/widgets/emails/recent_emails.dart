import 'package:eikos/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RecentEmails extends StatelessWidget {
  const RecentEmails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent emails',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildEmailItem(
                  avatar: 'assets/images/avatar1.jpg',
                  name: 'Hannah Morgan',
                  status: 'Meeting scheduled',
                  time: '1:24 PM',
                  avatarColor: Colors.red[100],
                ),
                const Divider(height: 1),
                _buildEmailItem(
                  avatar: 'assets/images/avatar2.jpg',
                  name: 'Megan Clark',
                  status: 'Update on marketing campaign',
                  time: '12:32 PM',
                  avatarColor: Colors.green[100],
                ),
                const Divider(height: 1),
                _buildEmailItem(
                  avatar: 'assets/images/avatar3.jpg',
                  name: 'Brandon Williams',
                  status: 'Designly 2.0 is about to launch',
                  time: 'Yesterday at 8:57 PM',
                  avatarColor: Colors.blue[100],
                ),
                const Divider(height: 1),
                _buildEmailItem(
                  avatar: 'assets/images/avatar4.jpg',
                  name: 'Reid Smith',
                  status: 'My friend Julie loves Dappr!',
                  time: 'Yesterday at 8:49 PM',
                  avatarColor: Colors.purple[100],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailItem({
    required String avatar,
    required String name,
    required String status,
    required String time,
    Color? avatarColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: avatarColor,
            //backgroundImage: AssetImage(avatar),
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/18231436?v=4',
            ),
            onBackgroundImageError: (exception, stackTrace) {},
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
          Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }
}
