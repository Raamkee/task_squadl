import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_squadl/models/user_model.dart';
import 'package:task_squadl/providers/app_provider.dart';
import 'package:task_squadl/screens/home_page_screen.dart';
import 'package:task_squadl/screens/login_screen.dart';
import 'package:task_squadl/services/navigation_services.dart';

class LoginProvider with ChangeNotifier {
  late AppProvider appProvider;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  late String verificationId;
  late UserModel userModel;
  bool loading = false;
  bool codeSent = false;
  bool loggingOut = false;
  bool isAdmin = false;

  User? _user;

  void loginCheck(context) async {
    _auth.authStateChanges().listen((event) async {
      _user = event;
      loginNavigation(context, event);
    });
    return;
  }

  void loginNavigation(context, User? user) async {
    if (user != null) {
      DocumentSnapshot _doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();
      if (_doc.exists) {
        userModel = UserModel.fromJson(_doc.data() as Map<String, dynamic>);
        Provider.of<LoginProvider>(context, listen: false).isAdmin =
            (((await FirebaseFirestore.instance
                        .collection('config')
                        .doc('admins')
                        .get())
                    .data() as Map<String, dynamic>)['admins'])
                .toList()
                .contains(userModel.phone);
      }

      NavigationServices.replaceScreen(context, const HomePageScreen());
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        NavigationServices.replaceScreen(
          context,
          const LoginScreen(),
        );
      });
    }
  }

  void signIn(BuildContext context) async {
    appProvider = Provider.of<AppProvider>(context, listen: false);
    loading = true;
    notifyListeners();
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + numberController.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loading = false;
        codeSent = false;
        notifyListeners();
        appProvider.showSnackBar(
          context,
          text: e.code,
          icon: Icons.error,
        );
        if (e.code == 'invalid-phone-number') {}
      },
      codeAutoRetrievalTimeout: (String verificationId) async {},
      codeSent: (String verificationId, int? resendToken) async {
        numberController.clear();

        loading = false;

        codeSent = true;
        this.verificationId = verificationId;
        notifyListeners();
      },
    );
  }

  User? get user => _user;

  verifyOtp(context) async {
    loading = true;
    notifyListeners();
    appProvider = Provider.of<AppProvider>(context, listen: false);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text.trim(),
      );

      UserCredential userCred = await _auth.signInWithCredential(credential);
      otpController.clear();

      if (userCred.user != null) {
        loading = false;
        codeSent = false;

        NavigationServices.replaceScreen(context, const HomePageScreen());
      } else {
        loading = false;
        codeSent = false;
        notifyListeners();
        appProvider.showSnackBar(
          context,
          text: 'User not found',
          icon: Icons.error,
        );
      }
    } catch (e) {
      loading = false;
      codeSent = false;
      notifyListeners();
      appProvider.showSnackBar(
        context,
        text: e.toString(),
        icon: Icons.error,
      );
    }
  }
}
