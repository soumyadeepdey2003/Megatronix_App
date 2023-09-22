import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: GoogleFonts.lato(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/bg4.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            color: const Color.fromRGBO(0, 0, 0, 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: GoogleFonts.pacifico(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: const Text('Get in Touch'),
                ),
                const SizedBox(height: 16.0),
                AnimatedDefaultTextStyle(
                  duration: const Duration(seconds: 1),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  child: const Text(
                    'Feel free to reach out to us for any inquiries or feedback. We\'re here to help!',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () async {
                    launchUrlString(
                      'tel:+918282866698',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    disabledForegroundColor: Colors.grey,
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child:
                      Text('Call Us', style: GoogleFonts.roboto(fontSize: 16)),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () async {
                    launchUrlString(
                      'mailto:deysoumyadeep70@gmail.com',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    disabledForegroundColor: Colors.grey,
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child:
                      Text('Email Us', style: GoogleFonts.roboto(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ContactButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
