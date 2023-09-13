import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/core/api_constants.dart';
import '../../../../../data/models/movie_genre.dart';
import '../../../movieDetails/movie_detail_screen.dart';

class SearchedMovieTiles extends StatefulWidget {
  const SearchedMovieTiles({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;


  @override
  State<SearchedMovieTiles> createState() => _SearchedMovieTilesState();
}

class _SearchedMovieTilesState extends State<SearchedMovieTiles> {
  final MovieGenre movieGenre = MovieGenre();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
          shrinkWrap:true,
          scrollDirection: Axis.vertical,
          itemCount: widget.snapshot.data.length,
          itemBuilder: (context, index){
            final movieSearched = widget.snapshot.data[index];
            final genreIds = widget.snapshot.data![index].genreIds;
            final genreNames = genreIds.map((genreId) => movieGenre.genreMap[genreId]).toList();
            if (movieSearched.posterPath == '') {
              return Container();
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetailScreen(movieModel: widget.snapshot.data[index])));
                      },
                      child: Row(
                        children: [
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              child: CachedNetworkImage(
                                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${widget.snapshot.data[index].posterPath }',
                                // fit: BoxFit.cover,
                                width: 100,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( widget.snapshot.data![index].title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400),),
                                  Text( genreNames.join(", "),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.white),),
                                  Text( widget.snapshot.data![index].overview.toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.grey.shade500),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text( 'Votes: ${widget.snapshot.data![index].voteAverage}/10',
                                        style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.red),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text( 'People: ${widget.snapshot.data![index].voteCount}',
                                          style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.red),),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
              );
            }

          }
      ),
    );

  }
}
