import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/clubs/club_details.dart';
import '/presentation/widgets/news_card.dart';
import '/presentation/pages/notifications/notifications_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> newsList = [
      {
        'title': 'Club de Musique',
        'image': 'assets/images/music_club.jpg',
        'price': '250 Dt',
        'date': 'Les Samedis',
        'time': '12h - 14h',
        'isLieu': true,
      },
      {
        'title': 'Fête de fin d\'année',
        'image': 'assets/images/music_club.jpg',
        'price': '100 Dt',
        'date': '11/06/2023',
        'time': '10h - 14h',
        'isLieu': false,
      },
      // Add more news items as needed
    ];

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔼 Header
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

              const SizedBox(height: 25),

              // 📰 News Cards List
              Expanded(
                child: ListView.separated(
                  itemCount: newsList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final data = newsList[index];
                    return Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 380),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ClubDetailsPage(),
                              ),
                            );
                          },
                          child: NewsCard(
                            imageAsset: data['image'],
                            title: data['title'],
                            price: data['price'],
                            date: data['date'],
                            time: data['time'],
                            isLieu: data['isLieu'],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
