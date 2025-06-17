
import 'package:flutter/material.dart';
import 'package:mathuram/welcome_screen/walkthrough_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds:3));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WalkthroughScreen()),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Image.asset('assets/flower.png'),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Image.asset('assets/splach.png',),
        ),
        Image.asset('assets/splash1.png',height: 211,width: 227,),
          Text(
            'பதிவு எண் :\nU65929TN2020PTC135498',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],),
    );
  }
}
