import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class MovieVideoWidget extends StatefulWidget {
const MovieVideoWidget({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  State<MovieVideoWidget> createState() => _MovieVideoWidgetState();


}

class _MovieVideoWidgetState extends State<MovieVideoWidget> {
  void _showVideoDialog(String videoId) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.grey.shade900.withOpacity(0.8),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator:true ,
                    progressIndicatorColor: Colors.red,
                    progressColors: const ProgressBarColors(
                        playedColor: Colors.red,
                        handleColor: Colors.grey
                    ),
                  ),
                  builder: (context, player){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 30 ,),
                          player,
                          SizedBox(height: 20 ,),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red,
                            ),
                            child: ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Set background color to transparent
                                  elevation: MaterialStateProperty.all<double>(0), // Remove button elevation
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                child:Center(child: Text('Close',style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.white),)) ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: ElevatedButton(
            onPressed: () {
              final int index = getTrailer();
              _showVideoDialog(widget.snapshot.data[index].key.toString());
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Center(
                child: Text(
              'Watch Trailer',
              style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
            ))),
      );
  }

  int getTrailer() {
    int index =0;
    for(int i=1;i<widget.snapshot.data.length;i++ ){
      if((widget.snapshot.data[i].type.toString()=="Trailer")||(widget.snapshot.data[i].type.toString()=="Teaser")){
        if(widget.snapshot.data[i].type.toString()=="Trailer"){
          index =i;
          return index;
        }
        else{
          index =i;
        }
      }
    }
    return index;
  }
}
