import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/spalshscreen.dart';
import 'package:flutter/material.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Sign Out"),
        onPressed: () {
          fAuth.signOut();
          Navigator.push(context,
              MaterialPageRoute(builder: (c) => const MySplashScreen()));
        },
      ),
    );
  }
}
