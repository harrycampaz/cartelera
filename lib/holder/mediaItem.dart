import 'package:flutter/material.dart';
import 'package:flutter_cartelera/model/media.dart';

class MediaItem extends StatelessWidget {
  final Media media;
  MediaItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "assets/placeholder.jpg",
                  image: media.getBackdropPath(),
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 40),
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
                    constraints: BoxConstraints.expand(height: 55.0),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 350,
                        child: Text(
                          media.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 250,
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          media.getGenres(),
                          style: TextStyle(fontWeight: FontWeight.normal),
                          //Maximo una linea
                          maxLines: 1,
                          // Si el texto sobre pasa el tamano muestra puntos suspencivos
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 10,
                  child: Column(children: <Widget>[
                    Row(children: <Widget>[
                      Text(media.voteAverage.toString()),
                      Container(width: 6),
                      Icon(Icons.star, color: Colors.white, size: 18,)
                    ],),
                    Container(height: 4,),
                    Row(
                      children: <Widget>[
                        Text(media.getRealeaseYear().toString()),
                        Container(width: 4),
                        Icon(Icons.date_range, color: Colors.white, size: 17,)
                      ],
                    )

                  ],),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
