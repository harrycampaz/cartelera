import 'package:flutter/material.dart';
import 'package:flutter_cartelera/mediaList.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        drawer: _getDrawer(context),
        bottomNavigationBar: BottomNavigationBar(
          items: _getFotterItem(),
        ),
        body: PageView( children: <Widget>[
          MediaList(),
        ],),
    );
  }

  _getFotterItem() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text("Populares")),
      BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text("Proximamente")),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text("Mejor valoradas")),
    ];
  }

  Drawer _getDrawer(BuildContext context) {
    var header = DrawerHeader(child: Text("Harry Campaz"));
    var footer = AboutListTile(
      child: Text("Info"),
      applicationIcon: Icon(Icons.favorite),
      icon: Icon(Icons.info),
      applicationVersion: "v1.0",
      applicationName: "Demo Cartelera",
    );
    ListTile _getItem(Icon icon, String description, String route) {
      return ListTile(
        trailing: icon,
        title: Text(description),
        onTap: () {
          if (route == "cerrar")
            Navigator.of(context).pop();
          else
            Navigator.of(context).pushNamed(route);
        },
      );
    }

    ListView listView = ListView(
      children: <Widget>[
        header,
        _getItem(
          Icon(Icons.movie),
          "Peliculas",
          "/setting",
        ),
        Divider(height: 5.0),
        _getItem(
          Icon(Icons.tv),
          "Television",
          "/battery",
        ),
        Divider(height: 5.0),
        _getItem(
          Icon(Icons.close),
          "Cerrar",
          "cerrar",
        ),
        Divider(
          height: 5.0,
        ),
        footer
      ],
    );

    return Drawer(
      child: listView,
    );
  }
}
