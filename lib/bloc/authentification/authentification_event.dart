part of 'authentification_bloc.dart';

abstract class AuthentificationEvent {}

/* Lancement de l'application */
class AppStarted extends AuthentificationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthentificationEvent {
  final String token;

  LoggedIn({@required this.token});

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthentificationEvent {
  @override
  String toString() => 'LoggedOut';
}
