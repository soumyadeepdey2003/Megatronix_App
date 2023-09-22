import 'package:flutter/material.dart';
// import 'package:megatronix_app/Pages/About_Us.dart';
// import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        leading: Image.asset(
          'assets/mega1.png',
          width: 72,
          height: 72,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                'What Is Megatronix?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Megatronix, The Official Technical Club Of Meghnad Saha Institute Of Technology, Aims To Be A Platform To Cultivate Ideas And To Build Them Up In A Way That They Are Not Confined Within A Certain Limit. Megatronix Was Founded In 2009 By A Group Of Five Students As A Robotics Club In The College. That Group Of Five Is Now A Team Of Hundred! To Know More, Check Out Our Social Media Platforms.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
