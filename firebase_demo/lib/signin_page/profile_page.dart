import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signin_controller.dart';


class ProfilePage extends StatelessWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 10),
              CircleAvatar(
                backgroundImage: Image.network('').image,
                radius: 100,
              ),
              SizedBox(height: 10),
              Text('Name'),
              SizedBox(height: 10),
              Text('Email'),
            ],
          ),
        ),
      ),
    );
  }
}
