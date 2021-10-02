import 'package:firebase_demo/signin_page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customDrawer extends StatelessWidget {
  const customDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () {
                  Get.to(() => SignInPage());
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'SignIn Google',
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),



            ],
          ),
        ),
      ),
    );
  }
}
