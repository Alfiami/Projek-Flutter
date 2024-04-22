import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class Profile {
  final String name;
  final String job;
  final String about;
  final String phoneNumber;
  final String instagram;
  final String email;

  Profile({
    required this.name,
    required this.job,
    required this.about,
    required this.phoneNumber,
    required this.instagram,
    required this.email,
  });
}

class ContactIcons extends StatelessWidget {
  final String phoneNumber;
  final String instagram;
  final String email;

  ContactIcons({
    required this.phoneNumber,
    required this.instagram,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.phone),
          onPressed: () {
            // Add phone button functionality here
          },
        ),
        IconButton(
          icon: Icon(Icons.email),
          onPressed: () {
            // Add email button functionality here
          },
        ),
        IconButton(
          icon: Icon(Icons.share), // Changed from camera icon to share icon
          onPressed: () {
            // Add share button functionality here
          },
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final Profile profile = Profile(
    name: 'Alfiami Sholihatun',
    job: 'STI202102373',
    about:
        'I am still learning about IT and exploring new things.',
    phoneNumber: '083866611621',
    instagram: '@alfiamii',
    email: 'alfiamisholihatun@gmail.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200, // Set the height of the header
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg.jpg'),
                  fit: BoxFit.cover, // Cover the whole area
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/profile.jpg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${profile.name} | ${profile.job}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            profile.about,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal Data',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Name'.padRight(40),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ': ${profile.name}',
                                ),
                                TextSpan(
                                  text: '\nAddress'.padRight(40),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ': Indonesia',
                                ),
                                TextSpan(
                                  text: '\nAge'.padRight(44),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ': 20',
                                ),
                                TextSpan(
                                  text: '\nGender'.padRight(41),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ': Female',
                                ),
                                TextSpan(
                                  text: '\nPhone Number'.padRight(33),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ': ${profile.phoneNumber}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ContactIcons(
                    phoneNumber: profile.phoneNumber,
                    instagram: profile.instagram,
                    email: profile.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(), // Use ProfileScreen as the home screen
    );
  }
}
