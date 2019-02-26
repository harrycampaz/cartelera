import 'package:flutter_cartelera/model/media.dart';

import 'dart:async';
abstract class MediaProvider {
  Future<List<Media>> fetchMedia();
}

