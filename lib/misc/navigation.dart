import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:megatronix_app_11/Pages/AllPages.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> pages = [
    const HomePage(),
    const EventPage(),
    const ContactUsPage(),
    const GalleryPage(),
    const TeamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Allows more than 3 items
        backgroundColor: const Color.fromARGB(255, 59, 58, 67),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 233, 230, 230),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        currentIndex: currentPageIndex,
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(Icons.home_outlined),
            activeIcon: FaIcon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.event_available_outlined),
            activeIcon: FaIcon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.contact_page_outlined),
            activeIcon: FaIcon(Icons.contact_page),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.photoFilm),
            activeIcon: FaIcon(Icons.collections),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.peopleGroup),
            activeIcon: FaIcon(Icons.people),
            label: 'Team',
          ),
        ],
        selectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 215, 12, 70), // Indicator color
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
