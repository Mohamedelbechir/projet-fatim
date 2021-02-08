import 'package:flutter/material.dart';
import 'package:projet20/bloc/profil/profil_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEditEmail extends StatefulWidget {
  final UserProfil userProfil;

  const FormEditEmail({Key key, @required this.userProfil}) : super(key: key);
  @override
  _FormEditEmailState createState() => _FormEditEmailState();
}

class _FormEditEmailState extends State<FormEditEmail> {
   final _formkey = GlobalKey<FormState>();
  String _email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        // pour que la modal se lève lorsqu'on commence à taper dans le champ texte
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            initialValue: widget.userProfil.email,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Email obligatoire';
              }
              return null;
            },
            onSaved: (email){
              _email=email;
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
                            UpdateProfil(widget.userProfil
                                .copyWith(email: _email,)),
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
