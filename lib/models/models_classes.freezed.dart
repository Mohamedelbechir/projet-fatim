// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'models_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call({String email, String password}) {
    return _User(
      email: email,
      password: password,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get email;
  String get password;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_User(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

@JsonSerializable()
class _$_User implements _User {
  const _$_User({this.email, this.password});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'User(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({String email, String password}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  _$UserCopyWith<_User> get copyWith;
}

UserProfil _$UserProfilFromJson(Map<String, dynamic> json) {
  return _UserProfil.fromJson(json);
}

class _$UserProfilTearOff {
  const _$UserProfilTearOff();

  _UserProfil call({String nom, String prenom, int telephone, String email}) {
    return _UserProfil(
      nom: nom,
      prenom: prenom,
      telephone: telephone,
      email: email,
    );
  }
}

// ignore: unused_element
const $UserProfil = _$UserProfilTearOff();

mixin _$UserProfil {
  String get nom;
  String get prenom;
  int get telephone;
  String get email;

  Map<String, dynamic> toJson();
  $UserProfilCopyWith<UserProfil> get copyWith;
}

abstract class $UserProfilCopyWith<$Res> {
  factory $UserProfilCopyWith(
          UserProfil value, $Res Function(UserProfil) then) =
      _$UserProfilCopyWithImpl<$Res>;
  $Res call({String nom, String prenom, int telephone, String email});
}

class _$UserProfilCopyWithImpl<$Res> implements $UserProfilCopyWith<$Res> {
  _$UserProfilCopyWithImpl(this._value, this._then);

  final UserProfil _value;
  // ignore: unused_field
  final $Res Function(UserProfil) _then;

  @override
  $Res call({
    Object nom = freezed,
    Object prenom = freezed,
    Object telephone = freezed,
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      nom: nom == freezed ? _value.nom : nom as String,
      prenom: prenom == freezed ? _value.prenom : prenom as String,
      telephone: telephone == freezed ? _value.telephone : telephone as int,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

abstract class _$UserProfilCopyWith<$Res> implements $UserProfilCopyWith<$Res> {
  factory _$UserProfilCopyWith(
          _UserProfil value, $Res Function(_UserProfil) then) =
      __$UserProfilCopyWithImpl<$Res>;
  @override
  $Res call({String nom, String prenom, int telephone, String email});
}

class __$UserProfilCopyWithImpl<$Res> extends _$UserProfilCopyWithImpl<$Res>
    implements _$UserProfilCopyWith<$Res> {
  __$UserProfilCopyWithImpl(
      _UserProfil _value, $Res Function(_UserProfil) _then)
      : super(_value, (v) => _then(v as _UserProfil));

  @override
  _UserProfil get _value => super._value as _UserProfil;

  @override
  $Res call({
    Object nom = freezed,
    Object prenom = freezed,
    Object telephone = freezed,
    Object email = freezed,
  }) {
    return _then(_UserProfil(
      nom: nom == freezed ? _value.nom : nom as String,
      prenom: prenom == freezed ? _value.prenom : prenom as String,
      telephone: telephone == freezed ? _value.telephone : telephone as int,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

@JsonSerializable()
class _$_UserProfil implements _UserProfil {
  const _$_UserProfil({this.nom, this.prenom, this.telephone, this.email});

  factory _$_UserProfil.fromJson(Map<String, dynamic> json) =>
      _$_$_UserProfilFromJson(json);

  @override
  final String nom;
  @override
  final String prenom;
  @override
  final int telephone;
  @override
  final String email;

  @override
  String toString() {
    return 'UserProfil(nom: $nom, prenom: $prenom, telephone: $telephone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserProfil &&
            (identical(other.nom, nom) ||
                const DeepCollectionEquality().equals(other.nom, nom)) &&
            (identical(other.prenom, prenom) ||
                const DeepCollectionEquality().equals(other.prenom, prenom)) &&
            (identical(other.telephone, telephone) ||
                const DeepCollectionEquality()
                    .equals(other.telephone, telephone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nom) ^
      const DeepCollectionEquality().hash(prenom) ^
      const DeepCollectionEquality().hash(telephone) ^
      const DeepCollectionEquality().hash(email);

  @override
  _$UserProfilCopyWith<_UserProfil> get copyWith =>
      __$UserProfilCopyWithImpl<_UserProfil>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserProfilToJson(this);
  }
}

abstract class _UserProfil implements UserProfil {
  const factory _UserProfil(
      {String nom, String prenom, int telephone, String email}) = _$_UserProfil;

  factory _UserProfil.fromJson(Map<String, dynamic> json) =
      _$_UserProfil.fromJson;

  @override
  String get nom;
  @override
  String get prenom;
  @override
  int get telephone;
  @override
  String get email;
  @override
  _$UserProfilCopyWith<_UserProfil> get copyWith;
}

Actualite _$ActualiteFromJson(Map<String, dynamic> json) {
  return _Actualite.fromJson(json);
}

class _$ActualiteTearOff {
  const _$ActualiteTearOff();

  _Actualite call(
      {int id,
      String titre,
      String description,
      String image,
      DateTime dateDebut,
      DateTime dateFin}) {
    return _Actualite(
      id: id,
      titre: titre,
      description: description,
      image: image,
      dateDebut: dateDebut,
      dateFin: dateFin,
    );
  }
}

// ignore: unused_element
const $Actualite = _$ActualiteTearOff();

mixin _$Actualite {
  int get id;
  String get titre;
  String get description;
  String get image;
  DateTime get dateDebut;
  DateTime get dateFin;

  Map<String, dynamic> toJson();
  $ActualiteCopyWith<Actualite> get copyWith;
}

abstract class $ActualiteCopyWith<$Res> {
  factory $ActualiteCopyWith(Actualite value, $Res Function(Actualite) then) =
      _$ActualiteCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String titre,
      String description,
      String image,
      DateTime dateDebut,
      DateTime dateFin});
}

class _$ActualiteCopyWithImpl<$Res> implements $ActualiteCopyWith<$Res> {
  _$ActualiteCopyWithImpl(this._value, this._then);

  final Actualite _value;
  // ignore: unused_field
  final $Res Function(Actualite) _then;

  @override
  $Res call({
    Object id = freezed,
    Object titre = freezed,
    Object description = freezed,
    Object image = freezed,
    Object dateDebut = freezed,
    Object dateFin = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      titre: titre == freezed ? _value.titre : titre as String,
      description:
          description == freezed ? _value.description : description as String,
      image: image == freezed ? _value.image : image as String,
      dateDebut:
          dateDebut == freezed ? _value.dateDebut : dateDebut as DateTime,
      dateFin: dateFin == freezed ? _value.dateFin : dateFin as DateTime,
    ));
  }
}

abstract class _$ActualiteCopyWith<$Res> implements $ActualiteCopyWith<$Res> {
  factory _$ActualiteCopyWith(
          _Actualite value, $Res Function(_Actualite) then) =
      __$ActualiteCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String titre,
      String description,
      String image,
      DateTime dateDebut,
      DateTime dateFin});
}

class __$ActualiteCopyWithImpl<$Res> extends _$ActualiteCopyWithImpl<$Res>
    implements _$ActualiteCopyWith<$Res> {
  __$ActualiteCopyWithImpl(_Actualite _value, $Res Function(_Actualite) _then)
      : super(_value, (v) => _then(v as _Actualite));

  @override
  _Actualite get _value => super._value as _Actualite;

  @override
  $Res call({
    Object id = freezed,
    Object titre = freezed,
    Object description = freezed,
    Object image = freezed,
    Object dateDebut = freezed,
    Object dateFin = freezed,
  }) {
    return _then(_Actualite(
      id: id == freezed ? _value.id : id as int,
      titre: titre == freezed ? _value.titre : titre as String,
      description:
          description == freezed ? _value.description : description as String,
      image: image == freezed ? _value.image : image as String,
      dateDebut:
          dateDebut == freezed ? _value.dateDebut : dateDebut as DateTime,
      dateFin: dateFin == freezed ? _value.dateFin : dateFin as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_Actualite implements _Actualite {
  const _$_Actualite(
      {this.id,
      this.titre,
      this.description,
      this.image,
      this.dateDebut,
      this.dateFin});

  factory _$_Actualite.fromJson(Map<String, dynamic> json) =>
      _$_$_ActualiteFromJson(json);

  @override
  final int id;
  @override
  final String titre;
  @override
  final String description;
  @override
  final String image;
  @override
  final DateTime dateDebut;
  @override
  final DateTime dateFin;

  @override
  String toString() {
    return 'Actualite(id: $id, titre: $titre, description: $description, image: $image, dateDebut: $dateDebut, dateFin: $dateFin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Actualite &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.titre, titre) ||
                const DeepCollectionEquality().equals(other.titre, titre)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.dateDebut, dateDebut) ||
                const DeepCollectionEquality()
                    .equals(other.dateDebut, dateDebut)) &&
            (identical(other.dateFin, dateFin) ||
                const DeepCollectionEquality().equals(other.dateFin, dateFin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(titre) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(dateDebut) ^
      const DeepCollectionEquality().hash(dateFin);

  @override
  _$ActualiteCopyWith<_Actualite> get copyWith =>
      __$ActualiteCopyWithImpl<_Actualite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ActualiteToJson(this);
  }
}

abstract class _Actualite implements Actualite {
  const factory _Actualite(
      {int id,
      String titre,
      String description,
      String image,
      DateTime dateDebut,
      DateTime dateFin}) = _$_Actualite;

  factory _Actualite.fromJson(Map<String, dynamic> json) =
      _$_Actualite.fromJson;

  @override
  int get id;
  @override
  String get titre;
  @override
  String get description;
  @override
  String get image;
  @override
  DateTime get dateDebut;
  @override
  DateTime get dateFin;
  @override
  _$ActualiteCopyWith<_Actualite> get copyWith;
}

DemandeInput _$DemandeInputFromJson(Map<String, dynamic> json) {
  return _DemandeInput.fromJson(json);
}

class _$DemandeInputTearOff {
  const _$DemandeInputTearOff();

  _DemandeInput call({String description, int service}) {
    return _DemandeInput(
      description: description,
      service: service,
    );
  }
}

// ignore: unused_element
const $DemandeInput = _$DemandeInputTearOff();

mixin _$DemandeInput {
  String get description;
  int get service;

  Map<String, dynamic> toJson();
  $DemandeInputCopyWith<DemandeInput> get copyWith;
}

abstract class $DemandeInputCopyWith<$Res> {
  factory $DemandeInputCopyWith(
          DemandeInput value, $Res Function(DemandeInput) then) =
      _$DemandeInputCopyWithImpl<$Res>;
  $Res call({String description, int service});
}

class _$DemandeInputCopyWithImpl<$Res> implements $DemandeInputCopyWith<$Res> {
  _$DemandeInputCopyWithImpl(this._value, this._then);

  final DemandeInput _value;
  // ignore: unused_field
  final $Res Function(DemandeInput) _then;

  @override
  $Res call({
    Object description = freezed,
    Object service = freezed,
  }) {
    return _then(_value.copyWith(
      description:
          description == freezed ? _value.description : description as String,
      service: service == freezed ? _value.service : service as int,
    ));
  }
}

abstract class _$DemandeInputCopyWith<$Res>
    implements $DemandeInputCopyWith<$Res> {
  factory _$DemandeInputCopyWith(
          _DemandeInput value, $Res Function(_DemandeInput) then) =
      __$DemandeInputCopyWithImpl<$Res>;
  @override
  $Res call({String description, int service});
}

class __$DemandeInputCopyWithImpl<$Res> extends _$DemandeInputCopyWithImpl<$Res>
    implements _$DemandeInputCopyWith<$Res> {
  __$DemandeInputCopyWithImpl(
      _DemandeInput _value, $Res Function(_DemandeInput) _then)
      : super(_value, (v) => _then(v as _DemandeInput));

  @override
  _DemandeInput get _value => super._value as _DemandeInput;

  @override
  $Res call({
    Object description = freezed,
    Object service = freezed,
  }) {
    return _then(_DemandeInput(
      description:
          description == freezed ? _value.description : description as String,
      service: service == freezed ? _value.service : service as int,
    ));
  }
}

@JsonSerializable()
class _$_DemandeInput implements _DemandeInput {
  const _$_DemandeInput({this.description, this.service});

  factory _$_DemandeInput.fromJson(Map<String, dynamic> json) =>
      _$_$_DemandeInputFromJson(json);

  @override
  final String description;
  @override
  final int service;

  @override
  String toString() {
    return 'DemandeInput(description: $description, service: $service)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DemandeInput &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.service, service) ||
                const DeepCollectionEquality().equals(other.service, service)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(service);

  @override
  _$DemandeInputCopyWith<_DemandeInput> get copyWith =>
      __$DemandeInputCopyWithImpl<_DemandeInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DemandeInputToJson(this);
  }
}

abstract class _DemandeInput implements DemandeInput {
  const factory _DemandeInput({String description, int service}) =
      _$_DemandeInput;

  factory _DemandeInput.fromJson(Map<String, dynamic> json) =
      _$_DemandeInput.fromJson;

  @override
  String get description;
  @override
  int get service;
  @override
  _$DemandeInputCopyWith<_DemandeInput> get copyWith;
}

DemandeListing _$DemandeListingFromJson(Map<String, dynamic> json) {
  return _DemandeListing.fromJson(json);
}

class _$DemandeListingTearOff {
  const _$DemandeListingTearOff();

  _DemandeListing call(
      {int id, String description, int etat, String type, DateTime dateFin}) {
    return _DemandeListing(
      id: id,
      description: description,
      etat: etat,
      type: type,
      dateFin: dateFin,
    );
  }
}

// ignore: unused_element
const $DemandeListing = _$DemandeListingTearOff();

mixin _$DemandeListing {
  int get id;
  String get description;
  int get etat;
  String get type;
  DateTime get dateFin;

  Map<String, dynamic> toJson();
  $DemandeListingCopyWith<DemandeListing> get copyWith;
}

abstract class $DemandeListingCopyWith<$Res> {
  factory $DemandeListingCopyWith(
          DemandeListing value, $Res Function(DemandeListing) then) =
      _$DemandeListingCopyWithImpl<$Res>;
  $Res call(
      {int id, String description, int etat, String type, DateTime dateFin});
}

class _$DemandeListingCopyWithImpl<$Res>
    implements $DemandeListingCopyWith<$Res> {
  _$DemandeListingCopyWithImpl(this._value, this._then);

  final DemandeListing _value;
  // ignore: unused_field
  final $Res Function(DemandeListing) _then;

  @override
  $Res call({
    Object id = freezed,
    Object description = freezed,
    Object etat = freezed,
    Object type = freezed,
    Object dateFin = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      description:
          description == freezed ? _value.description : description as String,
      etat: etat == freezed ? _value.etat : etat as int,
      type: type == freezed ? _value.type : type as String,
      dateFin: dateFin == freezed ? _value.dateFin : dateFin as DateTime,
    ));
  }
}

abstract class _$DemandeListingCopyWith<$Res>
    implements $DemandeListingCopyWith<$Res> {
  factory _$DemandeListingCopyWith(
          _DemandeListing value, $Res Function(_DemandeListing) then) =
      __$DemandeListingCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id, String description, int etat, String type, DateTime dateFin});
}

class __$DemandeListingCopyWithImpl<$Res>
    extends _$DemandeListingCopyWithImpl<$Res>
    implements _$DemandeListingCopyWith<$Res> {
  __$DemandeListingCopyWithImpl(
      _DemandeListing _value, $Res Function(_DemandeListing) _then)
      : super(_value, (v) => _then(v as _DemandeListing));

  @override
  _DemandeListing get _value => super._value as _DemandeListing;

  @override
  $Res call({
    Object id = freezed,
    Object description = freezed,
    Object etat = freezed,
    Object type = freezed,
    Object dateFin = freezed,
  }) {
    return _then(_DemandeListing(
      id: id == freezed ? _value.id : id as int,
      description:
          description == freezed ? _value.description : description as String,
      etat: etat == freezed ? _value.etat : etat as int,
      type: type == freezed ? _value.type : type as String,
      dateFin: dateFin == freezed ? _value.dateFin : dateFin as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_DemandeListing implements _DemandeListing {
  const _$_DemandeListing(
      {this.id, this.description, this.etat, this.type, this.dateFin});

  factory _$_DemandeListing.fromJson(Map<String, dynamic> json) =>
      _$_$_DemandeListingFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final int etat;
  @override
  final String type;
  @override
  final DateTime dateFin;

  @override
  String toString() {
    return 'DemandeListing(id: $id, description: $description, etat: $etat, type: $type, dateFin: $dateFin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DemandeListing &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.etat, etat) ||
                const DeepCollectionEquality().equals(other.etat, etat)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.dateFin, dateFin) ||
                const DeepCollectionEquality().equals(other.dateFin, dateFin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(etat) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(dateFin);

  @override
  _$DemandeListingCopyWith<_DemandeListing> get copyWith =>
      __$DemandeListingCopyWithImpl<_DemandeListing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DemandeListingToJson(this);
  }
}

abstract class _DemandeListing implements DemandeListing {
  const factory _DemandeListing(
      {int id,
      String description,
      int etat,
      String type,
      DateTime dateFin}) = _$_DemandeListing;

  factory _DemandeListing.fromJson(Map<String, dynamic> json) =
      _$_DemandeListing.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  int get etat;
  @override
  String get type;
  @override
  DateTime get dateFin;
  @override
  _$DemandeListingCopyWith<_DemandeListing> get copyWith;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

class _$ServiceTearOff {
  const _$ServiceTearOff();

  _Service call({int id, String type}) {
    return _Service(
      id: id,
      type: type,
    );
  }
}

// ignore: unused_element
const $Service = _$ServiceTearOff();

mixin _$Service {
  int get id;
  String get type;

  Map<String, dynamic> toJson();
  $ServiceCopyWith<Service> get copyWith;
}

abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res>;
  $Res call({int id, String type});
}

class _$ServiceCopyWithImpl<$Res> implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  final Service _value;
  // ignore: unused_field
  final $Res Function(Service) _then;

  @override
  $Res call({
    Object id = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

abstract class _$ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$ServiceCopyWith(_Service value, $Res Function(_Service) then) =
      __$ServiceCopyWithImpl<$Res>;
  @override
  $Res call({int id, String type});
}

class __$ServiceCopyWithImpl<$Res> extends _$ServiceCopyWithImpl<$Res>
    implements _$ServiceCopyWith<$Res> {
  __$ServiceCopyWithImpl(_Service _value, $Res Function(_Service) _then)
      : super(_value, (v) => _then(v as _Service));

  @override
  _Service get _value => super._value as _Service;

  @override
  $Res call({
    Object id = freezed,
    Object type = freezed,
  }) {
    return _then(_Service(
      id: id == freezed ? _value.id : id as int,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()
class _$_Service implements _Service {
  const _$_Service({this.id, this.type});

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceFromJson(json);

  @override
  final int id;
  @override
  final String type;

  @override
  String toString() {
    return 'Service(id: $id, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Service &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type);

  @override
  _$ServiceCopyWith<_Service> get copyWith =>
      __$ServiceCopyWithImpl<_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceToJson(this);
  }
}

abstract class _Service implements Service {
  const factory _Service({int id, String type}) = _$_Service;

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  _$ServiceCopyWith<_Service> get copyWith;
}
