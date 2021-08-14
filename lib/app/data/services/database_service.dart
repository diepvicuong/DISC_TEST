import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disc_test/app/data/models/user/user.dart';
import 'package:disc_test/app/res/constant.dart';

final fireStore = FirebaseFirestore.instance;
final userRef = fireStore.collection('users');
final dataRef = fireStore.collection('data');
final managerRef = fireStore.collection('manager');
const managerId = "lPOc1OJeVghNtusEijMF";

class FirebaseDatabaseService {
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
          },
          SetOptions(merge: true));

      batch.set(
        managerRef.doc(user.phoneNumber),
        {'userId': user.id},
      );
      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<MyUser?> isExistUser({required String phoneNumber}) async {
    try {
      final snapDoc = await managerRef.doc(phoneNumber).get();
      final userId = snapDoc['userId'];
      final userDoc = await userRef.doc(userId).get();
      return MyUser.fromDoc(userDoc);
    } catch (err) {
      return null;
    }
  }
}
