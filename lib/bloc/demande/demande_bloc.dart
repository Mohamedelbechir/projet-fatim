import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/demande_repository.dart';
part 'demande_event.dart';
part 'demande_state.dart';

class DemandeBloc extends Bloc<DemandeEvent, DemandeState> {
  final DemandeRepository demandeRepository;

  DemandeBloc({this.demandeRepository});
  @override
  DemandeState get initialState => DemandeInitial();

  @override
  Stream<DemandeState> mapEventToState(
    DemandeEvent event,
  ) async* {
    if (event is ChargerDemande) {
      yield* _mapChargerDemandeToState(event);
    }
    if (event is AjouterListDemande) {
      yield* _mapAjouterListDemandeToState(event);
    }
  }

  Stream<DemandeState> _mapChargerDemandeToState(ChargerDemande event) async* {
    try {
      // charger les demandes
      final demandes = await demandeRepository.findAll();
      final services = await demandeRepository.findAllService();
      yield DemandeChargee(demandes: demandes, services: services);
    } catch (e) {
      yield DemandeChargEchouer('erreur lors de chargement des demandes');
    }
  }

  Stream<DemandeState> _mapAjouterListDemandeToState(
      AjouterListDemande event) async* {
    // aciennes liste + nouvelle demande
    final demandes = <DemandeListing>[
        event.demandeListing,
      ...(state as DemandeChargee).demandes
    
    ];
    final services = (state as DemandeChargee).services;
    yield DemandeChargee(demandes: demandes, services: services);
  }
}
