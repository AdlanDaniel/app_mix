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
  Future<void> loginUser(UserModel userModel) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
           User? dadosUsuario = await isUserLoaded();
      print(dadosUsuario);

    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          throw UserNotFoundError();
        case 'invalid-email':
          throw InvalidEmail();
        case 'user-disabled':
          throw UserDiseable();
        case 'wrong-password':
          throw WrongPassword();

        default:
          throw GenericError();
      }
    } catch (_) {
      throw GenericError();
    }
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
      User? dadosUsuario = await isUserLoaded();
      print(dadosUsuario);

      await auth.signOut();
      User? dadosUsuario2 = await isUserLoaded();
      print(dadosUsuario2);
      
    } on FirebaseAuthException catch (e) {
      throw SignOutError();
    }
  }

  @override
  Future<User?> isUserLoaded() async {
    return auth.currentUser;
  }
}

class UserNotFoundError implements Exception {}

class InvalidEmail implements Exception {}

class UserDiseable implements Exception {}

class WrongPassword implements Exception {}

class SignOutError implements Exception {}

class GenericError implements Exception {}
