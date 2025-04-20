import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '/presentation/pages/child_selection/child_selection.dart';
import '/presentation/pages/reset_password/reset_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.pageBackground, // bleu très clair en arrière-plan
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Logo
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/LogoEdulink.png', height: 100),
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📦 Zone rouge avec tout le contenu
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryRed,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Se Connecter",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 65),

                    const Text(
                      "Username",
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    _buildTextField(),

                    const SizedBox(height: 20),

                    const Text(
                      "Mot De Passe",
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    _buildTextField(obscure: true),

                    const SizedBox(height: 10),

                    // Rester connecté
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                Colors.white, // bordure blanche
                          ),
                          child: Checkbox(
                            value: false,
                            onChanged: (_) {},
                            activeColor: Colors.white, // fond cochée blanche
                            checkColor:
                                AppColors
                                    .primaryRed, // coche rouge (optionnel pour contraste)
                            side: const BorderSide(
                              color: Colors.white,
                            ), // bordure
                          ),
                        ),
                        const Text(
                          "Rester connecté",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 120),

                    // Bouton Se Connecter
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChooseChildPage(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.primaryRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Se Connecter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Mot de passe oublié
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
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
    );
  }

  Widget _buildTextField({bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
