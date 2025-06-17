import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'bottom_nav.dart';

class Scheme extends StatefulWidget {
  final String imagePath;
  final int imageIndex; // Accept index

  const Scheme({
    Key? key,
    required this.imagePath,
    required this.imageIndex,
  }) : super(key: key);

  @override
  State<Scheme> createState() => _SchemeState();
}

class _SchemeState extends State<Scheme> {
  late int _currentIndex;

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController scheme = TextEditingController();
  TextEditingController branch = TextEditingController();

  List<String> schemeList = [];
  List<String> branchList = [];

  final List<Color> backgroundColors = [
    Color(0xff005955),
    Color(0xff7C3F01),
    Color(0xff7C0103),
    Color(0xff017C43),
    Color(0xff7C0165),
    Color(0xff00558B),
    Color(0xff818100),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.imageIndex;
    fetchEnquiryData();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Background color of status bar
      statusBarIconBrightness: Brightness.dark, // Black icons/text
      statusBarBrightness: Brightness.light, // For iOS
    ));
  }

  Future<void> fetchEnquiryData() async {
    final uri = Uri.parse(
        'https://chitsoft.in/wapp/api/mobile3/?type=224&cid=47157172&name=sathish&mobile=6379767308&message=2&scheme=100000');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        print('Response: ${response.body}');

        if (jsonData is Map && jsonData.containsKey('values') && jsonData.containsKey('branch')) {
          setState(() {
            schemeList = List<String>.from(jsonData['values']); // Update schemeList and trigger rebuild
          });
          branchList = List<String>.from(jsonData['branch']);

          print('Schemes loaded: ${schemeList.length}');

          print(schemeList);


        } else {
          print('Invalid data format');
        }
      } else {
        print('Failed to load: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _showMyDialog(BuildContext context) {
    bool _isPhoneChecked = false;
    bool _isWhatsAppChecked = false;
    String selectedOption = "";
    String? selectedScheme;

    List<String> screenOptions = ['Head Office - Trichy','Register Office - Manapparai','Branch Office: Natham','Branch Office: Dindigul'];
    String? selectedScreen;
    List<String> titleOptions = ["Mr.", "Mrs.",];
    String? selectedTitle = "Mr.";

    showDialog(
      context: context,

      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: SingleChildScrollView(
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logo.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title Dropdown
                          SizedBox(
                            width: 70,
                            child: DropdownButtonFormField<String>(
                              value: selectedTitle,
                              hint: Text(
                                "Title",
                                style: GoogleFonts.inriaSans(fontSize: 12),
                              ),
                              isDense: true,
                              items: titleOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.inriaSans(
                                      fontSize: 12,
                                      fontWeight: value == "Mr." ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedTitle = newValue;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: "Title",
                                labelStyle: GoogleFonts.inriaSans(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff00558B)),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              ),
                            ),
                          ),

                          SizedBox(width: 8),

                          // Name TextField
                          Expanded(
                            child: TextFormField(
                              controller: name,
                              style: GoogleFonts.inriaSans(fontSize: 13),
                              decoration: InputDecoration(

                                hintText: "Enter Your Name",
                                hintStyle: GoogleFonts.inriaSans(fontSize: 12),
                                labelText: "Contact Person Name",
                                labelStyle: GoogleFonts.inriaSans(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff00558B)),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: mobile,
                          keyboardType: TextInputType.phone,
                          style: GoogleFonts.inriaSans(fontSize: 13),
                          decoration: InputDecoration(
                            hintText: "Enter Mobile Number",
                            hintStyle: GoogleFonts.inriaSans(fontSize: 12),
                            labelText: "Mobile Number",
                            labelStyle: GoogleFonts.inriaSans(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff00558B)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      schemeList.isEmpty
                          ? CircularProgressIndicator()
                          : SizedBox(
                        width: 400,
                        child: DropdownButtonFormField<String>(
                          value: selectedScheme,
                          hint: Text(
                            "Select Scheme",
                            style: GoogleFonts.inriaSans(fontSize: 12),
                          ),
                          isDense: true,
                          items: schemeList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.inriaSans(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedScheme = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Scheme",
                            labelStyle: GoogleFonts.inriaSans(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff00558B)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ),


                      SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        child: DropdownButtonFormField<String>(
                          value: selectedScreen,
                          hint: Text(
                            "Select Branch",
                            style: GoogleFonts.inriaSans(fontSize: 12),
                          ),
                          isDense: true,
                          items: branchList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.inriaSans(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedScreen = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Screen",
                            labelStyle: GoogleFonts.inriaSans(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff00558B)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                        ),
                      ),

                      SizedBox(height: 5,),


                    ],
                  ),
                  actions: [
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00558B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            final url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');

                            try {
                              final response = await http.post(
                                url,
                                body: {
                                  'type': '224',
                                  'cid': '47157172',
                                  'name': '$selectedTitle ${name.text.trim()}',
                                  'mobile': mobile.text.trim(),
                                  'scheme': selectedScheme,
                                  'branch': selectedScreen,
                                },
                              );

                              debugPrint('Status code: ${response.statusCode}');
                              debugPrint('Response body: ${response.body}');

                              if (response.statusCode == 200) {
                                // ✅ Show success dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      contentPadding: const EdgeInsets.all(20),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.check_circle,
                                              color: Colors.green, size: 60),
                                          const SizedBox(height: 16),
                                          Text(
                                            "Enquiry Sent Successfully!",
                                            style: GoogleFonts.inriaSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 16),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Close success dialog
                                              Navigator.of(context).pop(); // Close enquiry dialog
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(0xff00558B),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              "OK",
                                              style: GoogleFonts.inriaSans(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                name.clear();
                                mobile.clear();
                              } else {
                                debugPrint('Request failed ❌: ${response.statusCode}');
                              }
                            } catch (e) {
                              debugPrint('Exception occurred: $e');
                            }
                          },
                          child: Text(
                            "Send Enquiry",
                            style: GoogleFonts.inriaSans(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00558B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.inriaSans(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],


                ),
              ),
            );
          },
        );
      },
    );
  }




  Future<void> _shareImage(BuildContext context) async {
    if (!Platform.isAndroid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sharing is supported only on Android.')),
      );
      return;
    }

    try {
      final byteData = await rootBundle.load(widget.imagePath);
      final bytes = byteData.buffer.asUint8List();

      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/shared_image.png';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      await Share.shareXFiles(
        [XFile(filePath)],
        text: 'Check out this image!',
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing image: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColors[_currentIndex % backgroundColors.length],
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 28,
            )),
        title: const Text(
          'Schemes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: backgroundColors[_currentIndex % backgroundColors.length],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          Container(
            height: MediaQuery.of(context).size.height * 0.85, // 85% of screen height
            width: MediaQuery.of(context).size.width * 1.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _actionButton("assets/call.png", "Enquiry Now",
                              () => _showMyDialog(context), false),
                      _actionButton("assets/download.png", "Download Plan",
                              () {}, true),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  child: GestureDetector(
                    onTap: () => _shareImage(context),
                    child:
                    Image.asset('assets/share.png', width: 22, height: 22),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(
      String iconPath, String label, VoidCallback onPressed, bool filled) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: filled
            ? backgroundColors[_currentIndex % backgroundColors.length]
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: filled
            ? BorderSide.none
            : BorderSide(
            color: backgroundColors[_currentIndex % backgroundColors.length]),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        elevation: 5,
        minimumSize: Size(120, 35),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 16, height: 10),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: filled
                  ? Colors.white
                  : backgroundColors[_currentIndex % backgroundColors.length],
            ),
          ),
        ],
      ),
    );
  }
}
