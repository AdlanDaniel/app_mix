import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:app_mix/app/modules/repositories/Models/User_model.dart';
import 'package:app_mix/app/modules/repositories/Models/adress_client.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    db.collection('usuários').doc(auth.currentUser!.uid).set(userModel.toMap());
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

      await auth.signOut();
      User? dadosUsuario2 = await isUserLoaded();
    } on FirebaseAuthException catch (e) {
      throw SignOutError();
    }
  }

  @override
  Future<User?> isUserLoaded() async {
    return auth.currentUser;
  }

  @override
  Future<void> registerClients(ClientsModel clientsModel) async {
    try {
      await db
          .collection('usuários')
          .doc(auth.currentUser!.uid)
          .collection('clientesCadastrados')
          .doc(clientsModel.idClient)
          .set(clientsModel.ToMap());
    } catch (e) {
      throw GenericError();
    }
  }

  @override
  String getIdClients() {
    try {
      String idClients = db.collection('clientesCadastrados').doc().id;
      return idClients;
    } catch (e) {
      throw GenericError();
    }
  }

  @override
  Future<AdressClient?> getAdressAPI(AdressClient adressClient) async {
    try {
      String? cepAPI = adressClient.cep;
      Uri url = Uri.parse('https://viacep.com.br/ws/${cepAPI}/json/');
      http.Response response;
      response = await http.get(url);
      // if (response.statusCode == 400) {
      //   throw FormatException();
      // }

      Map<String, dynamic> mapCepApi = jsonDecode(response.body);

      AdressClient adressClientAPI = AdressClient.fromMap(mapCepApi);

      return adressClientAPI;

      // print(mapCepApi);
      // print(mapCepApi.runtimeType);

      // print(adressClientAPI.bairro);

    } on FormatException catch (_) {
      throw CepImcomplete();
    } catch (e) {
      throw GenericError();
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> streamClients() {
    Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot = db
        .collection('usuários')
        .doc(auth.currentUser!.uid)
        .collection('clientesCadastrados')
        .snapshots();
    return querySnapshot;
  }

  @override
  Future<void> deleteClients(String id) async {
    try {
      db
          .collection('usuários')
          .doc(auth.currentUser!.uid)
          .collection('clientesCadastrados')
          .doc(id)
          .delete();
    } catch (e) {
      throw DeleteClientsError();
    }
    ;
  }
}

class CepImcomplete implements Exception {}

class UserNotFoundError implements Exception {}

class InvalidEmail implements Exception {}

class UserDiseable implements Exception {}

class WrongPassword implements Exception {}

class SignOutError implements Exception {}

class GenericError implements Exception {}

class DeleteClientsError implements Exception {}
