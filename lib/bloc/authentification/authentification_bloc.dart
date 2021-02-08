import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:projet20/repository/user_repository.dart';

part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final UserRepository userRepository;

  AuthentificationBloc({@required this.userRepository});
  @override
  AuthentificationState get initialState => AuthentificationUninitialized();

  @override
  Stream<AuthentificationState> mapEventToState(
    AuthentificationEvent event,
  ) async* {
    if (event is LoggedIn) {
      yield* _mapLoggedInToState(event);
    } else if (event is AppStarted) {
      yield* _mapAppStartedToState(event);
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState(event);
    }
  }

  Stream<AuthentificationState> _mapLoggedInToState(LoggedIn event) async* {
    try {
      // enregistrer le token
      await userRepository.saveToken(event.token);
      yield AuthentificationAuthenticated();
    } catch (e) {
      // erreur lors du sauvegarde du token
    }
  }

  Stream<AuthentificationState> _mapAppStartedToState(AppStarted event) async* {
    final token = await userRepository.hasToken();
    await Future.delayed(Duration(seconds: 1), () {});
    if (token.isEmpty)
      yield AuthentificationUnauthenticated();
    else {
      yield AuthentificationAuthenticated();
    }
  }

  Stream<AuthentificationState> _mapLoggedOutToState(LoggedOut event) async* {
    try {
      await userRepository.removeToken();
      yield AuthentificationUnauthenticated();
    } catch (e) {}
  }
}
