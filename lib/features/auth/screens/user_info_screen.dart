import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

import '../../../common/utlis/utlis.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  static const routeName = '/user-info-screen';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserinfo() async {
    String name = nameController.text.trim();
    if(name.isNotEmpty){
      ref.read(authControllerProvider).saveUserDataToFirebase(context, name, image);
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image == null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/527/527489.png?w=1060&t=st=1685129936~exp=1685130536~hmac=3fa58f255223139b824223118efc5bd4d042615001e628dba0253bb6566c8b32"),
                          radius: 65,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(
                            image!,
                          ),
                          radius: 65,
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Name',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: storeUserinfo,
                    icon: const Icon(Icons.done),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
