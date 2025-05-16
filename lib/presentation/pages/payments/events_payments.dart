import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/notifications/notifications_page.dart';
import '/presentation/pages/home/home_page.dart';
import '/presentation/pages/settings/settings_profile.dart';

class MesEventsPage extends StatefulWidget {
  const MesEventsPage({Key? key}) : super(key: key);

  @override
  State<MesEventsPage> createState() => _MesEventsPageState();
}

class _MesEventsPageState extends State<MesEventsPage> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SettingsProfilePage()),
      );
    }
  }

  final List<Map<String, dynamic>> clubs = [
    {'title': "Fête de fin d’année", 'amount': "500/500", 'status': 'paid'},
    {'title': "Fête de fin d’année", 'amount': "0/500", 'status': 'unpaid'},
    {'title': "Fête de fin d’année", 'amount': "120/500", 'status': 'partial'},
  ];

  final Map<String, dynamic> statusStyles = {
    'paid': {
      'image': 'assets/images/payed.png',
      'bgColor': Color(0xFF73B386),
      'textColor': Color(0xFF173021),
      'amountColor': Color(0xFF73B387),
    },
    'unpaid': {
      'image': 'assets/images/not_payed.png',
      'bgColor': Color(0xFFDF584E),
      'textColor': Color(0xFF2D2C29),
      'amountColor': Color(0xFFDE584E),
    },
    'partial': {
      'image': 'assets/images/part_payed.png',
      'bgColor': Color(0xFFF29D4F),
      'textColor': Color(0xFF40362B),
      'amountColor': Color(0xFFEF984B),
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Top Navigation Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withAlpha(64),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                  const Text(
                    "Mes Évènements",
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
                        color: AppColors.primaryRed.withAlpha(64),
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
            ),

            const SizedBox(height: 30),

            /// Event Payment Cards
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  final data = clubs[index];
                  final status = statusStyles[data['status']];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 85,
                          width: 100,
                          decoration: BoxDecoration(
                            color: status['bgColor'],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              status['image'],
                              height: 70,
                              width: 70,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: status['textColor'],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  data['amount'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: status['amountColor'],
                                  ),
                                ),
                              ],
                            ),
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

      /// Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}
