import 'package:flutter/material.dart';
import 'package:flutter_cartelera/model/media.dart';
import 'package:flutter_cartelera/holder/mediaItem.dart';
import 'package:flutter_cartelera/providers/movieprovider.dart';


class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList>
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
    var movies = await MovieProvider().fetchMedia();

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
