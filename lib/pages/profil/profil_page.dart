import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projet20/bloc/authentification/authentification_bloc.dart';
import 'package:projet20/bloc/profil/profil_bloc.dart';
import 'package:projet20/pages/profil/widgets/form_edit_email.dart';
import 'package:projet20/pages/profil/widgets/form_edit_nom.dart';
import 'package:projet20/pages/profil/widgets/form_edit_tel.dart';
import 'package:toast/toast.dart';

import 'widgets/form_edit_pwd.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
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
            child: Text(
              'Mon profil',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(0),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<ProfilBloc, ProfilState>(
                  buildWhen: (prevState, nextState) {
                    return nextState is ProfilCharge ||
                        nextState is ProfilInitial;
                  },
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ProfilCharge) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                               /* ListTile(
                                  title: Text('CNRPS'),
                                  subtitle: Text(state.userProfil.IdUnique),
                                  leading: Icon(Icons.scatter_plot,
                                      color: Colors.blueGrey[900]),
                                  trailing:
                                      Icon(Icons.edit, color: Colors.grey),
                                  onTap: () {
                                    //_onEditCNRPS(state.userProfil)
                                    _showEditModal(
                                      content: FormEditCnrps(
                                        userProfil: state.userProfil,
                                      ),
                                    );
                                  },
                                ),*/
                                ListTile(
                                  title: Text('Nom et Prenom'),
                                  subtitle: Text(state.userProfil.nom +
                                      " " +
                                      state.userProfil.prenom),
                                  leading: Icon(Icons.person,
                                      color: Colors.blueGrey[900]),
                                  trailing:
                                      Icon(Icons.edit, color: Colors.grey),
                                  onTap: () {
                                    //_onEditNom(state.userProfil)
                                    _showEditModal(
                                      content: FormEditNom(
                                          userProfil: state.userProfil),
                                    );
                                  },
                                ),
                                ListTile(
                                  title: Text('Adresse email'),
                                  subtitle: Text(state.userProfil.email),
                                  leading: Icon(Icons.email,
                                      color: Colors.blueGrey[900]),
                                  trailing:
                                      Icon(Icons.edit, color: Colors.grey),
                                  onTap: () {
                                    _showEditModal(
                                      content: FormEditEmail(
                                          userProfil: state.userProfil),
                                    );
                                  },
                                ),
                                ListTile(
                                  title: Text('Numéro de téléphone'),
                                  subtitle: Text(
                                      state.userProfil.telephone.toString()),
                                  leading: Icon(Icons.phone,
                                      color: Colors.blueGrey[900]),
                                  trailing:
                                      Icon(Icons.edit, color: Colors.grey),
                                  onTap: () {
                                    _showEditModal(
                                      content: FormEditTel(
                                          userProfil: state.userProfil),
                                    );
                                  },
                                ),
                                Divider(),
                                ListTile(
                                  title: Text('Changer le mot de passe'),
                                  leading: Icon(Icons.security,
                                      color: Colors.blueGrey[900]),
                                  trailing:
                                      Icon(Icons.edit, color: Colors.grey),
                                  onTap: () {
                                    _showEditModal(
                                      content: FormEditPwd(
                                          userProfil: state.userProfil),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlineButton(
                              textColor: Colors.amberAccent[700],
                              color: Colors.amberAccent[700],
                              borderSide:
                                  BorderSide(color: Colors.amberAccent[700]),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              child: Text('Se deconnecter',
                                  style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                context.bloc<AuthentificationBloc>().add(LoggedOut());
                              },
                            ),
                          )
                        ],
                      );
                    }
                    return Center(
                      child: SpinKitFadingCircle(color: Colors.blueGrey),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showEditModal({@required Widget content}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Center(child: Container(width: 50, height: 4, color: Colors.grey)),
            SizedBox(height: 15),
            // ? le contenu du modal ici
            Padding(
              padding: EdgeInsets.all(10),
              child: BlocProvider.value(
                value: context.bloc<ProfilBloc>(),
                child: BlocListener<ProfilBloc, ProfilState>(
                    listener: (__, state) {
                      if (state is UpdateProfilSuccess) {
                        _displayToast(state.message, Colors.green);
                      } else if (state is UpdateProfilEchouer) {
                        _displayToast(state.message, Colors.red);
                      }
                    },
                    child: content),
              ),
            ),
            // ? pour pousser le modal en haut
            SizedBox(height: MediaQuery.of(_).viewInsets.bottom),
          ],
        );
      },
    );
  }

  _displayToast(String message, Color color) {
    Toast.show(
      message,
      context,
      duration: Toast.LENGTH_SHORT,
      gravity: Toast.CENTER,
      backgroundColor: color,
    );
  }

  /*
  _onEditNom(UserProfil userProfil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: FormEditNom(userProfil: userProfil),
        );
      },
    );
  }

  _onEditCNRPS(UserProfil userProfil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: FormEditCnrps(userProfil: userProfil),
        );
      },
    );
  }

  _onEditEmail(UserProfil userProfil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: FormEditEmail(
            userProfil: userProfil,
          ),
        );
      },
    );
  }

  _onEditTel(UserProfil userProfil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: FormEditTel(
            userProfil: userProfil,
          ),
        );
      },
    );
  }

  _onEditPwd(UserProfil userProfil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: FormEditPwd(
            userProfil: userProfil,
          ),
        );
      },
    );
  }
  */
}
