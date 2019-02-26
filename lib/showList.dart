import 'package:flutter/material.dart';
import 'package:flutter_cartelera/model/media.dart';
import 'package:flutter_cartelera/holder/mediaItem.dart';
import 'package:flutter_cartelera/providers/movieprovider.dart';
import 'package:flutter_cartelera/providers/showprovider.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<Media> _media = new List();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await ShowProvider().fetchMedia();

    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MediaItem(_media[index]);
        },
        itemCount: _media.length,
      ),
    );
  }
}
