import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  ConfirmationResult? webConfirmationResult;
  String? _verificationId;

  Future<void> verifyWebPhoneNumber({required String phoneNumber}) async {
    ConfirmationResult confirmationResult =
        await _auth.signInWithPhoneNumber(phoneNumber);

    print('Send Otp success');
    webConfirmationResult = confirmationResult;
  }

  Future<User?> confirmCodeWeb({required String smsOtp}) async {
    if (webConfirmationResult != null) {
      try {
        final userCredential = await webConfirmationResult?.confirm(smsOtp);
        return userCredential?.user;
      } catch (e) {
        print(e);
        return null;
      }
    } else {
      print('Please input sms code received after verifying phone number');
    }

    return null;
  }

  // Example code of how to verify phone number
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      print(
          'Phone number automatically verified and user signed in: $phoneAuthCredential');
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print('Failed to Verify Phone Number: $e');
    }
  }

  // Example code of how to sign in with phone.
  Future<User?> signInWithPhoneNumber({required String smsOtp}) async {
    try {
      print('Signin');
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId ?? '',
        smsCode: smsOtp,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;
      print('User: ${user?.uid}');

      print('Successfully signed in UID: ${user?.uid}');

      return user;
    } catch (e) {
      print(e);
      print('Failed to sign in');

      return null;
    }
  }
}
