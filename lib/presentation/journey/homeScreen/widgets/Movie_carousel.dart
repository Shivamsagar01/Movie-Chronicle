import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/core/api_constants.dart';
import '../../movieDetails/movie_detail_screen.dart';

class Movie_Carousel extends StatelessWidget {
  const Movie_Carousel({super.key,required this.snapshot });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
            itemCount: 10,
            options: CarouselOptions(
              // aspectRatio:
              height: MediaQuery.of(context).size.height * 0.37,
              autoPlay: true,
              viewportFraction: 0.55,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return Padding(
                padding: const EdgeInsets.only(left: 5,),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetailScreen(movieModel: snapshot.data[itemIndex],)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.36,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: CachedNetworkImage(
                          imageUrl: '${ApiConstants.BASE_IMAGE_URL}${snapshot.data[itemIndex].posterPath }',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}


