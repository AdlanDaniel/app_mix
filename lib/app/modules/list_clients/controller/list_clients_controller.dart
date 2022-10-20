import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListClientsController {
  SessionRepository repository;

  ListClientsController({required this.repository});

  Stream<QuerySnapshot<Map<String, dynamic>>> streamClients() {
    return repository.streamClients();
  }

  getDocsClients() {
    try {
      repository.getDocsClients();
    } catch (e) {
      throw Exception();
    }
  }
}
