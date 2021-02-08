
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models_classes.freezed.dart';
part 'models_classes.g.dart';

@freezed
abstract class User with _$User {
  const factory User({String email, String password}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class UserProfil with _$UserProfil {
  const factory UserProfil({
    String nom,
    String prenom,
    int telephone,
    String email,
  }) = _UserProfil;
  factory UserProfil.fromJson(Map<String, dynamic> json) =>
      _$UserProfilFromJson(json);
}

@freezed
abstract class Actualite with _$Actualite {
  const factory Actualite({
    int id,
    String titre,
    String description,
    String image,
    DateTime dateDebut,
    DateTime dateFin,
  }) = _Actualite;
  factory Actualite.fromJson(Map<String, dynamic> json) =>
      _$ActualiteFromJson(json);
}

@freezed
abstract class DemandeInput with _$DemandeInput {
  const factory DemandeInput({
    String description,
    int service,
  }) = _DemandeInput;
  factory DemandeInput.fromJson(Map<String, dynamic> json) =>
      _$DemandeInputFromJson(json);
}

@freezed
abstract class DemandeListing with _$DemandeListing {
  const factory DemandeListing({
    int id,
    String description,
    int etat,
    String type,
    DateTime dateFin,
  }) = _DemandeListing;
  factory DemandeListing.fromJson(Map<String, dynamic> json) =>
      _$DemandeListingFromJson(json);
}

@freezed
abstract class Service with _$Service {
  const factory Service({
    int id,
    String type,
  }) = _Service;
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
