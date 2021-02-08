part of 'authentification_bloc.dart';

abstract class AuthentificationState extends Equatable {
  @override
  List get props => [];
}

/* 
  etat initial
 */
class AuthentificationUninitialized extends AuthentificationState {
  @override
  String toString() => 'AuthentificationUninitialized';
}

/* 
  *  Utilisateur est authentifié
 */
class AuthentificationAuthenticated extends AuthentificationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

/* Utilisateur n'est pas authentifier */
class AuthentificationUnauthenticated extends AuthentificationState {
  @override
  String toString() => 'AuthentificationUnauthenticated';
}
