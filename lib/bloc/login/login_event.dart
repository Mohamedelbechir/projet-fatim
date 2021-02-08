part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final User user;

  LoginButtonPressed({this.user});
  @override
  String toString() {
    return "LoginButtonPressed";
  }
}
