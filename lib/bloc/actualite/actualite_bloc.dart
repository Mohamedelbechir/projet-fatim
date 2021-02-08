import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:bloc/bloc.dart';
import 'package:projet20/repository/actualite_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'actualite_event.dart';
part 'actualite_state.dart';

class ActualiteBloc extends Bloc<ActualiteEvent, ActualiteState> {
  final ActualiteRepository actualiteRepository;

  ActualiteBloc({@required this.actualiteRepository});
  @override
  ActualiteState get initialState => ActualiteInitial();

  @override
  Stream<Transition<ActualiteEvent, ActualiteState>> transformEvents(
    Stream<ActualiteEvent> events,
    TransitionFunction<ActualiteEvent, ActualiteState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ActualiteState> mapEventToState(
    ActualiteEvent event,
  ) async* {
    if (event is ChargerActualite) {
      yield* _mapChargerActualiteToState(event);
    }
  }

  Stream<ActualiteState> _mapChargerActualiteToState(
      ChargerActualite event) async* {
    try {
      if (state is ActualiteChargee) {
        final _state = state as ActualiteChargee;
        final actus = await actualiteRepository.findAll(_state.currentPage + 1);
        if (actus.isNotEmpty) {
          yield _state.copyWith(
              actualites: List.from(_state.actualites)..addAll(actus),
              currentPage: _state.currentPage + 1);
        } else {
          yield _state.copyWith(noPage: true);
        }
      } else {
        final actus = await actualiteRepository.findAll(1);
        yield ActualiteChargee(
          actualites: actus,
          noPage: actus.length < 7 ? true : false,
        );
      }
    } catch (e) {
      yield ActualiteChargEchouer("Echec lors de chargement");
    }
  }
}
