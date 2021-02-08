part of 'profil_bloc.dart';

abstract class ProfilEvent {}

class ChargerProfil extends ProfilEvent {
  @override
  String toString() => "ChargerProfil";
}

class UpdateProfil extends ProfilEvent {
  final UserProfil userProfil;

  UpdateProfil(this.userProfil);

  @override
  String toString() => 'UpdateProfil(userProfil: $userProfil)';
}

class ResetPwd extends ProfilEvent {
  String ancien;
  String nouveau;
  ResetPwd(this.ancien, this.nouveau);

  @override
  String toString() => 'ResetPwd(ancien: $ancien, nouveau: $nouveau)';
}
