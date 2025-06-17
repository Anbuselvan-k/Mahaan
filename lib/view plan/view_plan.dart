import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathuram/home/bottom_nav.dart';
import 'package:mathuram/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';





class ChitFundTablePage extends StatefulWidget {
  const ChitFundTablePage({super.key});

  @override
  State<ChitFundTablePage> createState() => _ChitFundTablePageState();
}

class _ChitFundTablePageState extends State<ChitFundTablePage> {
  int _currentIndex = 0; // Start at first page
  int _totalDots = 7;

  final List<String> imagePaths = [
    'assets/chit0.png',
    'assets/chit1.png',
    'assets/chitt.png',
    'assets/chit4.png',
    'assets/chit5.png',
    'assets/chit6.png',
    'assets/chit7.png',

  ];

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController scheme = TextEditingController();
  TextEditingController branch = TextEditingController();

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
    if (_currentIndex < 0 || _currentIndex >= imagePaths.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid image index.')),
      );
      return;
    }

    try {
      final imagePath = imagePaths[_currentIndex];
      final byteData = await rootBundle.load(imagePath);
      final bytes = byteData.buffer.asUint8List();

      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/shared_image_$_currentIndex.png';
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
  Future<void> _downloadImage(BuildContext context) async {
    if (!Platform.isAndroid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Download is only supported on Android')),
      );
      return;
    }

    // Request permission
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied.')),
      );
      return;
    }

    try {
      final imagePath = imagePaths[_currentIndex]; // ✅ Get the correct asset path
      final byteData = await rootBundle.load(imagePath); // ✅ Load image
      final bytes = byteData.buffer.asUint8List();

      // Set up the path to Downloads folder
      final downloadDir = Directory('/storage/emulated/0/Download');
      if (!downloadDir.existsSync()) {
        downloadDir.createSync(recursive: true);
      }

      final filePath = '${downloadDir.path}/downloaded_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image downloaded successfully to: $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }






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


  PageController _pageController = PageController();


  @override
  void initState() {
    super.initState();
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors[_currentIndex % backgroundColors.length],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top, // Moves content below status bar
    bottom: MediaQuery.of(context).viewInsets.bottom,),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  height: MediaQuery.of(context).size.height * 0.85, // 85% of screen height
                  width: MediaQuery.of(context).size.width * 1.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),


                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imagePaths.isEmpty ? 1 : imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return
                        Container(
                        width: double.infinity,
                        height: double.infinity,

                        child: Stack(children: [
                          Center(
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.fill,),
                          ),
                          Positioned(
                            bottom: 3, // Distance from bottom
                            left: 0, // Align buttons to the left side
                            right: 0, // Make buttons span full width
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4, // 40% of screen width
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showMyDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      side: BorderSide(
                                        color: backgroundColors[_currentIndex % backgroundColors.length],
                                      ),
                                      backgroundColor: Colors.white,
                                      elevation: 5,
                                      shadowColor: Colors.black.withOpacity(0.3),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/call.png', width: 16, height: 10),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Enquiry Now',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: backgroundColors[_currentIndex % backgroundColors.length],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 9,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () => _downloadImage(context),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor: backgroundColors[_currentIndex % backgroundColors.length],
                                      elevation: 5,
                                      shadowColor: Colors.black.withOpacity(0.3),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/download.png', width: 16, height: 10),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'Download Plan',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )

                          ),
                          Positioned(
                              top:10,
                              right:15,
                              child: GestureDetector(
                      onTap: () => _shareImage(context),
                                  child: Image.asset('assets/share.png',width: 22,height: 22,))
                          )

                        ],),
                      );
                    },
                  ),
                ),




                const SizedBox(height: 12),
                DotsIndicator(totalDots: 7, currentIndex: _currentIndex),
                const SizedBox(height: 12),

              ],
            ),
          ],
        ),
      ),
    );
  }
}



class DotsIndicator extends StatelessWidget {
  final int totalDots;
  final int currentIndex;

  const DotsIndicator({
    Key? key,
    required this.totalDots,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? Colors.white
                : Colors.grey.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}



