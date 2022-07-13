import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/widgets/buttons/image_button_widget.dart';

class SocialLoginButtons extends StatefulWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  State<SocialLoginButtons> createState() => _SocialLoginButtonsState();
}

class _SocialLoginButtonsState extends State<SocialLoginButtons> {
  CollectionReference users =
      FirebaseFirestore.instance.collection(userCollection);
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImageButton(
          label: signinfacebook,
          data: facebookAsset,
          onPress: () {},
        ),
        CustomImageButton(
          label: signingoogle,
          data: googleAsset,
          onPress: () {},
        ),
        isLoading == true
            ? const CircularProgressIndicator(
                color: primaryColor,
              )
            : CustomImageButton(
                label: signinguest,
                data: guestAsset,
                onPress: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await FirebaseAuth.instance.signInAnonymously().whenComplete(
                    () async {
                      var _id = FirebaseAuth.instance.currentUser!.uid;
                      await users.doc(_id).set(
                        {
                          id: _id,
                          names: null,
                          emails: null,
                          profileImgC: null,
                          phone: null,
                          address: null,
                        },
                      );
                    },
                  );
                  // adding data in firebase firestore

                  Navigator.pushReplacementNamed(context, homeR);
                },
              ),
      ],
    );
  }
}
