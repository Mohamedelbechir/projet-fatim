import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/user_repository.dart';

part 'profil_event.dart';
part 'profil_state.dart';

class ProfilBloc extends Bloc<ProfilEvent, ProfilState> {
  final UserRepository userRepository;

  ProfilBloc({this.userRepository});
  @override
  ProfilState get initialState => ProfilInitial();

  @override
  Stream<ProfilState> mapEventToState(ProfilEvent event) async* {
    if (event is ChargerProfil) {
      yield* _mapChargerProfilToState(event);
    } else if (event is UpdateProfil) {
      yield* _mapUpdateProfilToState(event);
    } else if (event is ResetPwd) {
      yield* _mapResetPwdToState(event);
    }
  }

  Stream<ProfilState> _mapChargerProfilToState(ChargerProfil event) async* {
    try {
      final user = await userRepository.getProfil();
      yield ProfilCharge(user);
    } catch (e) {}
  }

  Stream<ProfilState> _mapUpdateProfilToState(UpdateProfil event) async* {
    try {
      yield UpdateProfilEncour();
      final rest = await userRepository.updateProfil(event.userProfil);
      if (rest) {
        yield UpdateProfilSuccess('Profil modifié avec succès');
        yield ProfilCharge(event.userProfil);
      } else {
        yield UpdateProfilEchouer('Mise à jour non effectuée');
      }
    } catch (e) {
      // erreur
      yield UpdateProfilEchouer('Mise à jour non effectuée');
    }
  }

  Stream<ProfilState> _mapResetPwdToState(ResetPwd event) async* {
    try {
      yield UpdateProfilEncour();
      final rest =
          await userRepository.resetPassword(event.ancien, event.nouveau);
      if (rest) {
        yield UpdateProfilSuccess('Profil modifié avec succès');
      } else {
        yield UpdateProfilEchouer('Mise à jour non effectuée');
      }
    } catch (e) {
      yield UpdateProfilEchouer('Mise à jour non effectuée');
    }
  }
}
