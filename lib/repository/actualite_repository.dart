import 'dart:convert';

import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/repository.dart';
import 'package:http/http.dart' as http;

class ActualiteRepository extends IRepositoryApi {
  Future<List<Actualite>> findAll(int page) async {
    final response = await http.get(
      serverName + 'actualite?page=$page',
      headers: headers,
    );

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      return null;
    }

    final data = jsonDecode(response.body);
    List<dynamic> actualitesJson = data['data'];

    //List<Actualite> actualites = [];
    final serverNameForImage =
        serverName.substring(0, 27) + 'storage/actialites/';

    /* for (var i = 0; i < actualitesJson.length; i++) {
      var actu = Actualite.fromJson(actualitesJson.elementAt(i));
      actualites.add(actu.copyWith(image: serverNameForImage + actu.image));
    }
*/
    final actualites = actualitesJson.map((actualiteJson) {
      var actu = Actualite.fromJson(actualiteJson);
      return actu.copyWith(image: serverNameForImage + actu.image);
    }).toList();
    return actualites;
  }
}
