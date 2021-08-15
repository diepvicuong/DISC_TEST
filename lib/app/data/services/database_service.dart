import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/res/constant.dart';
import 'package:get/get.dart';

final fireStore = FirebaseFirestore.instance;
final userRef = fireStore.collection('users');
final dataRef = fireStore.collection('data');
final managerRef = fireStore.collection('manager');
const managerId = "lPOc1OJeVghNtusEijMF";

class FirebaseDatabaseService {
  /// Login function
  Future<bool> registerUser(MyUser user) async {
    final batch = fireStore.batch(); // batchによる一括書き込み

    try {
      batch.set(
          userRef.doc(user.id),
          {
            'name': user.name,
            'age': user.age,
            'createdAt': FieldValue.serverTimestamp(),
            'phoneNumber': user.phoneNumber,
            'password': user.password,
          },
          SetOptions(merge: true));

      batch.set(
        managerRef.doc(user.phoneNumber),
        {'userId': user.id, 'password': user.password},
      );
      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<MyUser?> isExistUser(
      {required String phoneNumber, required String password}) async {
    try {
      final snapDoc = await managerRef.doc(phoneNumber).get();
      final userId = snapDoc['userId'];
      final userPassword = snapDoc['password'];
      if (password != userPassword) {
        return null;
      }
      final userDoc = await userRef.doc(userId).get();
      final user = MyUser.fromDoc(userDoc);
      await updateUserData(user);

      return user;
    } catch (err) {
      return null;
    }
  }

  Future<bool> checkPhoneNumberIsExist({required String phoneNumber}) async {
    try {
      final snapDoc = await managerRef.doc(phoneNumber).get();
      final String userId = snapDoc['userId'];

      if (userId.isNotEmpty) return true;
    } catch (err) {
      return false;
    }
    return false;
  }

  Future<void> updateUserData(MyUser user) async {
    final batch = fireStore.batch(); // batchによる一括書き込み

    try {
      batch.set(
          managerRef.doc(user.phoneNumber),
          {
            'loginCount': FieldValue.increment(1),
          },
          SetOptions(merge: true));

      await batch.commit();
    } catch (err) {
      print(err);
    }
  }

  /// Data function
  Future<void> updateScore({required MyUser user, required int score}) async {
    final batch = fireStore.batch();

    try {
      batch.set(
          userRef.doc(user.id).collection('scores').doc(),
          {
            'score': score,
            'createdAt': FieldValue.serverTimestamp(),
          },
          SetOptions(merge: true));

      await batch.commit();
    } catch (err) {}
  }
}
