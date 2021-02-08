part of 'form_demande_bloc.dart';

abstract class FormDemandeState extends Equatable {
  @override
  List<Object> get props => [];
}

class FormDemandeInitial extends FormDemandeState {
  @override
  String toString() => 'FormDemandeInitial';
}

class FormDemandeChargee extends FormDemandeState {
  final List<Service> services;

  FormDemandeChargee({@required this.services});
  @override
  List<Object> get props => [services];

  @override
  String toString() => 'FormDemandeChargee(services: $services)';
}

class AjoutEnCour extends FormDemandeState {
  @override
  String toString() => "AjoutEnCour";
}

class AjoutSuccess extends FormDemandeState {
  final String message;

  AjoutSuccess(this.message);
  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AjoutSuccess(message: $message)';
}

class AjoutEchouer extends FormDemandeState {
  final String message;

  AjoutEchouer(this.message);

  @override
  List<Object> get props => [message];
  @override
  String toString() => 'AjoutEchouer(message: $message)';
}
