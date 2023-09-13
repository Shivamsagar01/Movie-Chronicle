import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../data/core/api_constants.dart';
import '../../../../data/models/movie_genre.dart';
import '../../../../data/models/movie_model.dart';
import 'movie_detail_appbar.dart';
import 'package:http/http.dart'as http;

class BigPoster extends StatefulWidget {
  BigPoster({Key? key, required this.movieModel}) : super(key: key);
  final MovieModel movieModel;

  @override
  State<BigPoster> createState() => _BigPosterState();
}

class _BigPosterState extends State<BigPoster> {
  final MovieGenre movieGenre = MovieGenre();
  late List<int?> genreIds;
  late List<String?> genreNames;

  // late String image;

  Future<void> shareImage() async {
    final uri = Uri.parse('${ApiConstants.BASE_IMAGE_URL}${widget.movieModel.posterPath}');
    final res = await http.get(uri);
    final bytes = res.bodyBytes;
    // Request permission to access the device's storage
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final tempDir = await getTemporaryDirectory();
      final imagePath = '${tempDir.path}/${widget.movieModel.title}.jpg';
      final imageFile = File(imagePath);
      imageFile.writeAsBytesSync(bytes);

      if (imageFile.existsSync()) {
        await Share.shareFiles([imagePath],
          text: '🍿 Discover "${widget.movieModel.title}" - the perfect recipe for cinematic delight! 🌟 Grab your popcorn and get ready for a thrilling adventure. 🎬🔥 #MovieMagic #MustSee',
        );
      } else {
        print('Failed to write image to temporary directory.');
      }
    }else {
      print('Permission to access storage denied.');
    }
  }

  String convertToPercentage(double decimalNumber) {
    double percentage = decimalNumber * 10; // Convert to percentage
    return '${percentage.toStringAsFixed(1)}%'; // Format to one decimal place
  }



  @override
  void initState() {
    super.initState();
    genreIds = widget.movieModel.genreIds!;
    genreNames = genreIds.map((genreId) => movieGenre.genreMap[genreId]).toList();
    // image = '${ApiConstants.BASE_IMAGE_URL}${widget.movieModel.posterPath}';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
              stops: [0.5, 0.85],
            ),
          ),
          child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}${widget.movieModel.posterPath}',
              filterQuality: FilterQuality.high,
          )
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        child: Text(
                          widget.movieModel.title,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0,right: 8),
                        child:IconButton(
                            onPressed:()  async{
                              // final image = '${ApiConstants.BASE_IMAGE_URL}${widget.movieModel.posterPath}';
                              // final url = Uri.parse(image);
                              // final response = await http.get(url);
                              // Share.shareXFiles(
                              //     [
                              //       XFile.fromData(
                              //         response.bodyBytes,
                              //         name: '${widget.movieModel.title}',
                              //         mimeType: 'image/jpg',
                              //       )
                              //     ],
                              //   subject: 'Shared Movie'
                              // );
                              await shareImage();

                            },
                            icon: Icon(Icons.share_rounded,size: 25,)
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 270,
                        child: Text( genreNames.join(", "),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.white),),
                      ),
                      Text(
                        convertToPercentage(widget.movieModel.voteAverage),
                        style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.movieModel.releaseDate,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,color: Colors.grey
                        ),
                      ),
                      Text(
                        'Votes: ${widget.movieModel.voteCount}',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Positioned(
            left: 12,
            right: 12,
            child: MovieDetailAppbar(movieModel: widget.movieModel,)
        )
      ],
    );
  }
}


