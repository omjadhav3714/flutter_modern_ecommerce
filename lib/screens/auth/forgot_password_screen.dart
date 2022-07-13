import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/auth/login_screen.dart';
import 'package:modern_ecommerce/utils/scaffold_message_handler.dart';
import 'package:modern_ecommerce/utils/validation_functions.dart';
import 'package:modern_ecommerce/widgets/buttons/auth_button_widget.dart';
import 'package:modern_ecommerce/widgets/custom_textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(registerAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          backgroundColor: transparent,
          appBar: AppBar(
            backgroundColor: transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 30),
                child: const Text(
                  forgotpass,
                  style: TextStyle(
                    color: white,
                    fontSize: 33,
                  ),
                ),
              ),
              Form(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 35,
                            right: 35,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  hintTxt: email,
                                  ctrl: _emailCtrl,
                                  validate: validateEmail,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                AuthButton(
                                  label: forgotpass,
                                  onPress: () {
                                    if (_formKey.currentState!.validate()) {
                                      print('Validated');
                                    } else {
                                      MessageHandler.showSnackBar(
                                          _scaffoldKey, validAllFields);
                                    }
                                  },
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
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        signin,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
