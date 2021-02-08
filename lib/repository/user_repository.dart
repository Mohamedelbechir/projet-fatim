import 'dart:convert';

import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/repository.dart';
import 'package:http/http.dart' as http;

class UserRepository extends IRepositoryApi {
  final _keyProfil = 'key_profil';

  Future<String> login(User user) async {
    final response = await http.post(
      serverName + 'login',
      body: jsonEncode(user.toJson()),
      headers: headers,
    );

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return '';
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    final token = data['success']['token'] as String;
    return token;
  }

  /*Future<User> getUser() async {
    
    Map<String, String> userJson = await storage.readAll();
    //final user = User.fromJson(userJson);
    return null;
  }

  Future<User> saveProfil(User user) async {
    final userJson = user.toJson();
    userJson.keys.forEach((k) async {
      await storage.write(key: k, value: userJson[k].toString());
    });
  }*/
  Future<UserProfil> getProfil() async {
    final response = await http.get(
      serverName + 'profils',
      headers: await headersAuth,
    );

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    final user = UserProfil.fromJson(data['success'].first);
    return user;
  }

  Future<bool> updateProfil(UserProfil userProfil) async {
    final response = await http.post(
      serverName + 'modifierProfil',
      body: jsonEncode(userProfil.toJson()),
      headers: await headersAuth,
    );

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    final val = data['success'] as int;
    return val == 1;
  }

  Future<bool> resetPassword(String ancien, String nouveau) async {
    final response = await http.post(
      serverName + 'modifierPassword',
      body:
          jsonEncode(<String, dynamic>{'ancien': ancien, 'nouveau': nouveau}),
      headers: await headersAuth,
    );

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    final val = data['success'] as int;
    return val == 1;
  }
}
