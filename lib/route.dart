import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screens.dart';
import 'package:whatsapp_ui/features/auth/screens/user_info_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final varificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          varificationId: varificationId,
        ),
      );
    case UserInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInfoScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
              body: ErrorScreen(error: 'This page does not exist')));
  }
}
