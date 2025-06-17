import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mathuram/login/SignUp_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/bottom_nav.dart';
import 'ForgotPass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool isGuest = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    loadRememberedCredentials();
  }
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


    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lat',position.latitude.toString() );
    await prefs.setString('long',position.longitude.toString() );

     setState(() {
       latitude = position.latitude;
       longitude = position.longitude;
     });
      print("Latitude: ${position.latitude}");
      print("Longitude: ${position.latitude}");
  }







  Future login({required String chitId, required String password}) async {

    if (latitude == null || longitude == null || deviceId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location or device info not available. Please enable location services.')),
      );
      getLocation();
      return; // Stop login attempt
    }

    Uri url = Uri.parse('https://chitsoft.in/wapp/api/m_api/');

    try {
      debugPrint('Started fetching...');
      final response = await http.post(
        url,
        body: {
          'type': '1001',
          'cid': '47157172',
          'user': chitId,
          'lt': latitude.toString(),
          'ln': longitude.toString(),
          'device_id': deviceId,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint('Response data: ${data.toString()}');
        final user = data;
        print(user);

        if(user['error_msg']=='Login Successfull'){
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', chitId);
          await prefs.setString('user_name', user['uname'] ?? '-');
          await prefs.setString('user_mobile', user['mobile'] ?? '-');
          await prefs.setString('user_email', user['email'] ?? '-');
          await prefs.setString('csi', user['cus_id'].toString() ?? '-');
          await prefs.setBool('isGuest', false);
          debugPrint('Response data: ${latitude}');debugPrint('Response data: ${longitude}');


          if (rememberMe) {
            await prefs.setBool('remember_me', true);
            await prefs.setString('saved_user_id', chitId);
            await prefs.setString('saved_password', password);
          } else {
            await prefs.setBool('remember_me', false);
            await prefs.remove('saved_user_id');
            await prefs.remove('saved_password');
          }


          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
          );
        }



      } else {
        debugPrint('Server responded with status: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (error) {
      debugPrint('Error in fetching: ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: ${error.toString()}')),
      );
      check();
    }
  }

  Future<void> loadRememberedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('remember_me') ?? false;
      if (rememberMe) {
        emailController.text = prefs.getString('saved_user_id') ?? '';
        passwordController.text = prefs.getString('saved_password') ?? '';
      }
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google [UserCredential]
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Error during Google Sign-In: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/login.png', height: 180),
                const SizedBox(height: 20),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text("Remember me"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue,

                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      final chitId = emailController.text.trim();
                      final password = passwordController.text;

                      if (chitId.isNotEmpty && password.isNotEmpty) {
                        login(chitId: chitId, password: password);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text('Please enter both email and password')),
                        );
                      }
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(" or "),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isGuest', true);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen()));
                  },
                  child: const Text(
                    "CONTINUE AS GUEST",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New Register?  "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
