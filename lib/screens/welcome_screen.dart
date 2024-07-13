import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_shop/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 120, right: 80, bottom: 40),
            child: Image.asset('images/groceries.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'We deliver grocery at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Fresh items everyday.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                  'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
