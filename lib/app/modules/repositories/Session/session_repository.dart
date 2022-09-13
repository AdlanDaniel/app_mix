import 'package:app_mix/app/modules/repositories/Models/User_model.dart';

abstract class SessionRepository {
  Future<void> registerUSer(UserModel userModel);
  loginUser(UserModel userModel);
}
