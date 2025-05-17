import 'package:flutter/material.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: const Color(0xffdfecf2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Formation Status
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Formation status',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'In progress',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 12),
                const LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Estimated processing',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 2),
                const Text(
                  '4-5 business days',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('View status'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // To-Do List
          const Text(
            'Your to-Do list',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          _buildToDoItem(
            icon: Icons.description_outlined,
            title: 'Run payroll',
            date: 'Mar 4 at 5:00 pm',
          ),
          const SizedBox(height: 16),
          _buildToDoItem(
            icon: Icons.access_time_outlined,
            title: 'Review time off request',
            date: 'Mar 7 at 6:00 pm',
          ),
          const SizedBox(height: 16),
          _buildToDoItem(
            icon: Icons.description_outlined,
            title: 'Sign board resolution',
            date: 'Mar 12 at 6:00 pm',
          ),
          const SizedBox(height: 16),
          _buildToDoItem(
            icon: Icons.description_outlined,
            title: 'Finish onboarding Tony',
            date: 'Mar 12 at 6:00 pm',
          ),

          const SizedBox(height: 24),

          // Board Meeting
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Board meeting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Feb 22 at 6:00 PM',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'You have been invited to attend a meeting of the Board Directors.',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildToDoItem({
  required IconData icon,
  required String title,
  required String date,
}) {
  return Row(
    children: [
      Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ),
    ],
  );
}
