part of 'demande_bloc.dart';

abstract class DemandeEvent {}

class ChargerDemande extends DemandeEvent {
  @override
  String toString() => "ChargerDemande";
}

// pour ajouter la nouvelle demande à la liste des anciennes
class AjouterListDemande extends DemandeEvent {
  final DemandeListing demandeListing;
  AjouterListDemande(this.demandeListing);

  @override
  String toString() => 'AjouterListDemande(demandeListing: $demandeListing)';
}
