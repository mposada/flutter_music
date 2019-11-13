
import 'package:flutter/material.dart';

class AlbumImageWidget extends StatelessWidget {

  final double width;
  final double height;
  final String assetUrl;
  EdgeInsets margins;

  AlbumImageWidget({Key key, this.width, this.height, this.assetUrl, this.margins}) : super(key: key) {
    this.margins = margins ?? EdgeInsets.all(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margins,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(0.0, 4.0), blurRadius: 5.0)
        ],
        image: DecorationImage(
          //image: ExactAssetImage(assetUrl),
          image: NetworkImage(assetUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}