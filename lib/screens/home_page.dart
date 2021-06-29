import 'package:flutter/material.dart';
import 'package:flutter_short_videos/screens/widgets/content_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  final List<String> videos = [
    "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
    "https://d1bi06lvfso9he.cloudfront.net/hls/351.m3u8",
    "https://d1bi06lvfso9he.cloudfront.net/hls/350.m3u8",
    "https://d1bi06lvfso9he.cloudfront.net/hls/349.m3u8",
    "https://d1bi06lvfso9he.cloudfront.net/hls/255.m3u8",
    "https://d1bi06lvfso9he.cloudfront.net/hls/256.m3u8",
    "https://d1bi06lvfso9he.cloudfront.net/hls/215.m3u8",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              //We need swiper for every content
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ContentWidget(
                    src: videos[index],
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flutter Short Videos',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
