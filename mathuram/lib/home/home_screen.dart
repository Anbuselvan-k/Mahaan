import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mathuram/home/bottom_nav.dart';
import 'package:mathuram/home/scheme_screen.dart';
import 'package:mathuram/view%20plan/view_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/Login_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageUrls = ['assets/ban3.png', 'assets/ban4.png'];
  final List<Map<String, String>> schemes = [
    {
      'title': 'Scheme 1',
      'amount': '5,00,000',
      'members': '20',

      'duration': '20 Months',
      'image': 'assets/chit0.png',
    },
    {
      'title': 'Scheme 2',
      'amount': '10,00,000',
      'members': '20',
      'monthlyInvestment': '50,000',
      'duration': '20 Months',
      'image': 'assets/chit1.png',
    },
    {
      'title': 'Scheme 3',
      'amount': '2,50,000',
      'members': '20',
      'monthlyInvestment': '10,000',
      'duration': '20 Months',
      'image': 'assets/chitt.png',
    },
    {
      'title': 'Scheme 4',
      'amount': '7,50,000',
      'members': '20',
      'monthlyInvestment': '35,000',
      'duration': '20 Months',
      'image': 'assets/chit4.png',
    },
    {
      'title': 'Scheme 5',
      'amount': '12,00,000',
      'members': '20',
      'monthlyInvestment': '60,000',
      'duration': '20 Months',
      'image': 'assets/chit5.png',
    },
    {
      'title': 'Scheme 6',
      'amount': '8,00,000',
      'members': '20',
      'monthlyInvestment': '40,000',
      'duration': '20 Months',
      'image': 'assets/chit6.png',
    },
    {
      'title': 'Scheme 6',
      'amount': '8,00,000',
      'members': '20',
      'monthlyInvestment': '40,000',
      'duration': '20 Months',
      'image': 'assets/chit7.png',
    },

  ];
  final List<String> imagePaths = [
    'assets/chit0.png',
    'assets/chit1.png',
    'assets/chitt.png',
    'assets/chit4.png',
    'assets/chit5.png',
    'assets/chit6.png',
    'assets/chit7.png',
  ];
  int activeIndex = 0;
  bool showAllSchemes = false;

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController scheme = TextEditingController();
  TextEditingController branch = TextEditingController();




  List<String> schemeList = [];
  List<String> branchList = [];
  List<String> chitList = [
    '1,00,000',
    '2,00,000',
    '5,00,000',
    '10,00,000',
    '20,00,000',
    '50,00,000',
    '1,00,00,000'
  ];
  final List<String> menuItems = [
    "Account Info",

    "Log out",
    "Delete Account"
  ];

  @override
  void initState() {
    super.initState();
    fetchEnquiryData();
    loadUserData();
    checkGuestStatus();


  }

  bool isGuest = false;



  void checkGuestStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isGuest = prefs.getBool('isGuest') ?? false;
    });
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
          schemeList = List<String>.from(jsonData['values']);
          branchList = List<String>.from(jsonData['branch']);
          print('Schemes loaded: ${schemeList.length}');
          print('Branches loaded: ${branchList.length}');
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

  Future<void> deleteAccount(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('csi') ?? '';

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID not found. Please log in again.')),
      );
      return;
    }

    Uri url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');

    try {
      final response = await http.post(
        url,
        body: {
          'type': '625', // <-- Replace this with your actual type code
          'cid': '47157172',
          'cus_id': userId,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['error_msg'] == 'Deleted successfully') {
          await prefs.clear();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()), // replace with your login screen
                (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account deleted successfully.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Delete failed.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong: $e')),
      );
    }
  }



  void _showMyDialog(BuildContext context) {
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
                          width: 65,
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

  void showAccountInfoDialog(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name') ?? 'Guest';
    final mobile = prefs.getString('user_mobile') ?? 'N/A';
    final email = prefs.getString('user_email') ?? 'N/A';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'G';

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    "Account Info",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[100],
                    child: Text(initial, style: const TextStyle(fontSize: 24)),
                  ),
                  const SizedBox(height: 8),
                  Text(name, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Name"),
              subtitle: Text(name, style: TextStyle(color: Colors.grey[600])),
            ),
            ListTile(
              title: const Text("Mobile Number"),
              subtitle: Text(mobile, style: TextStyle(color: Colors.grey[600])),
            ),
            ListTile(
              title: const Text("Mail ID"),
              subtitle: Text(email, style: TextStyle(color: Colors.grey[600])),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }



  String? userName;
  String? userInitial;



  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? 'Guest';
      userInitial = userName!.isNotEmpty ? userName![0].toUpperCase() : 'G';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(
        width: MediaQuery.of(context).size.width, // Full width
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: Text(
                              userInitial ?? '',
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userName ?? '',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 4),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xffF0ECEC),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(menuItems[index]),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          if (menuItems[index] == "Account Info") {
                            showAccountInfoDialog(context);
                          }if (menuItems[index] == "Log out") {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Logout"),
                                content: Text("Are you sure you want to logout?"),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context), // Cancel
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final prefs = await SharedPreferences.getInstance();
                                      await prefs.clear(); // Clear all stored data

                                      Navigator.of(context).pop(); // Close dialog
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (_) => LoginScreen()), // Navigate to Login
                                            (route) => false, // Remove all previous routes
                                      );
                                    },
                                    child: Text("Logout", style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (menuItems[index] == "Delete Account") {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Delete Account"),
                                content: const Text("Are you sure you want to delete your account? This action cannot be undone."),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context), // Cancel
                                    child: const Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    onPressed: () {

                                      deleteAccount(context); // Call the delete API
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              ),
                            );
                          }

                          // Add other conditions for other items if needed
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color(0xff00558B),
        toolbarHeight: 60,
        leadingWidth: 200, // Increase the width
        leading: Builder(
          builder: (context) => Row(
            children: [
              if (!isGuest)
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              Expanded(
                child: Image.asset(
                  'assets/homelogo.png',
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CarouselSlider.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrls[index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                reverse: true,
                enlargeCenterPage: false,
                viewportFraction: 1.0,
                autoPlayInterval: const Duration(seconds: 3),
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: imageUrls.length,
              effect: ExpandingDotsEffect(
                activeDotColor: const Color(0xff00558B),
                dotColor: Colors.grey.shade300,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our Schemes",
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
              GridView.builder(
              shrinkWrap: true, // Prevent scrolling within the grid
              physics: const NeverScrollableScrollPhysics(),
                itemCount: showAllSchemes
                    ? imagePaths.length // Use imagePaths.length instead of schemes.length
                    : (imagePaths.length > 4 ? 4 : imagePaths.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 24.0,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                final scheme = schemes[index];

                return SizedBox(
                  width: 160,
                  height: 129,
                  child: Container(
                    height: 129,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff539094)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 12),
                        Container(
                          height: 17,
                          width: 98,
                          decoration: BoxDecoration(
                            color: const Color(0xff1A4886),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Center(
                            child: Text(
                              chitList[index]!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Members',
                                  style: GoogleFonts.inriaSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  scheme['members']!,
                                  style: GoogleFonts.lato(
                                    color: Color(0xff1A4886),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                              ],
                            ),
                            Container(
                              height: 30,
                              width: 1,
                              color: Colors.grey,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      'Duration',
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      scheme['duration']!,
                                      style: GoogleFonts.lato(
                                        color: Color(0xff1A4886),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),



                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Scheme(
                                    imagePath: scheme['image'] ?? '', // ✅ Use image path
                                    imageIndex: index,                // ✅ Pass the index here
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 24,
                              width: 85,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff1A4886),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  'View Plan',
                                  style: GoogleFonts.lato(
                                    color: const Color(0xff1A4886),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ) ,
            // Only show the "View More Plans" button and divider if there are more than 4 schemes
            if (schemes.length > 4)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showAllSchemes = !showAllSchemes;
                        });
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              color: const Color(0xff1A4886),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                showAllSchemes
                                    ? "View Less Plans"
                                    : "View More Plans",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff1A4886),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.asset(
                      'assets/frame.png',
                      height: 150,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'நம்பிக்கையுடன்\nசேமிக்கவும் –\nபாதுகாப்புடன் முதலீடு\nசெய்யவும்!',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(


                        children: [
                          Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavigationScreen(initialIndex: 1),
                                  ),
                                );
                              },
                              child: Text(
                                'View Plan',
                                style: GoogleFonts.lato(
                                  color: Color(0xff1A4886),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color(0xff00558B),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _showMyDialog(context);
                              },
                              child: Text(
                                'Enquiry Now',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 150,
              width: double.infinity,
              child: Row(children: [
                Container(
                  width: 100,
                  child: Image.asset('assets/logo.png'),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),

                Expanded(
                  child: Container(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                        Text('Why Choose Us?',style: GoogleFonts.lato(color: Colors.white,fontSize: 14),),
                        Text('✅ Govt Registered & Trusted',style: GoogleFonts.lato(color: Colors.white,fontSize: 12),),
                        Text('✅ Secure & Timely Payouts',style: GoogleFonts.lato(color: Colors.white,fontSize: 12),),
                        Text('✅ Wide Range of Plans',style: GoogleFonts.lato(color: Colors.white,fontSize: 12),),
                        Text('✅ Personalized Customer Support',style: GoogleFonts.lato(color: Colors.white,fontSize: 12),),
                        Text('✅ Flexible & Easy Payment Modes',style: GoogleFonts.lato(color: Colors.white,fontSize: 12),),

                      ],),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff1A4886),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                      )
                    ),
                  ),
                )
              ],),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff1A4886)
                ),
                borderRadius: BorderRadius.circular(12)
              ),
            )
          ],
        ),
      ),
    );
  }
}














