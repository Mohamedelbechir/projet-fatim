part of 'demande_bloc.dart';

class DemandeState extends Equatable {
  @override
  List<Object> get props => [];
}

class DemandeInitial extends DemandeState {
  @override
  String toString() => "DemandeInitial";
}

class DemandeChargee extends DemandeState {
  final List<DemandeListing> demandes;
  final List<Service> services;

  DemandeChargee({this.demandes, this.services});

  @override
  List<Object> get props => [demandes, services];

  @override
  String toString() =>
      'DemandeChargee(demandes: $demandes, services: $services)';
}

class DemandeChargEchouer extends DemandeState {
  final String message;

  DemandeChargEchouer(this.message);

  @override
  List<Object> get props => [message];
  @override
  String toString() => "DemandeChargEchouer";
}
