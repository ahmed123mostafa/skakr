import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
class BiometricHelper {
  static final LocalAuthentication _auth = LocalAuthentication();


  static Future<bool> isBiometricSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }


  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  static Future<bool> authenticate(BuildContext context) async {
    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'يرجى استخدام المصادقة الحيوية للمتابعة',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (!didAuthenticate && context.mounted) {
        _showFailureDialog(context);
      }

      return didAuthenticate;
    } on Exception {
      if (context.mounted) {
        Fluttertoast.showToast(
          msg: "فشل التحقق بالبصمة، حاول مرة أخرى!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      return false;
    }
  }

 
  static void _showFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('فشل التحقق'),
        content: const Text('لم يتم التحقق من هويتك باستخدام المصادقة الحيوية.'),
        actions: [
          TextButton(
            child: const Text('حسنًا'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}