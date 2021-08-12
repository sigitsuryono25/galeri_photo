import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.indigo,
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop(context),
        ),
      ),
      body: Container(
        child: PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.transparent),
          imageProvider: NetworkImage(this.url),
        ),
      ),
    );
  }
}
