import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_controller.dart';


class SignInPage extends StatelessWidget {
  // const SignInPage({Key? key}) : super(key: key);
  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Obx(
          () => signInController.isLoggedIn.value/* != null*/
              ? profileScreen()
              : loginButton(),
        ),
      ),
    );
  }

  Widget loginButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        signInController.login();
        // GoogleSignIn().signIn();
        // Get.to(() => ProfilePage());
      },
      label: Text('SignIn with Google'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  Widget profileScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 10),
        CircleAvatar(
          backgroundImage: NetworkImage(signInController.googleAccount.value!.photoUrl ?? ""),
          radius: 100,
        ),
        SizedBox(height: 10),
        Text(
            signInController.googleAccount.value!.displayName!.isEmpty
                ? "Name"
                : signInController.googleAccount.value!.displayName!),
        SizedBox(height: 10),
        Text(signInController.googleAccount.value!.email.isEmpty
            ? "Email Id"
            :signInController.googleAccount.value!.email),
        SizedBox(height: 10),

        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {signInController.logout();},
        ),
      ],
    );
  }
}
