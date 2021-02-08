import 'package:flutter/material.dart';
import 'package:projet20/bloc/profil/profil_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditTel extends StatefulWidget {
  final UserProfil userProfil;

  const FormEditTel({Key key, @required this.userProfil}) : super(key: key);
  @override
  _FormEditTelState createState() => _FormEditTelState();
}

class _FormEditTelState extends State<FormEditTel> {
  final _formkey = GlobalKey<FormState>();
  int _tel;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Numéro de téléphone'),
            initialValue: widget.userProfil.telephone.toString(),
            validator: (tel) {
              if (tel == null || tel.isEmpty) {
                return 'Numéro de téléphone obligatoire';
              }
              if (!isNumeric(tel)) {
                return 'Numéro de téléphone invalide';
              }
              return null;
            },
            onSaved: (tel) {
              _tel = int.parse(tel);
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
                            UpdateProfil(widget.userProfil.copyWith(
                              telephone: _tel,
                            )),
                          );
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}
