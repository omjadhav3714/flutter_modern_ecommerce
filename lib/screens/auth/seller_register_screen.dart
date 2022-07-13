import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/auth/register_screen.dart';
import 'package:modern_ecommerce/screens/auth/seller_login_screen.dart';
import 'package:modern_ecommerce/utils/scaffold_message_handler.dart';
import 'package:modern_ecommerce/utils/validation_functions.dart';
import 'package:modern_ecommerce/widgets/buttons/auth_button_widget.dart';
import 'package:modern_ecommerce/widgets/buttons/custom_icon_button_widget.dart';
import 'package:modern_ecommerce/widgets/custom_image_picker_widget.dart';
import 'package:modern_ecommerce/widgets/custom_textfield_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SellerRegisterScreen extends StatefulWidget {
  const SellerRegisterScreen({Key? key}) : super(key: key);

  @override
  _SellerRegisterScreenState createState() => _SellerRegisterScreenState();
}

class _SellerRegisterScreenState extends State<SellerRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  late String sellerLogoImg;
  late String _id;
  bool isLoading = false;
  XFile? _imageFile;

  CollectionReference seller =
      FirebaseFirestore.instance.collection(sellerCollection);

  void _pickImageFromCamera() async {
    try {
      final pickImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = pickImage;
      });
    } catch (e) {
      setState(() {});
    }
  }

  void _pickImageFromGallery() async {
    try {
      final pickImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFile = pickImage;
      });
    } catch (e) {
      setState(() {});
    }
  }

  void sellerSignUp() async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailCtrl.text, password: _passCtrl.text);
          _id = FirebaseAuth.instance.currentUser!.uid;

          // upload profile pic to firebase storage
          firebase_storage.Reference ref =
              firebase_storage.FirebaseStorage.instance.ref('sellers/$_id.jpg');
          await ref.putFile(File(_imageFile!.path));
          sellerLogoImg = await ref.getDownloadURL();

          // adding data in firebase firestore
          seller.doc(_id).set({
            id: _id,
            sellerName: _nameCtrl.text,
            emails: _emailCtrl.text,
            sellerLogo: sellerLogoImg,
            phone: null,
            address: null,
            coverImg:''
          });

          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });

          Navigator.pushReplacementNamed(context, sellerHome);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'email-already-in-use') {
            setState(() {
              isLoading = false;
            });
            MessageHandler.showSnackBar(_scaffoldKey, alreadyEmail);
          }
        }
      } else {
        setState(() {
          isLoading = false;
        });
        MessageHandler.showSnackBar(_scaffoldKey, validImage);
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
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: primaryColor,
                                  backgroundImage: _imageFile == null
                                      ? null
                                      : FileImage(
                                          File(_imageFile!.path),
                                        ),
                                ),
                                CustomImagePickerWidget(
                                  pickCamera: _pickImageFromCamera,
                                  pickGallery: _pickImageFromGallery,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: primaryColor,
                                      ),
                                    )
                                  : AuthButton(
                                      label: signup,
                                      onPress: () {
                                        sellerSignUp();
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
