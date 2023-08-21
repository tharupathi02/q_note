import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:q_note/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:q_note/src/features/core/screens/dashboard/dashboard.dart';
import 'package:q_note/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class AuthenticationRepository extends GetxController {
  /// This is the constructor of the class AuthenticationRepository
  static AuthenticationRepository get instance => Get.find();

  /// Variables for Firebase Authentication and Rx
  /// Rx is used to listen to changes in the firebaseUser variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  /// Overridden Methods : This method will be executed when the class is initialized
  /// This method uses the ever method from GetX to listen to changes in the firebaseUser variable
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  /// Methods : Set the initial screen based on the user
  /// If the user is null then the WelcomeScreen will be displayed else the Dashboard will be displayed
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const OnBoardingScreen()) : Get.offAll(() => const Dashboard());
  }

  /// Methods : Create a new user account with email and password | Future means that this method will be executed in the future
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      CustomSnackBarWidget.showGetSnackBar('Welcome to $kAppName.', 'Your account has been created successfully and authenticated. We wish you a great experience with $kAppName.');
      firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.offAll(() => const OnBoardingScreen());
    } on FirebaseAuthException catch (e) {
      final exception = SignUpWithEmailAndPasswordFailure.code(e.code);
      CustomSnackBarWidget.showGetSnackBar('Error in Sign-Up', exception.message);
      throw exception;
    } catch (_) {
      final exception = SignUpWithEmailAndPasswordFailure();
      CustomSnackBarWidget.showGetSnackBar('Error in Sign-Up', exception.message);
      throw exception;
    }
  }

  /// Methods : Sign in with email and password | Future means that this method will be executed in the future
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      CustomSnackBarWidget.showGetSnackBar('Welcome Back!', 'Welcome Back to $kAppName. Start writing your notes you have missed.');
      firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final exception = SignUpWithEmailAndPasswordFailure.code(e.code);
      CustomSnackBarWidget.showGetSnackBar('Error in Log-in', exception.message);
      throw exception;
    } catch (_) {
      final exception = SignUpWithEmailAndPasswordFailure();
      CustomSnackBarWidget.showGetSnackBar('Error in Log-in', exception.message);
      throw exception;
    }
  }

  /// Methods : Sign out | Future means that this method will be executed in the future
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      final exception = SignUpWithEmailAndPasswordFailure.code(e.code);
      CustomSnackBarWidget.showGetSnackBar('Error in Sign-Out', exception.message);
      throw exception;
    } catch (_) {
      final exception = SignUpWithEmailAndPasswordFailure();
      CustomSnackBarWidget.showGetSnackBar('Error in Sign-Out', exception.message);
      throw exception;
    }
  }

}