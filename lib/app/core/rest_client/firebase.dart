import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  static FirebaseAuth auth() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth;
  }

  static FirebaseFirestore db() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db;
  }
}
