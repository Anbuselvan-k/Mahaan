import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathuram/login/Login_Screen.dart';
import 'package:pinput/pinput.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _mobileController = TextEditingController();
  bool _isLoading = false;
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

  Future<void> _sendOtp() async {
    final mobile = _mobileController.text.trim();

    if (mobile.isEmpty || mobile.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid mobile number.")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/m_api/'),
        body: {

          'cid':'47157172',
          'type':'1048',
          'device_id':deviceId,
          'ln':longitude.toString(),
          'lt':latitude.toString(),
          'mobile':mobile
        },
      );

      final data = jsonDecode(response.body);
      if (data['error_msg'] == 'Allow to next page') {
        // Pass mobile number to OTP screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OTPScreen(mobile: mobile,lat: latitude.toString(),long: longitude.toString(),deviceId:deviceId.toString())),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['msg'] ?? 'Failed to send OTP')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pass1.png', height: 120),
              const SizedBox(height: 20),
              Text("Reset Password",
                  style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("No worries, we’ll send you reset instructions.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14)),
              const SizedBox(height: 20),
              TextField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Enter Your Mobile Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: _isLoading ? null : _sendOtp,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text("NEXT", style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class OTPScreen extends StatefulWidget {
  final String mobile;

  final String long;
  final String lat;
  final String deviceId;

  const OTPScreen({super.key, required this.mobile,required this.long,required this.lat,required this.deviceId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  int _timerSeconds = 30;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    setState(() {
      _canResend = false;
      _timerSeconds = 30;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  // ✅ Function to resend OTP
  Future<void> resendOtp() async {
    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/m_api/'),
        body: {
          'type': '1048',
          'cid': '47157172',
          'mobile': widget.mobile,
          'device_id': widget.deviceId,
          'ln': widget.long,
          'lt': widget.lat,
        },
      );

      final data = jsonDecode(response.body);
      if (data['error_msg'] == 'Allow to next page') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP resent successfully.")),
        );
        _startResendTimer();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['msg'] ?? "Failed to resend OTP.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  // ✅ Function to verify OTP
  Future<void> verifyOtpAndProceed() async {
    if (_otpController.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a 6-digit OTP.")),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/m_api/'),
        body: {
          'type': '1049',
          'cid': '47157172',
          'mobile': widget.mobile,
          'device_id': widget.deviceId,
          'ln': widget.long,
          'lt': widget.lat,
          'otp': _otpController.text.trim(), // ✅ use _otpController
        },
      );

      final data = jsonDecode(response.body);
      if (data['error_msg'] == 'Login Successfull') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP verified successfully.")),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NewPasswordScreen(mobile: widget.mobile,
            lat: widget.lat,
            long: widget.long,
            deviceId: widget.deviceId,)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['msg'] ?? "Invalid OTP.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }


  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pass2.png', height: 120),
              const SizedBox(height: 20),
              Text("Reset Password",
                  style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("Enter the OTP sent to +91-***${widget.mobile.substring(widget.mobile.length - 3)}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14)),
              const SizedBox(height: 20),

              // 6-digit OTP using Pinput
              Pinput(
                controller: _otpController,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 55,
                  height: 60,
                  textStyle: const TextStyle(fontSize: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              _canResend
                  ? TextButton(
                onPressed: resendOtp,
                child: Text("Resend OTP", style: GoogleFonts.poppins(color: Colors.blue)),
              )
                  : Text("Resend OTP in $_timerSeconds sec",
                  style: GoogleFonts.poppins(fontSize: 14)),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: verifyOtpAndProceed,
                child: Text("CONTINUE", style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class NewPasswordScreen extends StatefulWidget {
  final String mobile;
  final String lat;
  final String long;
  final String deviceId;
  const NewPasswordScreen({super.key, required this.mobile,
  required this.lat,
  required this.long,
  required this.deviceId,});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureNew = true;
  bool _obscureConfirm = true;

  Future<void> _resetPassword() async {
    final newPass = _newPasswordController.text.trim();
    final confirmPass = _confirmPasswordController.text.trim();

    if (newPass.isEmpty || confirmPass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in both fields.")),
      );
      return;
    }

    if (newPass.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be at least 6 characters.")),
      );
      return;
    }

    if (newPass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match.")),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/m_api/'),
        body: {
          'type': '1050',
          'cid': '47157172',
          'mobile': widget.mobile,
          'device_id': widget.deviceId,
          'ln': widget.long,
          'lt': widget.lat,
          'password': newPass,
          'con_password': confirmPass
        },
      );

      final data = jsonDecode(response.body);

      if (data['error_msg'] == 'Password Updated Successfull') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password Updated Successfull")),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['msg'] ?? "Something went wrong.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pass3.png', height: 120),
              const SizedBox(height: 20),
              Text("Set New Password",
                  style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("Create a strong password to secure your account.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14)),
              const SizedBox(height: 20),
              TextField(
                controller: _newPasswordController,
                obscureText: _obscureNew,
                decoration: InputDecoration(
                  labelText: "Create Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureNew ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureNew = !_obscureNew),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirm,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: _resetPassword,
                child: Text("RESET PASSWORD", style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

