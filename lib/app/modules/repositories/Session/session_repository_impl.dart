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
  Future <void> loginUser(UserModel userModel) async{
    await auth.signInWithEmailAndPassword(
        email: userModel.email!, password: userModel.password!);
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  _dataUser(UserModel userModel) {
    db.collection('Usuários').doc(auth.currentUser!.uid).set(userModel.toMap());
  }

  @override
  Future<void> registerUSer(UserModel userModel) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      _dataUser(userModel);
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<void> signOutUser() async {
    try {
      await auth.signOut();
    } catch (error) {
      throw Exception();
    }
  }
}
