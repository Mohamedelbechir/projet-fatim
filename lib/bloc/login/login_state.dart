
part of 'login_bloc.dart';
abstract class LoginState extends Equatable {
  
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
  @override
  String toString() => "LoginInitial";
}
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'LoginLoading';
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object> get props => [message];
  @override
  String toString() => 'LoginFailure';
}
