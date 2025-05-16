import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/news/news_page.dart';
import '/presentation/pages/clubs/club_details.dart';
import '/presentation/pages/clubs/clubs_list.dart';
import '/presentation/pages/events/events_list.dart';
import '/presentation/pages/cantine/cantine_list.dart';
import '/presentation/pages/settings/settings_profile.dart';
import '/presentation/pages/exercices/exercices_list.dart';
import '/presentation/pages/calendar/calendar_page.dart';
import '/presentation/pages/payments/my_payments.dart';

const List<Map<String, dynamic>> categories = [
  {'label': 'Actualités', 'icon': 'megaphone.png', 'color': 0x4D46DDB9},
  {'label': 'Clubs', 'icon': 'kick.png', 'color': 0x4D8183FE},
  {'label': 'Evénements', 'icon': 'event.png', 'color': 0x4DFA7193},
  {'label': 'Cantine', 'icon': 'canteen.png', 'color': 0x4D46DDB9},
  {'label': 'Calendriers', 'icon': 'calendar.png', 'color': 0x4D8183FE},
  {'label': 'Exercices', 'icon': 'homework.png', 'color': 0x4DFA7193},
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.primaryBlue, elevation: 0),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                // Header
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipPath(
                      clipper: HomeHeaderClipper(),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    width: 22,
                                    height: 22,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/tn_flag.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "Tn",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Text(
                                "Bonjour ",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Text("👋", style: TextStyle(fontSize: 22)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Ben Farhat Chaima",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "2A3",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/images/child.jpg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Catégories :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 2.2,
                            ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return GestureDetector(
                            onTap: () {
                              if (category['label'] == 'Clubs') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            const ClubsAndActivitiesPage(),
                                  ),
                                );
                              } else if (category['label'] == 'Actualités') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NewsPage(),
                                  ),
                                );
                              } else if (category['label'] == 'Evénements') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EventsPage(),
                                  ),
                                );
                              } else if (category['label'] == 'Exercices') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ExercicesPage(),
                                  ),
                                );
                              } else if (category['label'] == 'Calendriers') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CalendarPage(),
                                  ),
                                );
                              } else if (category['label'] == 'Cantine') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const CantineListPage(),
                                  ),
                                );
                              }
                            },
                            child: CategoryTile(
                              label: category['label']!,
                              iconPath: 'assets/icons/${category['icon']}',
                              bgColor: Color(category['color']),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Actualités
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Actualités :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewsPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Voir Tous",
                              style: TextStyle(
                                color: Color.fromARGB(255, 110, 110, 110),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const ClubDetailsPage(),
                                  ),
                                );
                              },
                              child: const NewsCard(
                                imageAsset: 'assets/images/music_club.jpg',
                                title: 'Club de Musique',
                                price: '250 Dt',
                                date: '11/06/2023',
                                time: '10h - 14h',
                                isLieu: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: NewsCard(
                              imageAsset: 'assets/images/music_club.jpg',
                              title: 'Fête de fin d\'année',
                              price: '100 Dt',
                              date: '11/06/2023',
                              time: '10h - 14h',
                              isLieu: false,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 1,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 2) {
            // Settings icon index
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsProfilePage(),
              ),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyPaymentsPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}

// Catégorie
class CategoryTile extends StatelessWidget {
  final String label;
  final String iconPath;
  final Color bgColor;

  const CategoryTile({
    super.key,
    required this.label,
    required this.iconPath,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(flex: 1, child: Image.asset(iconPath, height: 50)),
        ],
      ),
    );
  }
}

// Carte d'actualité
class NewsCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String price;
  final String date;
  final String time;
  final bool isLieu;

  const NewsCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.price,
    required this.date,
    required this.time,
    required this.isLieu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.asset(
                  imageAsset,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5652),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),

          // Infos
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isLieu ? Icons.location_on : Icons.calendar_today,
                          color: AppColors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            isLieu ? "Les Samedis" : date,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.access_time,
                          color: AppColors.white,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '10h - 14h',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Header Wave
class HomeHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.cubicTo(
      size.width * 0.2,
      size.height - 20,
      size.width * 0.35,
      size.height + 15,
      size.width * 0.65,
      size.height - 15,
    );
    path.cubicTo(
      size.width * 0.8,
      size.height - 30,
      size.width * 0.9,
      size.height - 40,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
