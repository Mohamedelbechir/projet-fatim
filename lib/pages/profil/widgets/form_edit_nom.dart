import 'package:flutter/material.dart';
import 'package:projet20/bloc/profil/profil_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditNom extends StatefulWidget {
  final UserProfil userProfil;

  const FormEditNom({Key key, @required this.userProfil}) : super(key: key);
  @override
  _FormEditNomState createState() => _FormEditNomState();
}

class _FormEditNomState extends State<FormEditNom> {
  final _formkey = GlobalKey<FormState>();
  String _nom;
  String _prenom;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Nom'),
            initialValue: widget.userProfil.nom,
            validator: (nom) {
              if (nom == null || nom.isEmpty) {
                return 'Nom obligatoire';
              }
              return null;
            },
            onSaved: (nom) {
              _nom = nom;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Prenom'),
            initialValue: widget.userProfil.prenom,
            validator: (prenom) {
              if (prenom == null || prenom.isEmpty) {
                return 'Prenom obligatoire';
              }
              return null;
            },
            onSaved: (prenom) {
              _prenom = prenom;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              OutlineButton(
                  textColor: Colors.amberAccent[700],
                  color: Colors.amberAccent[700],
                  borderSide: BorderSide(color: Colors.amberAccent[700]),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    'Annuler',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context)),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.amberAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      _formkey.currentState.save();
                      context.bloc<ProfilBloc>().add(
                            UpdateProfil(widget.userProfil
                                .copyWith(nom: _nom, prenom: _prenom)),
                          );
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
