// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';

// ignore: camel_case_types
class CustomOkDialog extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function? onPressed;

  const CustomOkDialog({this.icon, this.title, this.subtitle, this.onPressed});

  @override
  _CustomOkDialogState createState() => _CustomOkDialogState();
}

// ignore: camel_case_types
class _CustomOkDialogState extends State<CustomOkDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    widget.title ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.subtitle ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ignore: deprecated_member_use
                      ElevatedButton(
                        child: const Text(
                          ok,
                          style: TextStyle(color: white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.onPressed!();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -60,
          child: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 60,
            child: Icon(
              widget.icon,
              size: 70,
              color: white,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class CustomConfirmDialog extends StatefulWidget {
  final void Function()? onYesPressed;
  final String? title;
  final String? subtitle;
  final IconData? icon;

  const CustomConfirmDialog(
      {this.title, this.subtitle, this.icon, this.onYesPressed});

  @override
  _CustomConfirmDialogState createState() => _CustomConfirmDialogState();
}

// ignore: camel_case_types
class _CustomConfirmDialogState extends State<CustomConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
            child: Column(
              children: [
                Text(
                  widget.title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.subtitle ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ignore: deprecated_member_use
                    ElevatedButton(
                      child: const Text(
                        yes,
                        style: TextStyle(color: white),
                      ),
                      onPressed: widget.onYesPressed,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    // ignore: deprecated_member_use
                    ElevatedButton(
                      child: const Text(
                        no,
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -60,
          child: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 60,
            child: Icon(
              widget.icon,
              size: 70,
              color: white,
            ),
          ),
        ),
      ],
    );
  }
}
