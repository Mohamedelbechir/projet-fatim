import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projet20/bloc/login/login_bloc.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:projet20/pages/login/widgets/CustomClipPath.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>(); // clé pour le formulaire

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _showPassword = false;

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                /* ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey[600], Colors.cyan[200]],
                      ),
                    ),
                  ),
                  clipper: CustomClipPath(),
                ),*/
                SizedBox(height: 20),
                Card(
                  elevation: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/img/logo_sfax.png'),
                  ),
                ),
                Text(
                  "Bienvenue",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _key,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: <Widget>[
                          TextFormField(
                            onSaved: (email) {
                              _email = email;
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(email))
                                return 'email invalide';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: "votre adresse email"),
                          ),
                          TextFormField(
                            obscureText: !_showPassword,
                            onSaved: (password) {
                              _password = password;
                            },
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'mot de passe invalide';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: _showPassword
                                    ? Icon(FontAwesomeIcons.eyeSlash)
                                    : Icon(FontAwesomeIcons.eye),
                              ),
                              labelText: "votre mot de passe",
                            ),
                          ),
                          SizedBox(
                            height: 40, // espace vide
                          ),
                          (state is LoginLoading)
                              ? Center(
                                  child: SpinKitFadingCircle(
                                    color: Colors.blueGrey,
                                    //size: 50.0,
                                  ),
                                )
                              : RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  textColor: Colors.white,
                                  color: Colors.amberAccent[700],
                                  child: Text(
                                    "Se connecter",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    if (_key.currentState.validate()) {
                                      _key.currentState
                                          .save(); // sticker les valeurs dans les variables
                                      // lancer une évemenent login
                                      final bloc = context.bloc<LoginBloc>();
                                      bloc.add(LoginButtonPressed(
                                        user: User(
                                          email: _email,
                                          password: _password,
                                        ),
                                      ));
                                    }
                                  },
                                ),
                          FlatButton(
                            onPressed: () async {
                              const url = 'http://192.168.43.186:8081/register';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("erreur lors de l'ouverture"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: Text("S'inscrire",style: TextStyle(color: Colors.blue[700]),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
