import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/notifications/notifications_page.dart';
import '/presentation/pages/home/home_page.dart';
import '/presentation/pages/settings/settings_profile.dart';

class AutreFraisPage extends StatefulWidget {
  const AutreFraisPage({Key? key}) : super(key: key);

  @override
  State<AutreFraisPage> createState() => _AutreFraisPageState();
}

class _AutreFraisPageState extends State<AutreFraisPage> {
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

  final List<Map<String, dynamic>> fraisData = [
    {'label': "Frais D'inscription", 'amount': '500/500', 'status': 'paid'},
    {'label': "Cantine", 'amount': '350/500', 'status': 'partial'},
    {'label': "Transport", 'amount': '0/500', 'status': 'unpaid'},
  ];

  final Map<String, dynamic> statusStyles = {
    'paid': {
      'image': 'assets/images/payed.png',
      'labelColor': Color(0xFF173021),
      'amountColor': Color(0xFF73B387),
    },
    'unpaid': {
      'image': 'assets/images/not_payed.png',
      'labelColor': Color(0xFF2D2C29),
      'amountColor': Color(0xFFDE584E),
    },
    'partial': {
      'image': 'assets/images/part_payed.png',
      'labelColor': Color(0xFF40362B),
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
                    "Autre Frais",
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

            /// Payment Cards
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: fraisData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final data = fraisData[index];
                  final status = statusStyles[data['status']];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          status['image'],
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          data['label'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: status['labelColor'],
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          data['amount'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: status['amountColor'],
                            fontSize: 15,
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

      /// Bottom Navigation Bar
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
