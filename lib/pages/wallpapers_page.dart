import 'package:dio_flutter_navigation_app/shared/images_path.dart';
import 'package:flutter/material.dart';

class WallpapersPage extends StatefulWidget {
  const WallpapersPage({super.key});

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: ImagesPath.wallpapers.length,
        itemBuilder: (context, int index) {
          return Center(
            child: Image.asset(
              ImagesPath.wallpapers[index],
            ),
          );
        },
      ),
    );
  }
}
