import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_squadl/providers/login_provider.dart';
import 'package:task_squadl/widgets/load.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, _) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        Text('  with your phone number'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 24.0,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: TextField(
                        enabled: !loginProvider.loading,
                        controller: loginProvider.codeSent
                            ? loginProvider.otpController
                            : loginProvider.numberController,
                        maxLength: loginProvider.codeSent ? 6 : 10,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counter: const SizedBox(),
                          hintText:
                              loginProvider.codeSent ? 'OTP' : 'Mobile Number',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: loginProvider.loading
                          ? const Load()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(),
                                  borderRadius: BorderRadius.circular(
                                    6.0,
                                  ),
                                ),
                                side: const BorderSide(),
                              ),
                              onPressed: loginProvider.codeSent
                                  ? () {
                                      loginProvider.verifyOtp(context);
                                    }
                                  : () {
                                      loginProvider.signIn(context);
                                    },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  loginProvider.codeSent
                                      ? 'Verify OTP'
                                      : 'Send OTP',
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
