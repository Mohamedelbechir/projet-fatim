import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projet20/bloc/form_demande/form_demande_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toast/toast.dart';

class FormAddDemande extends StatefulWidget {
  final List<Service> services;

  FormAddDemande({Key key, @required this.services}) : super(key: key);

  @override
  _FormAddDemandeState createState() => _FormAddDemandeState();
}

class _FormAddDemandeState extends State<FormAddDemande> {
  final _keyFormAdd = GlobalKey<FormState>();
  String _description;
  int _idService;

  @override
  void initState() {
    _idService = widget.services.first.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormDemandeBloc, FormDemandeState>(
      listener: (context, state) {
        if (state is AjoutSuccess) {
          Toast.show(
            state.message,
            context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.CENTER,
            backgroundColor: Colors.green,
          );
        } else if (state is AjoutEchouer) {
          Toast.show(
            state.message,
            context,
            // textColor: ,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.CENTER,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (_, state) {
        return Form(
          key: _keyFormAdd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Container(
                  width: 50,
                  height: 4,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                maxLength: 255,
                onSaved: (description) {
                  _description = description;
                },
                validator: (description) {
                  if (description == null || description.isEmpty) {
                    return 'Description obligatoire';
                  }
                  return null;
                },
                decoration: InputDecoration(),
              ),
              Text(
                'Type de service',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<int>(
                items: widget.services.map(
                  (Service service) {
                    return DropdownMenuItem<int>(
                      child: Text(service.type),
                      value: service.id,
                    );
                  },
                ).toList(),
                value: _idService,
                onSaved: (int idService) {
                  _idService = idService;
                },
                onChanged: (int idService) {
                  setState(() {
                    _idService = idService;
                  });
                },
              ),
              SizedBox(height: 20),
              (state is AjoutEnCour)
                  ? Center(
                      child: SpinKitFadingCircle(
                        color: Colors.blueGrey,
                        //size: 50.0,
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        color: Colors.amberAccent[700],
                        textColor: Colors.white,
                        child: Text(
                          'Ajouter',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (_keyFormAdd.currentState.validate()) {
                            _keyFormAdd.currentState.save();
                            context.bloc<FormDemandeBloc>().add(
                                  AjouterDemande(
                                    demandeInput: DemandeInput(
                                      description: _description,
                                      service: _idService,
                                    ),
                                  ),
                                );
                          }
                        },
                      ),
                    ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        );
      },
    );
  }
}
