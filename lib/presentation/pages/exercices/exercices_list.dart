import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/exercices/exercice_details.dart';
import '/presentation/pages/notifications/notifications_page.dart';

class ExercicesPage extends StatefulWidget {
  const ExercicesPage({super.key});

  @override
  State<ExercicesPage> createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {
  int selectedFilter = 0;

  final List<Map<String, dynamic>> exercises = [
    {'status': 'Terminé', 'title': "Nom de l'exercice", 'date': '20/03/2024'},
    {'status': 'Manquant', 'title': "Nom de l'exercice", 'date': '20/03/2024'},
    {'status': 'Manquant', 'title': "Nom de l'exercice", 'date': '20/03/2024'},
    {'status': 'Terminé', 'title': "Nom de l'exercice", 'date': '20/03/2024'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    "Exercices",
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

              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _filterTab("Tout", 0, Colors.deepPurple, isDot: true),
                  _filterTab("Terminé", 1, Colors.green, isDot: true),
                  _filterTab("Manquant", 2, Colors.pinkAccent, isDot: true),
                ],
              ),

              const SizedBox(height: 25),

              // Exercises List
              Expanded(
                child: ListView.separated(
                  itemCount: exercises.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final exo = exercises[index];

                    // Filter if selected
                    if (selectedFilter == 1 && exo['status'] != 'Terminé') {
                      return const SizedBox();
                    }
                    if (selectedFilter == 2 && exo['status'] != 'Manquant') {
                      return const SizedBox();
                    }

                    return _exerciseCard(
                      status: exo['status'],
                      title: exo['title'],
                      date: exo['date'],
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

  Widget _filterTab(
    String label,
    int index,
    Color dotColor, {
    bool isDot = false,
  }) {
    final isSelected = selectedFilter == index;

    return GestureDetector(
      onTap: () => setState(() => selectedFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? dotColor.withOpacity(0.2) : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: dotColor, width: 2) : null,
        ),
        child: Row(
          children: [
            if (isDot)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? dotColor : AppColors.darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exerciseCard({
    required String status,
    required String title,
    required String date,
  }) {
    final statusColor = status == 'Terminé' ? Colors.green : Colors.pinkAccent;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Label
          Text(
            status,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: statusColor,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 6),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // vertical bar
              Container(
                width: 3,
                height: 35,
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 10),

              // Title + Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Details button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExerciceDetailsPage(),
                    ),
                  );
                },

                child: const Text(
                  'Details',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
