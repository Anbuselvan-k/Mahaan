import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathuram/home/bottom_nav.dart';
import 'package:mathuram/home/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:mathuram/login/Login_Screen.dart';


class WalkthroughScreen extends StatefulWidget {
  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/img1.png',
      'description': '',
    },
    {
      'image': 'assets/img2.png',
      'description': '',
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Background color of status bar
      statusBarIconBrightness: Brightness.dark, // Black icons/text
      statusBarBrightness: Brightness.light, // For iOS
    ));
  }


  void _nextContent() {
    if (currentIndex < pages.length - 1) {
      setState(() => currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Stack(children: [
          if (currentIndex == 0)
            Positioned(
              top: 0,
              right: 0,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.lato(
                    color: Colors.purple.shade800,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple.shade800,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 0,
            left: currentIndex == 0 ? 0 : null,
            right: currentIndex == 1 ? 0 : null,
            child: Image.asset(
              currentIndex == 0 ? 'assets/topleft.png' : 'assets/topright.png',
              height: 150,
              width: 150,
            ),
          ), // if this second index the image is topright
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [




                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            pages[currentIndex]['image']!,
                            width: currentIndex == 1 ? 360 : 360,
                            height: currentIndex == 1 ? 470 : 470,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: currentIndex == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0xff00558B)
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: _nextContent,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00558B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      currentIndex == pages.length - 1 ? "Get Started" : "Next",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),





              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: currentIndex == 0 ? 0 : null,
            left: currentIndex == 1 ? 0 : null,
            child: Image.asset(
              currentIndex == 0 ? 'assets/bottomright.png' : 'assets/bottomleft.png',
              height: 150,
              width: 150,
            ),
          ), // if this second index the image is bottomleft
        ],),

      ),
    );
  }
}
