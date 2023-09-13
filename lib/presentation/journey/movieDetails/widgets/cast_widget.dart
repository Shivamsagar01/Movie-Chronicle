import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/core/api_constants.dart';

class CastWidget extends StatefulWidget {
  const CastWidget({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  State<CastWidget> createState() => _CastWidgetState();
}

class _CastWidgetState extends State<CastWidget> {

  void _showCastDetails(int index) {
    final castData = widget.snapshot.data[index];
    showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              width: 200,

              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: '${ApiConstants.BASE_IMAGE_URL}${castData.profilePath}',
                      height: 240,
                      fit: BoxFit.cover,
                    )
                  ),
                  SizedBox(height: 10),
                  Text(
                    castData.name,
                    style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    castData.character,
                    style: GoogleFonts.aBeeZee(fontSize: 16,color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
          shrinkWrap:true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.snapshot.data.length,
          itemBuilder: (context, index){
            final castData = widget.snapshot.data[index];
            if (castData.profilePath != null) {
              return GestureDetector(
                onTap: () => _showCastDetails(index),
                child: Container(
                  width: 120,
                  child:Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                          child: AspectRatio(
                            aspectRatio: 120 / 140,
                            child: CachedNetworkImage(
                               imageUrl: '${ApiConstants.BASE_IMAGE_URL}${widget.snapshot.data[index].profilePath}',
                               fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.snapshot.data![index].name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.snapshot.data![index].character.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.aBeeZee(fontSize: 12, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              // Return an empty container for cast members without image URL
              return Container();
            }

          }
      ),
    );
  }
}
