part of 'actualite_bloc.dart';

class ActualiteState extends Equatable {
  @override
  List<Object> get props => [];
}

class ActualiteInitial extends ActualiteState {
  @override
  String toString() => "ActualiteInitial";
}

class ActualiteChargee extends ActualiteState {
  final List<Actualite> actualites;
  final int currentPage;
  final bool noPage;

  ActualiteChargee({
    this.actualites,
    this.currentPage = 1,
    this.noPage = false,
  });
  @override
  List<Object> get props => [actualites, currentPage, noPage];
  @override
  String toString() => "ActualiteChargee";

  ActualiteChargee copyWith({
    List<Actualite> actualites,
    int currentPage,
    bool noPage,
  }) {
    return ActualiteChargee(
      actualites: actualites ?? this.actualites,
      currentPage: currentPage ?? this.currentPage,
      noPage: noPage ?? this.noPage,
    );
  }
}

class ActualiteChargEchouer extends ActualiteState {
  final String message;

  ActualiteChargEchouer(this.message);
  @override
  List<Object> get props => [message];
  @override
  String toString() => "ActualiteChargEchouer";
}
