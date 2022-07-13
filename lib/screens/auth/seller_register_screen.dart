import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/auth/register_screen.dart';
import 'package:modern_ecommerce/screens/auth/seller_login_screen.dart';
import 'package:modern_ecommerce/utils/scaffold_message_handler.dart';
import 'package:modern_ecommerce/utils/validation_functions.dart';
import 'package:modern_ecommerce/widgets/buttons/auth_button_widget.dart';
import 'package:modern_ecommerce/widgets/buttons/custom_icon_button_widget.dart';
import 'package:modern_ecommerce/widgets/custom_textfield_widget.dart';

class SellerRegisterScreen extends StatefulWidget {
  const SellerRegisterScreen({Key? key}) : super(key: key);

  @override
  _SellerRegisterScreenState createState() => _SellerRegisterScreenState();
}

class _SellerRegisterScreenState extends State<SellerRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _passCtrl = TextEditingController();
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
                  createseller,
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
                        top: MediaQuery.of(context).size.height * 0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 35,
                            right: 35,
                          ),
                          child: Column(
                            children: [
                              CustomTextField(
                                hintTxt: name,
                                ctrl: _nameCtrl,
                                validate: validateText,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                hintTxt: email,
                                ctrl: _emailCtrl,
                                validate: validateEmail,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                hintTxt: password,
                                ctrl: _passCtrl,
                                validate: validatePassword,
                                obs: true,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              AuthButton(
                                label: signup,
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
                                  label: signupuser,
                                  data: Icons.person,
                                  size: 36,
                                  onPress: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
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
                                              const SellerLoginScreen(),
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
