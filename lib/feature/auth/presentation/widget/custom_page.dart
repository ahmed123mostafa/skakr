
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_app/core/helper/biometric_helper.dart';
import 'package:settings_app/feature/main/home/presentation/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final isAuthenticated = await BiometricHelper.authenticate(context);
          if (isAuthenticated) {
            ///////////////// //// // // أكشن بعد النجاح
          }
        },
        child: Center(
          child: Image.asset(
            'assets/images/image-removebg-preview.png',
            width: 80,
            height: 50,
          ),
        ),
      ),
    );
  }

  Future<void> _goToPrivatePage() async {
    if (!await BiometricHelper.isBiometricSupported()) {
      Fluttertoast.showToast(msg: "الجهاز لا يدعم البصمة.");
      return;
    }

    final availableBiometrics = await BiometricHelper.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      Fluttertoast.showToast(msg: "لا توجد بصمة مفعلة. يرجى تفعيلها.");
      return;
    }

    final bool didAuthenticate = await BiometricHelper.authenticate(context);
    if (didAuthenticate && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => HomeScreen()),
      );
    }
  }
}
