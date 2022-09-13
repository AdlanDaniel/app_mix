import 'package:app_mix/app/modules/repositories/Models/User_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionRepositoryImpl implements SessionRepository {
  FirebaseAuth auth;
  FirebaseFirestore db;

  SessionRepositoryImpl({
    required this.auth,
    required this.db,
  });
  @override
  loginUser(UserModel userModel) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<void> registerUSer(UserModel userModel) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
    } catch (error) {
      throw Exception();
    }
  }
}
