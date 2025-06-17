import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background logo with opacity
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Image.asset(
                'assets/bg.png',
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF005D96), Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30, // how far the image pops out
                      child: Image.asset(
                        'assets/bg1.png',
                        width: 220,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Our Social Media",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              buildSocialTile('assets/instagram.png', 'Instagram', 'https://www.instagram.com/mathuramchit?utm_source=qr&igsh=MXRiNXF5dHFidzZtNA=='),
              buildSocialTile('assets/facebook.png', 'Facebook', 'https://www.facebook.com/share/1Ar5ukMetV/'),
              buildSocialTile('assets/youtube.png', 'Youtube', 'https://www.youtube.com/@Mathuramchits'),
              buildSocialTile('assets/network.png', 'Website', 'https://mathuramchits.com/'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSocialTile(String iconPath, String title, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: GestureDetector(
        onTap: () {
          _launchURL(url);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.60), // adds a light background for readability
            border: Border.all(width: 1.2, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 24,
                backgroundImage: AssetImage(iconPath),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }

  // Method to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}