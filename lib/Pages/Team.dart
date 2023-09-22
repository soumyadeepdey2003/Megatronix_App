import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:megatronix_app_11/models/members.dart';
import 'package:megatronix_app_11/misc/data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    teamMembers.sort((a, b) {
      if (a.year == b.year) {
        return a.name.compareTo(b.name); // Sort alphabetically if same year
      }
      return b.year.compareTo(a.year); // Sort by year in descending order
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Team',
            style: GoogleFonts.roboto(
              fontSize: 24,
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
        body: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[900]!, Colors.blue[600]!],
            ),
          ),
          child: ListView.builder(
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              return TeamMemberCard(member: teamMembers[index]);
            },
          ),
        ));
  }
}

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  const TeamMemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(
            color: Color.fromARGB(255, 215, 12, 70),
            width: 2.0,
          ),
        ),
        child: Container(
            color: const Color.fromARGB(255, 59, 58, 67),
            child: Column(children: [
              const SizedBox(height: 16.0),
              ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(255, 215, 12, 70),
                  child: Image.asset(member.imageUrl,
                      cacheHeight: 360, cacheWidth: 360, fit: BoxFit.cover),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(member.name,
                          style: GoogleFonts.roboto(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 241, 208, 218))),
                      const SizedBox(height: 8.0),
                      Text(member.year,
                          style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              color: const Color.fromARGB(255, 241, 208, 218))),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: Color.fromARGB(255, 241, 208, 218),
                            ),
                            onPressed: () {
                              launchUrlString(member.linkedinUrl);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              color: Color.fromARGB(255, 241, 208, 218),
                            ),
                            onPressed: () {
                              launchUrlString(member.facebookUrl);
                            },
                          ),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Color.fromARGB(255, 241, 208, 218),
                            ),
                            onPressed: () {
                              launchUrlString(member.instagramUrl);
                            },
                          ),
                        ],
                      ),
                    ],
                  ))
            ])));
  }
}
