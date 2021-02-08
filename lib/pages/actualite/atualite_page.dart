import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projet20/bloc/actualite/actualite_bloc.dart';
import 'package:projet20/pages/actualite/widgets/list_tile_actualite.dart';

class ActualitePage extends StatefulWidget {
  @override
  _ActualitePageState createState() => _ActualitePageState();
}

class _ActualitePageState extends State<ActualitePage> {
  final _controllerSearch = TextEditingController(text: '');
  final _keyListActualite = Key('_key_list_actualite');

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    final _bloc = context.bloc<ActualiteBloc>();
    // ? A chaque changement de texte rafraichir la liste
    _controllerSearch.addListener(() => setState(() {
          final _state = _bloc.state;
          if (_state is ActualiteChargee) {
            if (!_state.noPage) {
              _bloc.add(ChargerActualite());
            }
          }
        }));
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Actualités',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[700],
            ),
          ),
        ),
        Card(
          elevation: 10,
          margin: EdgeInsets.all(8),
          child: TextField(
            controller: _controllerSearch,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'rechercher selon le titre ...'),
          ),
        ),
        SizedBox(height: 20),
        BlocBuilder<ActualiteBloc, ActualiteState>(
          builder: (context, state) {
            if (state is ActualiteChargee) {
              return Expanded(
                child: Card(
                  margin: EdgeInsets.all(0),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  /* child: ListView.builder(
                    itemCount: state.actualites.length,
                    itemBuilder: (_, index) => ListTileActualite(
                      actualite: state.actualites[index],
                    ),
                  ),*/
                  child: ListView(
                    key: _keyListActualite,
                    controller: _scrollController,
                    children: <Widget>[
                      // Afficher le resultat de la recherche
                      ...state.actualites
                          .where((actu) => (actu.titre
                              .toLowerCase()
                              .contains(_controllerSearch.text.toLowerCase())))
                          .toList()
                          .map((actu) => ListTileActualite(actualite: actu))
                          .toList(),
                      state.noPage
                          ? Container()
                          : Center(
                              child:
                                  SpinKitFadingCircle(color: Colors.blueGrey))
                    ],
                  ),
                ),
              );
            }
            if (state is ActualiteChargEchouer) {
              return Center(
                child: Text('${state.message}'),
              );
            }
            if (state is ActualiteInitial) {
              return Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        )
      ],
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      context.bloc<ActualiteBloc>().add(ChargerActualite());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
