import 'package:flutter_cartelera/model/media.dart';
import 'package:flutter_cartelera/providers/mediaprovider.dart';
import 'package:flutter_cartelera/common/httphandler.dart';

class MovieProvider extends MediaProvider {
  HttpHandler _clienteMovie = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    // TODO: implement fetchMedia
    return _clienteMovie.fetchMovies();
  }

}