part of 'profil_bloc.dart';

class ProfilState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfilInitial extends ProfilState {
  @override
  String toString() => "ProfilInitial";
}

class ProfilCharge extends ProfilState {
  final UserProfil userProfil;

  ProfilCharge(this.userProfil);
  @override
  String toString() => "ProfilCharge";
  @override
  List<Object> get props => [userProfil];
}

class UpdateProfilEchouer extends ProfilState {
  final String message;

  UpdateProfilEchouer(this.message);

  @override
  String toString() => "UpdateProfilEchouer";
}

class UpdateProfilSuccess extends ProfilState {
  final String message;

  UpdateProfilSuccess(this.message);

  @override
  List<Object> get props => [message];
  @override
  String toString() => "UpdateProfilSuccess";
}

class UpdateProfilEncour extends ProfilState {
  String toString() => "UpdateProfilEncour";
}
