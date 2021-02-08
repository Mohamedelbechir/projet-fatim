import 'dart:convert';

import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/repository.dart';
import 'package:http/http.dart' as http;

class DemandeRepository extends IRepositoryApi {
  Future<DemandeListing> save(DemandeInput demandeInput) async {
    final response = await http.post(
      serverName + 'ajoutDemande',
      headers: await headersAuth,
      body: jsonEncode(demandeInput.toJson()),
    );
    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }
    final data = jsonDecode(response.body).first;
    final demande = DemandeListing.fromJson(data);
    return demande;
  }

  Future<List<DemandeListing>> findAll() async {
    final response = await http.get(
      serverName + 'demande',
      headers:
          await headersAuth, // on recupere le token stoken sur le téléphone
    );

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }

    List<dynamic> data = jsonDecode(response.body);

    final demandes =
        data.map((demande) => DemandeListing.fromJson(demande)).toList();
    return demandes;
  }

  Future<List<Service>> findAllService() async {
    final response = await http.get(
      serverName + 'services',
      headers:
          await headersAuth, // on recupere le token stoken sur le téléphone
    );
    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }
    List<dynamic> data = jsonDecode(response.body);
    final services = data.map((s) => Service.fromJson(s)).toList();
    return services;
  }
}
