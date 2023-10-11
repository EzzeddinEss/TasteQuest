import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tastequest/models/user_model.dart';
import 'package:tastequest/services/database/firestore_user.dart';
import 'package:tastequest/views/control_view.dart';
import 'package:tastequest/views/dashboard/home_page.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['Email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String email = '';
  String password = '';
  String name = '';

  Rxn<User> _user = Rxn<User>();
  dynamic get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  /// Signs in the user using Google Sign-In.
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      // await FirestoreUser().addUserToFirestore(UserModel(
      //     userId: user.user!.uid,
      //     email: user.user!.email,
      //     name: name == null ? user.user!.displayName : name,
      //     pic: ''));
      saveUser(user);
      Get.offAll(() => ControlView(),
          transition: Transition.leftToRightWithFade);
    });
  }

  /// Validates the email field.
  String? validateEmail(String? value) {
    if (value == null || !GetUtils.isEmail(value)) {
      return "Please provide a valid email";
    }
    return null;
  }

  /// Validates the password field.
  String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return "Password should be at least 8 characters long";
    }
    return null;
  }

  /// Checks login credentials and performs appropriate actions.
  void checkLogin() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  /// Signs in the user with email and password.
  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
      });
      Get.offAll(() => ControlView(), transition: Transition.fadeIn);
    } catch (e) {
      checkLogin();
    }
  }

  /// Creates a user with email and password and adds the user to Firestore.
  void createUserInWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(() => ControlView(),
          transition: Transition.leftToRightWithFade);
    } catch (e) {
      checkLogin();
    }
  }

  void saveUser(UserCredential userCredential) async {
    UserModel userModel = UserModel(
      userId: userCredential.user!.email,
      email: userCredential.user!.email,
      name: name,
      pic: '',
    );
    await FirestoreUser().addUserToFirestore(userModel);
  }
}
