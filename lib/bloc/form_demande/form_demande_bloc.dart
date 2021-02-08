import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:projet20/bloc/demande/demande_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:bloc/bloc.dart';
import 'package:projet20/repository/demande_repository.dart';

part 'form_demande_event.dart';
part 'form_demande_state.dart';

class FormDemandeBloc extends Bloc<FormDemandeEvent, FormDemandeState> {
  final DemandeRepository demandeRepository;
  final DemandeBloc demandeBloc;

  FormDemandeBloc({
    @required this.demandeRepository,
    @required this.demandeBloc,
  });

  @override
  FormDemandeState get initialState => FormDemandeInitial();

  @override
  Stream<FormDemandeState> mapEventToState(
    FormDemandeEvent event,
  ) async* {
    if (event is AjouterDemande) {
      yield* _mapAjouterDemandeToState(event);
    }
  }

  Stream<FormDemandeState> _mapAjouterDemandeToState(
      AjouterDemande event) async* {
    try {
      yield AjoutEnCour();
      final demande = await demandeRepository.save(event.demandeInput);
      if (demande != null) {
        yield AjoutSuccess('Demande ajoutée avec succès');
        demandeBloc.add(AjouterListDemande(demande));
      } else
        yield AjoutEchouer("erreur de lors l'ajout");
    } catch (e) {
      yield AjoutEchouer("erreur de lors l'ajout");
    }
  }
}
