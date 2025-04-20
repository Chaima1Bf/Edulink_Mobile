import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/notifications/notifications_page.dart';

class CantineListPage extends StatelessWidget {
  const CantineListPage({super.key});

  final List<Map<String, dynamic>> _lunches = const [
    {
      "day": "Lundi",
      "image": "assets/images/lundi_lunch.png",
      "color": Color(0xFFCAF1EB),
      "buttonColor": Color(0xFF4FD5AF),
      "menu":
          "Entrée: Salade verte\nPlat: Poulet rôti avec riz\nDessert: Yaourt nature",
    },
    {
      "day": "Mardi",
      "image": "assets/images/mardi_lunch.png",
      "color": Color(0xFFDEDDFD),
      "buttonColor": Color(0xFF9E9AFD),
      "menu":
          "Entrée: Soupe de légumes\nPlat: Spaghetti bolognaise\nDessert: Fruit de saison",
    },
    {
      "day": "Mercredi",
      "image": "assets/images/mercredi_lunch.png",
      "color": Color(0xFFDEDDFD),
      "buttonColor": Color(0xFF9E9AFD),
      "menu":
          "Entrée: Carottes râpées\nPlat: Poisson pané avec purée\nDessert: Compote",
    },
    {
      "day": "Jeudi",
      "image": "assets/images/jeudi_lunch.png",
      "color": Color(0xFFCAF1EB),
      "buttonColor": Color(0xFF4FD5AF),
      "menu":
          "Entrée: Tomates mozzarella\nPlat: Couscous aux légumes\nDessert: Flan",
    },
    {
      "day": "Vendredi",
      "image": "assets/images/vendredi_lunch.png",
      "color": Color(0xFFCAF1EB),
      "buttonColor": Color(0xFF4FD5AF),
      "menu":
          "Entrée: Betteraves\nPlat: Omelette avec pommes de terre\nDessert: Fromage blanc",
    },
    {
      "day": "Samedi",
      "image": "assets/images/samedi_lunch.png",
      "color": Color(0xFFDEDDFD),
      "buttonColor": Color(0xFF9E9AFD),
      "menu":
          "Entrée: Taboulé\nPlat: Burger végétarien avec frites\nDessert: Glace",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                    "Cantine",
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

              // Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Le menu de la semaine :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(height: 38),

              // Grid View
              Expanded(
                child: GridView.builder(
                  itemCount: _lunches.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) {
                    final item = _lunches[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: item['color'],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            item['image'],
                            height: 90,
                            width: 90,
                            fit:
                                BoxFit
                                    .contain, // or BoxFit.cover / BoxFit.fill depending on your preference
                          ),

                          Text(
                            item['day'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: AppColors.darkText,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    insetPadding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 24,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Menu du ${item['day']}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryRed,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            item['menu'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              height: 1.5,
                                              color: AppColors.darkText,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(height: 24),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primaryRed,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                    ),
                                              ),
                                              onPressed:
                                                  () => Navigator.pop(context),
                                              child: const Text(
                                                "Fermer",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: item['buttonColor'],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              alignment: Alignment.center,
                              child: const Text(
                                "Voir le menu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
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
