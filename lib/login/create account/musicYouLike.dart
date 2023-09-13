import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:spotify_clone/login/create%20account/selectArtists.dart';
import 'package:spotify_clone/search/widgets/searchwidget.dart';

class MusicLang {
  final String image;

  MusicLang({required this.image});
}
var countSelection = 0;
class MusicLangSelection extends StatefulWidget {
  @override
  State<MusicLangSelection> createState() => _MusicLangSelectionState();
}

class _MusicLangSelectionState extends State<MusicLangSelection> {
  int selectedArtistsCount = 0;
  final List<MusicLang> artists = [
    MusicLang(image: "assets/images/hindi.png"),
    MusicLang(image: "assets/images/international.png"),
    MusicLang(image: "assets/images/punjabi.png"),
    MusicLang(image: "assets/images/kannada.png"),
    MusicLang(image: "assets/images/tamil.png"),
    MusicLang(image: "assets/images/telugu.png"),
    MusicLang(image: "assets/images/malayalam.png"),
    MusicLang(image: "assets/images/marathi.png"),
    MusicLang(image: "assets/images/gujrati.png"),
    MusicLang(image: "assets/images/bengali.png"),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'What music do you like?',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Stack(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.fromLTRB(20, 0, 30, 8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:3/1.7,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8
                      ),
                      itemCount: artists.length,
                      itemBuilder: (context, index) {
                        return ArtistCard(
                          artist: artists[index],
                          onSelectionChanged: () {
                            setState(() {
                              selectedArtistsCount = countSelection;
                            });
                          },
                        );
                      },
                    ),
                    if (selectedArtistsCount >= 1)
                      Positioned(
                        bottom: 30,
                        left: 135,
                        child: SizedBox(
                          width: 120,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (Context)=>artistSelection()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                              ),
                            ),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ArtistCard extends StatefulWidget {
  final MusicLang artist;
  final VoidCallback? onSelectionChanged;
  const ArtistCard({required this.artist,this.onSelectionChanged});

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          if(isSelected){
            countSelection ++;
          }
          else{
            countSelection --;
          }
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!();
          }
        });

      },
      child: Container(
        // margin: EdgeInsets.all(8),
        width: 200,
        height: 200,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 160,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    // color: Colors.yellow
                  ),
                  child: Image.asset(widget.artist.image),
                ),
                if (isSelected)
                  Positioned(
                    top: 4,
                    right: 3,
                    child:Container(
                        width:30,
                        height: 30,
                        child: Image.asset('assets/images/tickIcon.png',))

                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

