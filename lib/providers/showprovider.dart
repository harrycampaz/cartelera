import 'package:flutter_cartelera/model/media.dart';
import 'package:flutter_cartelera/providers/mediaprovider.dart';
import 'package:flutter_cartelera/common/httphandler.dart';

class ShowProvider extends  MediaProvider {
  HttpHandler _clientShow = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia() {
    // TODO: implement fetchMedia
    return _clientShow.fetchShow();
  }

}