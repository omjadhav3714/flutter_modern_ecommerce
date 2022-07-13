import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/auth/forgot_password_screen.dart';
import 'package:modern_ecommerce/screens/auth/register_screen.dart';
import 'package:modern_ecommerce/screens/auth/seller_login_screen.dart';
import 'package:modern_ecommerce/utils/scaffold_message_handler.dart';
import 'package:modern_ecommerce/utils/validation_functions.dart';
import 'package:modern_ecommerce/widgets/buttons/auth_button_widget.dart';
import 'package:modern_ecommerce/widgets/buttons/custom_icon_button_widget.dart';
import 'package:modern_ecommerce/widgets/custom_textfield_widget.dart';
import 'package:modern_ecommerce/static/social_login_buttons_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool isLoading = false;

  void signIn() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailCtrl.text, password: _passCtrl.text);

        _formKey.currentState!.reset();
        Navigator.pushReplacementNamed(context, homeR);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            isLoading = false;
          });
          MessageHandler.showSnackBar(_scaffoldKey, userNotFound);
        } else if (e.code == 'wrong-password') {
          setState(() {
            isLoading = false;
          });
          MessageHandler.showSnackBar(_scaffoldKey, wrongPass);
        }
      }
    } else {
      setState(() {
        isLoading = false;
      });
      MessageHandler.showSnackBar(_scaffoldKey, validAllFields);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(loginAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(),
              Container(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 130,
                ),
                child: const Text(
                  welcome,
                  style: TextStyle(
                    color: white,
                    fontSize: 33,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              CustomTextField(
                                hintTxt: email,
                                ctrl: _emailCtrl,
                                colorT: black,
                                validate: validateEmail,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                hintTxt: password,
                                ctrl: _passCtrl,
                                colorT: black,
                                validate: validatePassword,
                                obs: true,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: primaryColor,
                                      ),
                                    )
                                  : AuthButton(
                                      label: signin,
                                      color: black,
                                      onPress: () {
                                        signIn();
                                      },
                                    ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SocialLoginButtons(),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 60,
                                child: CustomIconButton(
                                  label: signinseller,
                                  data: Icons.store,
                                  size: 36,
                                  onPress: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SellerLoginScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      signup,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      forgotpass,
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
