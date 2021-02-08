import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet20/bloc/authentification/authentification_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/user_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthentificationBloc authentificationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authentificationBloc,
  });

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield* _mapLoginButtonPressedToState(event);
    }
  }

  Stream<LoginState> _mapLoginButtonPressedToState(
      LoginButtonPressed event) async* {
    try {
      yield LoginLoading();
      final token = await userRepository.login(event.user);
      if (token.isEmpty) {
        yield LoginFailure("email ou mot de passe incorrect");
      } else {
        // envoyer un évenement pour dire que login s'est fait avec success
        authentificationBloc.add(LoggedIn(token: token));
      }
    } catch (e) {
      yield LoginFailure("Erreur lors de l'authentification");
    }
  }
}
