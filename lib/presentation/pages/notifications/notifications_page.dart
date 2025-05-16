import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 1 heure",
        'isRead': false,
      },
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 2 heures",
        'isRead': false,
      },
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 2 heures",
        'isRead': true,
      },
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 5 heures",
        'isRead': true,
      },
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 12 heures",
        'isRead': true,
      },
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 2 heures",
        'isRead': true,
      },
      {
        'title': 'Titre de la notification',
        'time': "Il y'a 2 heures",
        'isRead': true,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(Icons.chevron_left, AppColors.primaryRed, () {
                    Navigator.pop(context);
                  }),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.darkText,
                    ),
                  ),
                  _circleButton(
                    Icons.notifications,
                    AppColors.primaryRed,
                    () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Notifications List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                itemCount: notifications.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final notif = notifications[index];
                  final isRead = notif['isRead'] as bool;

                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isRead ? Colors.white : AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        if (!isRead)
                          BoxShadow(
                            color: AppColors.primaryBlue.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                      ],
                      border:
                          isRead
                              ? Border.all(color: Colors.grey.shade200)
                              : null,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                isRead
                                    ? Colors.grey.shade300
                                    : AppColors.primaryBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color:
                                isRead ? Colors.black54 : AppColors.primaryBlue,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notif['title'],
                                style: TextStyle(
                                  color:
                                      isRead
                                          ? Colors.black87
                                          : AppColors.primaryBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color:
                                        isRead
                                            ? Colors.grey
                                            : AppColors.primaryBlue,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    notif['time'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
    );
  }
}
