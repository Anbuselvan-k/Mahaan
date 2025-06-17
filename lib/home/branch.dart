import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mathuram/home/bottom_nav.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00598C),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
        ),
        title: const Text('Branches', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(height: 16),
              SizedBox(
                height: 70,
                width: 110,
                child: Image.asset('assets/logo.png', fit: BoxFit.fill),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Branches",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 6),
              branchCard(
                index: 1,
                title: 'Register Office - Manapparai',
                name: 'Mr.R.Dhinesh(Managing Director)',
                address: 'No. 103, 222 Kovilpatti Road,\nGandhinagar, Manaparai - 621 306.',
                phone: '+919894242142', // Added country code
                context: context,
              ),
              branchCard(
                index: 2,
                title: 'Head Office - Trichy',
                name: 'Mr.R.Ramachandran\n(Administrative Director)',
                address: 'C 48, 4th Cross, Thillai Nagar,\nTrichy - 620 018.',
                phone: '+917904545610', // Added country code
                context: context,
              ),
              branchCard(
                index: 3,
                title: 'Branch Office: Natham',
                name: 'Mr.S.Eugine Jose Christopher\n(Administrative Director)',
                address: 'Yugesh Illam, Darbar Nagar,\nNatham - 624 401.',
                phone: '+917904872282', // Added country code
                context: context,
              ),
              branchCard(
                index: 4,
                title: 'Branch Office: Dindigul',
                name: 'Mr.T.Theenadayalan\n(Administrative Director)',
                address:
                '40, Spencer Compound, Kurinji Lodge Opp,\nNearby Bus stand, Dindigul - 624 003.',
                phone: '+919080720061', // Added country code
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget branchCard({
    required int index,
    required String title,
    required String name,
    required String address,
    required String phone,
    required BuildContext context, // Added context
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00598C)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Panel
            Container(
              width: 90,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF00598C), width: 3),
                        ),
                        child: Center(
                          child: Text(
                            '$index',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00598C),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Divider
            Container(width: 1, color: const Color(0xFF00598C)),
            // Right Panel
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff170B83),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(address, style: GoogleFonts.lato(fontSize: 10)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.phone_android, size: 14),
                        const SizedBox(width: 4),
                        Flexible(child: Text(phone, style: TextStyle(fontSize: 10))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconCircle(
                          Icons.call,
                          color: const Color(0xFF00598C),
                          phoneNumber: phone,
                          context: context,
                        ),
                        iconCircle(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                          phoneNumber: phone,
                          context: context,
                        ),
                        GestureDetector(
                          onTap: () => _launchMaps(address, context),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF00598C), width: 2),
                            ),
                            child: const Icon(Icons.location_on, color: Colors.red, size: 19),
                          ),
                        ),
                      ],
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

  Widget iconCircle(
      IconData icon, {
        Color color = Colors.blue,
        String? phoneNumber,
        required BuildContext context, // Added context
      }) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.call && phoneNumber != null) {
          _launchDialer(phoneNumber, context);
        } else if (icon == FontAwesomeIcons.whatsapp && phoneNumber != null) {
          _launchWhatsApp(phoneNumber, context);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
        ),
        child: Center(
          child: Icon(icon, size: 18, color: color),
        ),
      ),
    );
  }

  Future<void> _requestCallPermission(BuildContext context) async {
    if (await Permission.phone.request().isGranted) {
      // Permission granted, proceed with dialer
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Call permission denied')),
      );
      print('Call permission denied');
    }
  }

  Future<void> _launchDialer(String phoneNumber, BuildContext context) async {
    // Validate phone number format
    if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid phone number format')),
      );
      return;
    }

    if (Platform.isAndroid) {
      var status = await Permission.phone.request();
      if (!status.isGranted) {
        if (status.isPermanentlyDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Phone permission required. Please enable it in settings.'),
              action: SnackBarAction(
                label: 'Settings',
                onPressed: () => openAppSettings(),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone permission denied')),
          );
        }
        return;
      }
    }

    // Try tel: scheme first
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(telUri)) {
        await launchUrl(telUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (e) {
      print('Failed to open dialer with tel: $e');
    }

    // Fallback to dial: scheme
    final Uri dialUri = Uri(scheme: 'dial', path: phoneNumber);
    try {
      if (await canLaunchUrl(dialUri)) {
        await launchUrl(dialUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (e) {
      print('Failed to open dialer with dial: $e');
    }

    // Final error with guidance
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No dialer app found. Please install a phone app or check default app settings.'),
        action: SnackBarAction(
          label: 'Open Store',
          onPressed: () async {
            final Uri storeUri = Uri.parse('market://details?id=com.google.android.dialer');
            if (await canLaunchUrl(storeUri)) {
              await launchUrl(storeUri, mode: LaunchMode.externalApplication);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cannot open app store')),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _launchWhatsApp(String phoneNumber, BuildContext context) async {
    if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid phone number format')),
      );
      return;
    }

    String formattedNumber = phoneNumber.startsWith('+') ? phoneNumber : phoneNumber;
    final Uri uri = Uri.parse('https://wa.me/$formattedNumber');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback to WhatsApp Web
        final Uri browserUri = Uri.parse('https://web.whatsapp.com/send?phone=${formattedNumber.substring(1)}');
        if (await canLaunchUrl(browserUri)) {
          await launchUrl(browserUri, mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('WhatsApp not installed and no browser available')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open WhatsApp: $e')),
      );
      print('Failed to open WhatsApp: $e');
    }
  }

  Future<void> _launchMaps(String location, BuildContext context) async {
    String cleanAddress = location.replaceAll('\n', ', ').replaceAll(RegExp(r'\s+'), ' ').trim();
    final encodedLocation = Uri.encodeComponent(cleanAddress);

    // Try Google Maps app first
    final Uri googleMapsUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedLocation');
    try {
      if (await canLaunchUrl(googleMapsUri)) {
        await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (e) {
      print('Failed to open Google Maps: $e');
    }

    // Fallback to geo: scheme
    final Uri geoUri = Uri.parse('geo:0,0?q=$encodedLocation');
    try {
      if (await canLaunchUrl(geoUri)) {
        await launchUrl(geoUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (e) {
      print('Failed to open geo: $e');
    }

    // Final fallback to browser
    final Uri browserUri = Uri.parse('https://www.google.com/maps?q=$encodedLocation');
    try {
      if (await canLaunchUrl(browserUri)) {
        await launchUrl(browserUri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No maps app or browser found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open maps in browser: $e')),
      );
      print('Failed to open maps in browser: $e');
    }
  }
}