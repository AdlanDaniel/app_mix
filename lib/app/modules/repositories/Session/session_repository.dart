import 'package:app_mix/app/modules/repositories/Models/User_model.dart';

abstract class SessionRepository {
  registerUSer(UserModel userModel);
  loginUser(UserModel userModel);
}
