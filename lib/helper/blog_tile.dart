// Blog tile
import 'package:flutter/material.dart';
import 'package:shortify/helper/imageSpinner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shortify/views/article_view.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, source, url, date;

  BlogTile(
      {this.imageUrl, this.title, this.desc, this.source, this.date, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF282B30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => ImageSpinner(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 273,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                child: Card(
                  color: Color(0xFF282B30),
                  elevation: 0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 19,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        desc.length > 200 ? desc.substring(0, 190) : desc,
                        style: GoogleFonts.roboto(
                          color: Colors.white60,
                          fontSize: 14,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              ' - shorts by $source',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.white30),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(articleUrl: url),
                  ),
                );
              },
              color: Color(0xeeFCBC35),
              textColor: Colors.white,
              child: Text(
                'Read Full Story',
                style: TextStyle(fontSize: 20),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            ),
          ),
        ],
      ),
    );
  }
}
