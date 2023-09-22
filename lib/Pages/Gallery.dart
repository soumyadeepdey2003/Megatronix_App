import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Megatronix Gallery',
          style: GoogleFonts.roboto(
            fontSize: 24, // Adjust font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 215, 12, 70),
        leading: Transform.scale(
          scale: 2,
          child: Image.asset(
            'assets/mega1.png',
            width: 72,
            height: 72,
          ),
        ),
      ),
      body: const Stack(
        children: [GalleryGrid()],
      ),
    );
  }
}

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/bg1.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            MasonryGridView.builder(
              itemCount: 16,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EnlargedImageScreen(
                        imagePath: 'assets/g${index + 1}.jpeg',
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'image$index',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/g${index + 1}.jpeg'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EnlargedImageScreen extends StatelessWidget {
  final String imagePath;

  const EnlargedImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the app bar behind the body
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the app bar shadow
        leading: const BackButton(
          // Customize the back button
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          // Background with glass effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/bg1.jpg'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.2), // Adjust opacity as needed
            ),
          ),

          // Enlarged Image
          Center(
            child: Hero(
              tag:
                  'image${imagePath.hashCode}', // Ensure a unique tag for each image
              child: Image.asset(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}
