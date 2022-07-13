import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/widgets/buttons/image_button_widget.dart';

class SocialLoginButtons extends StatefulWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  State<SocialLoginButtons> createState() => _SocialLoginButtonsState();
}

class _SocialLoginButtonsState extends State<SocialLoginButtons> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 60,
          child: CustomImageButton(
            label: signinfacebook,
            data: facebookAsset,
            onPress: () {},
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          child: CustomImageButton(
            label: signingoogle,
            data: googleAsset,
            onPress: () {},
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        isLoading == true
            ? const CircularProgressIndicator()
            : Container(
                height: 60,
                child: CustomImageButton(
                  label: signinguest,
                  data: guestAsset,
                  onPress: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await FirebaseAuth.instance.signInAnonymously();
                    print('anonymus sucess');
                  },
                ),
              ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
