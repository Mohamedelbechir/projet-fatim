import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet20/bloc/demande/demande_bloc.dart';
import 'package:projet20/bloc/form_demande/form_demande_bloc.dart';
import 'package:projet20/pages/demande/widgets/form_add_demande.dart';
import 'package:projet20/pages/demande/widgets/list_tile_demande.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:projet20/repository/demande_repository.dart';

class DemandePage extends StatefulWidget {
  @override
  _DemandePageState createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  Key _keyListDemande = Key('key_list_demande_');
  // ? controller pour recuperer le texte saisi
  final _controllerSearch = TextEditingController(text: '');

  @override
  void initState() {
    // ? A chaque changement de texte rafraichir la liste
    _controllerSearch.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Demandes',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
              ],
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
                  hintText: 'rechercher ...'),
            ),
          ),
          SizedBox(height: 20),
          BlocBuilder<DemandeBloc, DemandeState>(
            builder: (context, state) {
              if (state is DemandeChargee) {
                // _listDemande = state.demandes;
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
                      key: _keyListDemande,
                      itemCount: state.demandes.length,
                      itemBuilder: (_, index) => ListTileDemande(
                        demandeListing: state.demandes[index],
                      ),
                    ),*/
                    child: ListView(
                      key: _keyListDemande,
                      children: <Widget>[
                        // chercher suivant le type et la description
                        ...state.demandes
                            .where((dmd) => (dmd.type.toLowerCase().contains(
                                    _controllerSearch.text.toLowerCase()) ||
                                dmd.description.toLowerCase().contains(
                                    _controllerSearch.text.toLowerCase())))
                            .toList()
                            .map((dmd) => ListTileDemande(demandeListing: dmd))
                            .toList(),
                      ],
                    ),
                  ),
                );
              }
              if (state is DemandeChargEchouer) {
                return Center(
                  child: Text('${state.message}'),
                );
              }
              if (state is DemandeInitial) {
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            },
          )
        ],
      ),
      floatingActionButton: BlocBuilder<DemandeBloc, DemandeState>(
        // on dessine ce button seulement lorsque etat courant est DemandeChargee
        condition: (previousState, state) {
          return state is DemandeChargee;
        },
        builder: (context, state) {
          if (state is DemandeChargee)
            return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.amberAccent[700],
              onPressed: () {
                _onAdd(state.services);
              },
            );
          return Container();
        },
      ),
    );
  }

  _onAdd(List<Service> services) {
    final _blocDemande = context.bloc<DemandeBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          // height: 450,
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          padding: EdgeInsets.all(20.0),
          child: BlocProvider<FormDemandeBloc>(
              create: (context) => FormDemandeBloc(
                    demandeRepository: context.repository<DemandeRepository>(),
                    demandeBloc: _blocDemande,
                  ),
              child: FormAddDemande(services: services)),
        );
      },
    );
  }
}
