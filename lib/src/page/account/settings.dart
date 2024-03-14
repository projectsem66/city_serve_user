
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Settingss extends StatefulWidget {
  // const Settings({super.key});

  @override
  State<Settingss> createState() => _SettingssState();
}

class _SettingssState extends State<Settingss> {
  void deleteUser() async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      await user.delete();
      print("User deleted successfully");
    } catch (e) {
      print("Failed to delete user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
