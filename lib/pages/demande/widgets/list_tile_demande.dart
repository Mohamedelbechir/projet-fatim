import 'package:flutter/material.dart';
import 'package:projet20/models/models_classes.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListTileDemande extends StatelessWidget {
  final DemandeListing demandeListing;

  ListTileDemande({Key key, this.demandeListing}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            width: .3,
            color: _boderColor(demandeListing.etat.toString()),
          ),
          borderRadius: BorderRadius.circular(5)),
      /* child: Card(
       child: ,
       ),*/
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: _boderColor(demandeListing.etat.toString()),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  demandeListing.type,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900]),
                ),
                Text(_subTitle(demandeListing.etat, demandeListing.dateFin),
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(color: Colors.grey)),
              ],
            ),
          ],
        ),
        onTap: () => _onSelectActu(context, demandeListing),
      ),
    );
  }

  _onSelectActu(context, DemandeListing demandeListing) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 350,
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
              SizedBox(height: 20),
              Text(
                demandeListing.type,
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(demandeListing.description)
            ],
          ),
        );
      },
    );
  }

  Color _boderColor(String etat) {
    switch (etat) {
      case "0":
        return Colors.blue;
        break;
      case "1":
        return Colors.green;
        break;
      case "2":
        return Colors.red;
        break;
      default:
        return Colors.grey;
    }
  }

  String _subTitle(int etat, DateTime date) {
    String res = '';
    switch (etat) {
      case 0:
        res = "en cours ";
        break;
      case 1:
        res = "finalisée ";
        break;
      case 2:
        res = "réjetée ";
        break;
      default:
        res = "";
    }
    if (date != null) return res + timeago.format(date, locale: 'fr');
    return res;
  }
}
