import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: GoogleFonts.lato(
            // Apply the Lato font
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 215, 12, 70),
        leading: Transform.scale(
          scale: 2, // Increase the scale as needed to enlarge the logo
          child: Image.asset(
            'assets/mega1.png',
            width: 72,
            height: 72,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Upcoming Events',
                  style: GoogleFonts.lato(
                    // Apply the Lato font
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),
                const EventCard(
                  title: 'Orientation',
                  description:
                      'Every year, Megatronix organizes an Orientation program to introduce freshers to the innovative and creative official technical club of MSIT. At this event, members of the club showcase various projects created by themselves, so that the students may get inspired to venture further into the world of innovative technology and experience it all, with the help of Megatronix.',
                  imagePath: 'assets/orientation_event.jpeg',
                ),
                const EventCard(
                  title: 'Workshop',
                  description:
                      'Megatronix conducts Workshops every year for the students of MSIT, to provide hands on experience in various domains, including manual and autonomous robotics, civil, electrical, basic and advanced coding. These Workshops equip students with the necessary skills to build new technology from scratch and  even work on more complex projects in the future.',
                  imagePath: 'assets/workshop_event.jpeg',
                ),
                const EventCard(
                  title: 'TECH-X-TRA',
                  description:
                      'Tech Xtra is an Intra-College Tech Fest organized by Megatronix, exclusively for the 1st year students of MSIT. Tech Xtra encourages freshers to try their hand at various technical and non technical events and delve into the extraordinary world of technology. The skills and experience earned by the students at this event help them to get acquainted with various disciplines of engineering and development and further develop their own innovative ideas.',
                  imagePath: 'assets/techextra_event.jpeg',
                ),
                const EventCard(
                  title: 'Paridhi',
                  description:
                      'Paridhi is one of the largest tech fests in India. Hosted by MSIT, and organized by Megatronix, this annual inter-college tech fest attracts tech enthusiasts and competitive teams from all over the country. At Paridhi, the technological experience ranges from robotics to electrical, coding to civil and gaming to general events. Paridhi 2023 had been a huge success and we will come return with an even bigger and more exciting Paridhi next year!',
                  imagePath: 'assets/paradhi_event.jpeg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;

  const EventCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isHighlighted = true;
        });

        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            _isHighlighted = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform:
            _isHighlighted ? Matrix4.rotationZ(6.28319) : Matrix4.identity(),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(
              color: Color.fromARGB(255, 215, 12, 70), // Red border color
              width: 2.0, // Border width
            ),
          ),
          color: const Color.fromARGB(255, 59, 58, 67),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.lato(
                        // Apply the Lato font
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 241, 208, 218),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.description,
                      style: GoogleFonts.lato(
                        // Apply the Lato font
                        color: const Color.fromARGB(255, 241, 208, 218),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ), // Gray background color
        ),
      ),
    );
  }
}
