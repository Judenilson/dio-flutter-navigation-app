import 'package:dio_flutter_navigation_app/shared/images_path.dart';
import 'package:flutter/material.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded( flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(elevation: 8,
                  child: Image.asset(
                    ImagesPath.wallpapers[0],
                  ),
                ),
                Card(elevation: 8,
                  child: Image.asset(
                    ImagesPath.wallpapers[1],
                  ),
                ),
                Card(elevation: 8,
                  child: Image.asset(
                    ImagesPath.wallpapers[2],
                  ),
                ),
                Card(elevation: 8,
                  child: Image.asset(
                    ImagesPath.wallpapers[3],
                  ),
                ),
                Card(elevation: 8,
                  child: Image.asset(
                    ImagesPath.wallpapers[4],
                  ),
                ),
                Card(elevation: 8,
                  child: Image.asset(
                    ImagesPath.wallpapers[5],
                  ),
                ),
              ],
            ),
          ),
          Expanded( flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
