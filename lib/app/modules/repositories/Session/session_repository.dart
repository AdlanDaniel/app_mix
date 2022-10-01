import 'package:app_mix/app/modules/repositories/Models/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SessionRepository {
  Future<void> registerUSer(UserModel userModel);
  Future<void>loginUser(UserModel userModel);
  Future<void> signOutUser();
  Future <User?> isUserLoaded();
}
