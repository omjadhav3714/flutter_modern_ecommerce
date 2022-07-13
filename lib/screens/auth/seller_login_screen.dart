import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/auth/forgot_password_screen.dart';
import 'package:modern_ecommerce/screens/auth/login_screen.dart';
import 'package:modern_ecommerce/screens/auth/seller_register_screen.dart';
import 'package:modern_ecommerce/utils/scaffold_message_handler.dart';
import 'package:modern_ecommerce/utils/validation_functions.dart';
import 'package:modern_ecommerce/widgets/buttons/auth_button_widget.dart';
import 'package:modern_ecommerce/widgets/buttons/custom_icon_button_widget.dart';
import 'package:modern_ecommerce/widgets/custom_textfield_widget.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  _SellerLoginScreenState createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
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
                  welcomeseller,
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
                              AuthButton(
                                label: signin,
                                color: black,
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('Validated');
                                  } else {
                                    MessageHandler.showSnackBar(
                                        _scaffoldKey, validAllFields);
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 60,
                                child: CustomIconButton(
                                  label: signinuser,
                                  data: Icons.person,
                                  size: 36,
                                  onPress: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SellerRegisterScreen(),
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
