import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet20/bloc/authentification/authentification_bloc.dart';
import 'package:projet20/bloc/login/login_bloc.dart';
import 'package:projet20/pages/home/home_page.dart';
import 'package:projet20/pages/login/loginPage.dart';
import 'package:projet20/repository/actualite_repository.dart';
import 'package:projet20/repository/demande_repository.dart';
import 'package:projet20/repository/user_repository.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Duration duration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      builder: (context, widget) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<UserRepository>(
              create: (context) => UserRepository(),
            ),
            RepositoryProvider<ActualiteRepository>(
              create: (context) => ActualiteRepository(),
            ),
            RepositoryProvider<DemandeRepository>(
              create: (context) => DemandeRepository(),
            ),
          ],
          child: widget,
        );
      },
      home: BlocProvider<AuthentificationBloc>(
        create: (context) => AuthentificationBloc(
          userRepository: context.repository<UserRepository>(),
        )..add(AppStarted()),
        child: AnimatedBlocBuilder<AuthentificationBloc, AuthentificationState>(
            builder: (context, state) {
          if (state is AuthentificationAuthenticated) {
            return HomePage();
          }
          if (state is AuthentificationUnauthenticated) {
            return BlocProvider<LoginBloc>(
              // BlocProvider fournit à ses fils le LoginBloc
              create: (context) {
                return LoginBloc(
                  authentificationBloc: context.bloc<AuthentificationBloc>(),
                  userRepository: context.repository<UserRepository>(),
                );
              }, // création du bloc
              child: LoginPage(), // la page login
            );
          }
          return SplashCreen();
        }),
      ),
    );
  }
}

class SplashCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.asset("assets/img/splash.png")),
        ],
      ),
    );
  }
}

class AnimatedBlocBuilder<B extends Bloc<dynamic, S>, S>
    extends BlocBuilder<B, S> {
  AnimatedBlocBuilder({
    Key key,
    B bloc,
    @required BlocWidgetBuilder<S> builder,
    BlocBuilderCondition<S> condition,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          key: key,
          bloc: bloc,
          builder: (context, state) => AnimatedSwitcher(
            duration: duration,
            child: builder(context, state),
          ),
          condition: condition,
        );
}
