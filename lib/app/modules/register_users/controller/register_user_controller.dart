import 'package:app_mix/app/modules/repositories/Models/User_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';

class RegisterUserController {
  SessionRepository repository;

  RegisterUserController({required this.repository});

  Future<void> registerUser(UserModel userModel) async {
    await repository.registerUSer(userModel);
  }
}
