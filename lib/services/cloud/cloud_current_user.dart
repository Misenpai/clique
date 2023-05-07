// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

late String userName;

String getUserName() {
  User? user = _auth.currentUser;
  if (user != null) {
    _firestore.collection('users').doc(user.uid).get().then((doc) {
      if (doc.exists) {
        userName = doc.data()!['name'];
        // print('Current user name: $userName');
      } else {
        print('No such document!');
      }
    });
  } else {
    print('User not signed in');
  }
  return userName;
}
