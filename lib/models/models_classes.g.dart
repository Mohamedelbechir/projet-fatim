// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$_UserProfil _$_$_UserProfilFromJson(Map<String, dynamic> json) {
  return _$_UserProfil(
    nom: json['nom'] as String,
    prenom: json['prenom'] as String,
    telephone: json['telephone'] as int,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$_$_UserProfilToJson(_$_UserProfil instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'prenom': instance.prenom,
      'telephone': instance.telephone,
      'email': instance.email,
    };

_$_Actualite _$_$_ActualiteFromJson(Map<String, dynamic> json) {
  return _$_Actualite(
    id: json['id'] as int,
    titre: json['titre'] as String,
    description: json['description'] as String,
    image: json['image'] as String,
    dateDebut: json['dateDebut'] == null
        ? null
        : DateTime.parse(json['dateDebut'] as String),
    dateFin: json['dateFin'] == null
        ? null
        : DateTime.parse(json['dateFin'] as String),
  );
}

Map<String, dynamic> _$_$_ActualiteToJson(_$_Actualite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titre': instance.titre,
      'description': instance.description,
      'image': instance.image,
      'dateDebut': instance.dateDebut?.toIso8601String(),
      'dateFin': instance.dateFin?.toIso8601String(),
    };

_$_DemandeInput _$_$_DemandeInputFromJson(Map<String, dynamic> json) {
  return _$_DemandeInput(
    description: json['description'] as String,
    service: json['service'] as int,
  );
}

Map<String, dynamic> _$_$_DemandeInputToJson(_$_DemandeInput instance) =>
    <String, dynamic>{
      'description': instance.description,
      'service': instance.service,
    };

_$_DemandeListing _$_$_DemandeListingFromJson(Map<String, dynamic> json) {
  return _$_DemandeListing(
    id: json['id'] as int,
    description: json['description'] as String,
    etat: json['etat'] as int,
    type: json['type'] as String,
    dateFin: json['dateFin'] == null
        ? null
        : DateTime.parse(json['dateFin'] as String),
  );
}

Map<String, dynamic> _$_$_DemandeListingToJson(_$_DemandeListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'etat': instance.etat,
      'type': instance.type,
      'dateFin': instance.dateFin?.toIso8601String(),
    };

_$_Service _$_$_ServiceFromJson(Map<String, dynamic> json) {
  return _$_Service(
    id: json['id'] as int,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$_$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };
