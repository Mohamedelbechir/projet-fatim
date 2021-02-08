import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projet20/bloc/actualite/actualite_bloc.dart';
import 'package:projet20/bloc/demande/demande_bloc.dart';
import 'package:projet20/bloc/profil/profil_bloc.dart';
import 'package:projet20/pages/actualite/atualite_page.dart';
import 'package:projet20/pages/demande/demande_page.dart';
import 'package:projet20/pages/profil/profil_page.dart';
import 'package:projet20/repository/actualite_repository.dart';
import 'package:projet20/repository/demande_repository.dart';
import 'package:projet20/repository/user_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _listMenu;
  @override
  void initState() {
    _listMenu = <Widget>[
      BlocProvider<ActualiteBloc>(
        create: (context) => ActualiteBloc(
          actualiteRepository: context.repository<ActualiteRepository>(),
        )..add(ChargerActualite()),
        child: ActualitePage(),
      ),
      BlocProvider<DemandeBloc>(
        create: (context) => DemandeBloc(
          demandeRepository: context.repository<DemandeRepository>(),
        )..add(ChargerDemande()),
        child: DemandePage(),
      ),
      BlocProvider<ProfilBloc>(
        create: (context) => ProfilBloc(
          userRepository: context.repository<UserRepository>(),
        )..add(ChargerProfil()),
        child: ProfilPage(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listMenu.elementAt(_selectedIndex),
      backgroundColor: Colors.blueGrey[50],
      bottomNavigationBar: CustumBottomNavigation(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CustumBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int selectedIndex) onTap;
  final _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      title: Text('Actualité'),
      icon: Icon(FontAwesomeIcons.newspaper),
    
      activeIcon: Icon(FontAwesomeIcons.newspaper,
          color: Colors.blueGrey[900], size: 30),
    ),
    BottomNavigationBarItem(
      title: Text('Demande'),
      icon: Icon(FontAwesomeIcons.dochub),
      activeIcon:
          Icon(FontAwesomeIcons.dochub, color: Colors.blueGrey[900], size: 30),
    ),
    BottomNavigationBarItem(
      title: Text('Profil'),
      icon: Icon(FontAwesomeIcons.user),
      activeIcon:
          Icon(FontAwesomeIcons.user, color: Colors.blueGrey[900], size: 30),
    ),
  ];

  CustumBottomNavigation({
    Key key,
    this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _items,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
