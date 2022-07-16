import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/utils/category_list.dart';
import 'package:modern_ecommerce/utils/scaffold_message_handler.dart';
import 'package:modern_ecommerce/utils/validation_functions.dart';
import 'package:modern_ecommerce/widgets/custom_textfield_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({Key? key}) : super(key: key);

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController();
  final TextEditingController productNameCtrl = TextEditingController();
  final TextEditingController productDescCtrl = TextEditingController();
  final TextEditingController productDisCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  String mainCategory = 'men';
  String subCategoryValue = subCategoryS;
  List<String> subCategory = [];
  List<String> upoloadImageUrls = [];
  List<XFile>? _imageFiles = [];
  bool isLoading = false;
  CollectionReference products =
      FirebaseFirestore.instance.collection(productsCollection);
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void _pickMultiImage() async {
    try {
      final pickImage = await ImagePicker().pickMultiImage(
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        _imageFiles = pickImage;
      });
    } catch (e) {
      setState(() {});
    }
  }

  Widget previewImage() {
    if (_imageFiles!.isNotEmpty) {
      return ListView.builder(
        itemCount: _imageFiles!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.file(
            File(_imageFiles![index].path),
          );
        },
      );
    } else {
      return const Text(noPick);
    }
  }

  void uploadProduct() async {
    if (subCategoryValue != subCategoryS) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (_imageFiles!.isNotEmpty) {
          String pid = getRandomString(16);
          setState(() {
            isLoading = true;
          });
          try {
            for (var image in _imageFiles!) {
              firebase_storage.Reference ref = firebase_storage
                  .FirebaseStorage.instance
                  .ref('produts/${path.basename(image.path)}.jpg');
              await ref.putFile(File(image.path)).whenComplete(() async {
                await ref.getDownloadURL().then((value) {
                  upoloadImageUrls.add(value);
                });
              });
            }

            products.doc(pid).set({
              'pid': pid,
              'images': upoloadImageUrls,
              'sub-category': subCategoryValue,
              'category': mainCategory,
              'price': int.parse(priceCtrl.text),
              'quantity': int.parse(quantityCtrl.text),
              'name': productNameCtrl.text,
              'desc': productDescCtrl.text,
              'seller-id': FirebaseAuth.instance.currentUser!.uid,
              'discount': int.parse(productDisCtrl.text),
            }).then((value) {
              setState(() {
                isLoading = false;
                _imageFiles = [];
                priceCtrl.clear();
                quantityCtrl.clear();
                productNameCtrl.clear();
                productDescCtrl.clear();
                productDisCtrl.clear();
                mainCategory = 'men';
                subCategoryValue = subCategoryS;
              });
            });
          } catch (e) {
            MessageHandler.showSnackBar(_scaffoldKey, uploadImgFailed);
          }
        } else {
          MessageHandler.showSnackBar(_scaffoldKey, imgFailed);
        }
      } else {
        MessageHandler.showSnackBar(_scaffoldKey, validAllFields);
      }
    } else {
      MessageHandler.showSnackBar(_scaffoldKey, selectCategories);
    }
  }

  void selectMainCategory(String? value) {
    switch (value) {
      case 'men':
        subCategory = menL;
        break;
      case 'women':
        subCategory = womenL;
        break;
      case 'kids':
        subCategory = kidsL;
        break;
      case 'shoes':
        subCategory = shoesL;
        break;
      case 'bags':
        subCategory = bagsL;
        break;
      case 'mobile':
        subCategory = mobileL;
        break;
      case 'gaming':
        subCategory = gamingL;
        break;
      case 'electronics':
        subCategory = electronicsL;
        break;
      case 'pc':
        subCategory = pcL;
        break;
      case 'accessories':
        subCategory = accessoriesL;
        break;
      default:
        subCategory = [];
        break;
    }
    setState(() {
      mainCategory = value!;
      subCategoryValue = subCategoryS;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    color: greyLight,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Center(
                      child: previewImage(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1.0,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Text(selectMCategory),
                                    DropdownButton(
                                      value: mainCategory,
                                      items: mainCat
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem(
                                            child: Text(value), value: value);
                                      }).toList(),
                                      onChanged: (String? value) {
                                        selectMainCategory(value);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Text(selectSCategory),
                                    DropdownButton(
                                      disabledHint: const Text(
                                        selectMCategory,
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      value: subCategoryValue,
                                      items: subCategory
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem(
                                            child: Text(value), value: value);
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          subCategoryValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                          ctrl: priceCtrl,
                          hintTxt: priceP,
                          validate: validateText,
                          colorT: black,
                          txtType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          ctrl: quantityCtrl,
                          hintTxt: quantityP,
                          validate: validateText,
                          colorT: black,
                          txtType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          ctrl: productDisCtrl,
                          hintTxt: productDiscP,
                          validate: validateText,
                          colorT: black,
                          txtType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          ctrl: productNameCtrl,
                          hintTxt: productNameP,
                          validate: validateText,
                          colorT: black,
                          txtType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          ctrl: productDescCtrl,
                          hintTxt: productDescP,
                          validate: validateText,
                          colorT: black,
                          txtType: TextInputType.multiline,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: primaryColor,
                child: IconButton(
                  onPressed: _imageFiles!.isEmpty
                      ? () {
                          _pickMultiImage();
                        }
                      : () {
                          setState(() {
                            _imageFiles = [];
                          });
                        },
                  icon: Icon(
                    _imageFiles!.isEmpty ? Icons.image : Icons.delete_forever,
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: primaryColor,
              child: IconButton(
                onPressed: isLoading
                    ? null
                    : () {
                        uploadProduct();
                      },
                icon: isLoading
                    ? const CircularProgressIndicator(
                        color: white,
                      )
                    : const Icon(
                        Icons.upload,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
