import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final Rxn<User> firebaseUser = Rxn<User>();
  final AuthService _authService = AuthService();

  @override
  void onInit() {
    firebaseUser.bindStream(FirebaseAuth.instance.authStateChanges());
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signIn(email, password);
      // User state will update automatically via authStateChanges stream
    } catch (e) {
      Get.snackbar('Sign In Error', e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
    } catch (e) {
      Get.snackbar('Sign Out Error', e.toString());
    }
  }

  bool get isLoggedIn => firebaseUser.value != null;
}
