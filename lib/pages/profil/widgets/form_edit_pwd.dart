import 'package:flutter/material.dart';
import 'package:projet20/bloc/profil/profil_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditPwd extends StatefulWidget {
  final UserProfil userProfil;

  const FormEditPwd({Key key, @required this.userProfil}) : super(key: key);
  @override
  _FormEditPwdState createState() => _FormEditPwdState();
}

class _FormEditPwdState extends State<FormEditPwd> {
  final _formkey = GlobalKey<FormState>();
  String _ancien;
  String _nouveau;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Ancien mot de Passe'),
            validator: (ancien) {
              if (ancien == null || ancien.isEmpty) {
                return 'Ancien mot de passe obligatoire';
              }
              return null;
            },
            onSaved: (ancien) {
              _ancien = ancien;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Nouveau mot de Passe'),
            validator: (nouveau) {
              if (nouveau == null || nouveau.isEmpty) {
                return 'nouveau mot de passe obligatoire';
              }
              return null;
            },
            onSaved: (nouveau) {
              _nouveau = nouveau;
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
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                  color: Colors.amberAccent[700],
                  textColor: Colors.white,
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
                            ResetPwd(_ancien,_nouveau),
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
