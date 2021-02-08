part of 'form_demande_bloc.dart';

abstract class FormDemandeEvent {}

class AjouterDemande extends FormDemandeEvent {
  final DemandeInput demandeInput;

  AjouterDemande({@required this.demandeInput});

  @override
  String toString() => 'AjouterDemande(demandeInput: $demandeInput)';
}

