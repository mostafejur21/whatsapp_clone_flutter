import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(error);

    return Center(
      child: Text(error),
    );
  }
}
