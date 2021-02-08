import 'package:flutter/material.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListTileActualite extends StatelessWidget {
  final Actualite actualite;

  ListTileActualite({Key key, this.actualite}) : super(key: key) {
    // changer la langue en français de timeago
    timeago.setLocaleMessages('fr', timeago.FrMessages());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: .3, color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        // ${ je suis un string }
        title: Text(
          '${actualite.titre}',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900]),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            actualite.image,
            height: 50,
            width: 50,
          ),
        ),
        subtitle: Text(timeago.format(actualite.dateDebut, locale: 'fr')),
        // trailing: Icon(Icons.arrow_forward),
        onTap: () => _onSelectActu(context, actualite),
      ),
    );
  }

  _onSelectActu(context, Actualite actualite) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          padding: const EdgeInsets.all(20.0),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  width: 50,
                  height: 4,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  actualite.image,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 20),
              Text(
                actualite.titre,
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child:
                    Container(child: SingleChildScrollView(child: Text(actualite.description))),
              )
            ],
          ),
        );
      },
    );
  }
}
