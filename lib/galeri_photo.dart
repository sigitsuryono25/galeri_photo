import 'package:breakpoint/breakpoint.dart';
import 'package:flutter/material.dart';
import 'package:galeri_photo/viewers.dart';

void main() => runApp(GaleriApp());

class GaleriApp extends StatelessWidget {
  const GaleriApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: GaleriScreen(),
    );
  }
}

class GaleriScreen extends StatefulWidget {
  const GaleriScreen({Key? key}) : super(key: key);

  @override
  _GaleriScreenState createState() => _GaleriScreenState();
}

class _GaleriScreenState extends State<GaleriScreen> {
  var photo = [
    "https://image.freepik.com/free-photo/pathway-middle-green-leafed-trees-with-sun-shining-through-branches_181624-4539.jpg",
    "https://image.freepik.com/free-photo/close-up-red-ripe-organic-strawberries-plant-modern-greenhouse-concept-delicious-fresh-berries-grow-garden-bush_7502-8962.jpg",
    "https://image.freepik.com/free-photo/mount-fuji-lake-kawaguchiko-sunrise-vintage_30824-49.jpg",
    "https://image.freepik.com/free-photo/river-surrounded-by-forests-cloudy-sky-thuringia-germany_181624-30863.jpg",
    "https://image.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",
    "https://img.freepik.com/free-photo/sunny-meadow-landscape_1112-134.jpg?size=338&ext=jpg",
    "https://image.freepik.com/free-photo/fields-greenhouse_181624-17783.jpg",
    "https://image.freepik.com/free-photo/sunrise-bali-jungle_1385-1644.jpg",
    "https://image.freepik.com/free-photo/beautiful-tree-middle-field-covered-with-grass-with-tree-line-background_181624-29267.jpg",
    "https://image.freepik.com/free-photo/breathtaking-shot-beautiful-stones-turquoise-water-lake-hills-background_181624-12847.jpg",
    "https://image.freepik.com/free-photo/panoramic-view-field-covered-grass-trees-sunlight-cloudy-sky_181624-9801.jpg",
    "https://image.freepik.com/free-photo/mesmerizing-view-silhouettes-trees-sunset-sky_181624-28704.jpg",
    "https://image.freepik.com/free-photo/breathtaking-shot-sea-dark-purple-sky-filled-with-stars_181624-23013.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final _breakPoint = Breakpoint.fromMediaQuery(context);

    return BreakpointBuilder(
      builder: (context, breakpoint) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Galeri Foto"),
          ),
          body: Container(
            child: GridView.builder(
              itemCount: photo.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _breakPoint.columns,
              ),
              itemBuilder: (context, index) {
                return GridTile(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhotoViewer(
                            url: photo[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: Center(
                        child: Image.network(
                          photo[index],
                          fit: BoxFit.cover,
                          width: 500,
                          height: 275,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
