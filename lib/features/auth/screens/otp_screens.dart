// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

import '../../../colors.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = '/otp-screen';
  final String varificationId;
  const OTPScreen({
    Key? key,
    required this.varificationId,
  }) : super(key: key);

  void verifyOPT(WidgetRef ref, BuildContext context, String userOPT) {
    ref.read(authControllerProvider).verifyOPT(
          context,
          varificationId,
          userOPT,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verify your phone number'),
          elevation: 0,
          backgroundColor: backgroundColor,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Enter 6-digit OTP code'),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '- - - - - -',
                    hintStyle: TextStyle(fontSize: 30),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if(val.length == 6){
                      verifyOPT(ref, context, val.trim());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
