import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/pallet_colors.dart';
import '../image/image_list_screen.dart';
import '../initial/initial_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';
import '../video/video_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of pages to be displayed in the Bottom Nav Bar
  List<Widget> pages = [
    const InitialScreen(),
    const ImageListScreen(),
    VideoListScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000), // Start color
                  Color(0xFF333333), // Middle color
                  Color(0xFF666666), // End color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BottomNavigationBar(
              elevation: 4,
              backgroundColor: Colors.black54,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Pallete.primary,
              unselectedItemColor: Colors.teal.shade600,
              type: BottomNavigationBarType.fixed,
              items: const [
                // Bottom Nav Items, icons, and styles
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home_outlined, size: 32,),
                  activeIcon: Icon(Icons.home_outlined, size: 36,),
                ),
                BottomNavigationBarItem(
                  label: "Images",
                  icon: Icon(Icons.image_outlined, size: 32,),
                  activeIcon: Icon(Icons.image_outlined, size: 36,),
                ),
                BottomNavigationBarItem(
                  label: "Vídeos",
                  icon: Icon(Icons.video_camera_back_outlined, size: 32,),
                  activeIcon: Icon(Icons.video_camera_back_outlined, size: 36,),
                ),
                BottomNavigationBarItem(
                  label: "Curiosidade",
                  icon: Icon(Icons.local_library_outlined, size: 32,),
                  activeIcon: Icon(Icons.local_library_outlined, size: 36,),
                ),
                BottomNavigationBarItem(
                  label: "Send",
                  icon: Icon(Icons.send_outlined, size: 32,),
                  activeIcon: Icon(Icons.send_outlined, size: 36,),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),

          );
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}
