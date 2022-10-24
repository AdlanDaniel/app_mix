import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListClientsController {
  SessionRepository repository;

  ListClientsController({required this.repository});

  Stream<QuerySnapshot<Map<String, dynamic>>> streamClients() {
    return repository.streamClients();
  }

  Future<void> deleteClients(context,idClient) async {
    try {
      await repository.deleteClients(idClient);
    } on DeleteClientsError {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao deletar cliente')));
    }
  }

  // getDocsClients() {
  //   try {
  //     repository.getDocsClients();
  //   } catch (e) {
  //     throw Exception();
  //   }
  // }
}
