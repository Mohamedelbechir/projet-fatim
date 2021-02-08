part of 'actualite_bloc.dart';
abstract class ActualiteEvent {}

class ChargerActualite extends ActualiteEvent {
  @override
  String toString() => "ChargerActualite";
  
}