import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  RxBool isLoggedIn = false.obs;

  login() async {
    print('Start This Method');
    print('P1');
    googleAccount.value = await _googleSignIn.signIn();

    print('P2');
    String userId = googleAccount.value!.id;
    print('userId : $userId');

    print('P3');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    print('userId :: ${prefs.getString('userId')}');
    isLoggedIn(true);
  }

  logout() async {
    googleAccount.value = await _googleSignIn.signOut();
    isLoggedIn(false);
  }
}