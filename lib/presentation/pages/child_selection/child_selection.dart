import 'package:flutter/material.dart';
import '/presentation/pages/home/home_page.dart';
//import '../../../core/constants/app_colors.dart';

class ChooseChildPage extends StatelessWidget {
  const ChooseChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F8), // Light pink background
      body: Column(
        children: [
          // 🔴 Header that extends behind status bar
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: topPadding + 16, bottom: 24),
            decoration: const BoxDecoration(
              color: Color(0xFFFF5652),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: const [
                Text(
                  "Choisissez Votre\nEnfant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "2/3",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          // 🌸 Avatar with soft radial background
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFFFFEAEA), Colors.white],
                center: Alignment.center,
                radius: 0.9,
              ),
            ),
            child: const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(
                'assets/images/child.png',
              ), // Replace with your image
            ),
          ),

          const SizedBox(height: 30),

          // 👧 Name + arrows beside it
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back_ios, color: Color(0xFFFF5652), size: 22),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Ben Farhat\nChaima",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "2A3",
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF5652),
                  size: 22,
                ),
              ],
            ),
          ),

          SizedBox(height: 200),

          // 🔘 Continue Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5652),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Continuer",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
