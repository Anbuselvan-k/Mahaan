import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathuram/home/bottom_nav.dart';
import 'package:mathuram/login/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_service/api.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? deviceId;
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    fetchDeviceId();
    getLocation();

  }

  Future<void> fetchDeviceId() async {
    String? id = await getDeviceId();
    setState(() {
      deviceId = id;
      print('Device ID: $deviceId'); // ✅ Safe to print here
    });
  }

  Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id; // Use `id` instead of deprecated `androidId`
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
    } catch (e) {
      print('Failed to get device id: $e');
    }
    return null;
  }
  void check()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permission denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permission denied forever.');

      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );


    latitude = position.latitude;
    longitude = position.longitude;
    print("Latitude: ${position.latitude}");
    print("Longitude: ${position.latitude}");
  }
  void getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Show dialog
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Enable Location"),
          content: Text("Please turn on location services to continue."),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator.openLocationSettings();
                Navigator.pop(context); // Close dialog
                check();

              },
              child: Text("Open Settings"),
            ),
          ],
        ),
      );
      return;
    }

    // Continue permission logic
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permission denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permission denied forever.');

      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      print("Latitude: $latitude");
      print("Longitude: $longitude");
    });
  }




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/mobilelogin.png', height: height * 0.18),

                Text("Sign Up", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),

                Column(
                  children: [
                    _buildTextField("First name", controller: firstNameController),
                    _buildTextField("Mobile Number", controller: mobileController, keyboardType: TextInputType.phone),
                    _buildTextField("Email", controller: emailController, keyboardType: TextInputType.emailAddress),

                  ],
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await ApiService.signupUser(
                        name: firstNameController.text,
                        mobile: mobileController.text,
                        email: emailController.text,
                        lnt: latitude.toString(),
                        lng: longitude.toString(),
                        device_id: deviceId.toString()
                      );

                      if (response['error_msg'] == 'Register successfully') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['error_msg'] ?? 'Signup failed')),
                        );
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', true);
                        await prefs.setString('name', firstNameController.text.trim());
                        await prefs.setString('mobile', mobileController.text.trim());
                        await prefs.setString('email', emailController.text.trim());

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['error_msg'] ?? 'Signup failed')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("SIGN UP", style: GoogleFonts.poppins(color: Colors.white)),
                ),

                Column(
                  children: [
                    Text("or continue with", style: GoogleFonts.poppins(fontSize: 12)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account? ", style: GoogleFonts.poppins(fontSize: 12)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Back to Login
                          },
                          child: Text("Login", style: GoogleFonts.poppins(fontSize: 12, color: Colors.blue)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("T&C’s", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
                        const SizedBox(width: 6),
                        Text("Privacy policy", style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {required TextEditingController controller,
        bool obscureText = false,
        TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label is required';
          }

          switch (label.toLowerCase()) {
            case 'first name':
              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                return 'Enter a valid name';
              }
              break;

            case 'mobile number':
              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return 'Enter a valid 10-digit mobile number';
              }
              break;

            case 'email':
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                return 'Enter a valid email address';
              }
              break;

            case 'password':
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              break;

            case 'confirm password':
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              break;
          }

          return null;
        },
      ),
    );
  }


  Widget _socialIcon(String asset, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey.shade200,
        child: Image.asset(asset, height: 24),
      ),
    );
  }
}