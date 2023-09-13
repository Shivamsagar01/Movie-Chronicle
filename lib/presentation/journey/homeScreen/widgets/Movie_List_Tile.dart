import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/core/api_constants.dart';
import 'package:movie_chronicle/common/extentions/trimStrings.dart';

import '../../movieDetails/movie_detail_screen.dart';

class MovieListTile extends StatelessWidget {
 const MovieListTile({Key? key,required this.snapshot}) : super(key: key);
 final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index){
            final trimmedTitle = trimMovieTitle(snapshot.data[index].title);
            final trimmedVote = trimMovieVote(snapshot.data[index].voteAverage.toString());
            return Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetailScreen(movieModel: snapshot.data[index])));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          // color: Colors.amber,
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.37,
                          child: CachedNetworkImage(
                              imageUrl: '${ApiConstants.BASE_IMAGE_URL}${snapshot.data[index].posterPath }',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                          )
                          // Image.network(
                          //     filterQuality: FilterQuality.high,
                          //     fit: BoxFit.cover,
                          //     '${ApiConstants.BASE_IMAGE_URL}${snapshot.data[index].posterPath }'
                          // ),
                        ),
                      ),
                    ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.012,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    trimmedTitle,
                    style: GoogleFonts.aBeeZee(fontSize: 16,),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                Text(
                  'Votes: $trimmedVote',
                  style: GoogleFonts.aBeeZee(fontSize: 16,),
                ),
              ],
            );
          }
      )
    );
  }
}
