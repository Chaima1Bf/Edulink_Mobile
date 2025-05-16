import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/notifications/notifications_page.dart';

class ClubDetailsPage extends StatelessWidget {
  const ClubDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withAlpha(
                          (0.25 * 255).toInt(),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                  const Text(
                    "Clubs & Activités",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.darkText,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationsPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withAlpha(
                          (0.25 * 255).toInt(),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Club Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/music_club.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                "Club de Musique",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 12),

              //  Description
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.\n\nLorem ipsum dolor sit amet, consectetur . Tempor incididunt ut labore et dolore magna aliqua ullamco laboris. Et harum quidem rerum facilis est et expedita distinctio.",
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 28),

              // Cards
              Row(
                children: [
                  Expanded(
                    child: _infoCard(
                      icon: Icons.calendar_today_rounded,
                      text: "Les Samedis",
                      iconColor: Color(0xFF46DDB9),
                      textColor: Color(0xFF46DDB9),
                      bgColor: Color(0xFFE0F4EC),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                      icon: Icons.access_time_rounded,
                      text: "12h - 14h",
                      iconColor: Color(0xFF8183FE),
                      textColor: Color(0xFF8183FE),
                      bgColor: Color(0xFFE7E7FB),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),

              // Price
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryRed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prix",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "250 Dt",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon({
    required IconData icon,
    VoidCallback? onTap,
    Color iconColor = AppColors.primaryRed,
    Color bgColor = const Color(0xFFFFE7E6),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }

  // Info pill card
  Widget _infoCard({
    required IconData icon,
    required String text,
    required Color iconColor,
    required Color textColor,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
