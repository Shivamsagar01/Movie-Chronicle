import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:spotify_clone/search/widgets/searchwidget.dart';

void main() {
  runApp(MyApp());
}

class Artist {
  final String name;
  final String image;

  Artist({required this.name, required this.image});
}

class MyApp extends StatelessWidget {
  final List<Artist> artists = [
    Artist(name: "Artist 1", image: "assets1/OliviaRodrigo.png"),
    Artist(name: "Artist 2", image: "assets1/DojaCat.png"),
    Artist(name: "Artist 3", image: "assets1/TaylorSwift.png"),
    Artist(name: "Artist 4", image: "assets1/WilburSoot.png"),
    Artist(name: "Artist 5", image: "assets1/Drake.png"),
    Artist(name: "Artist 6", image: "assets1/JuiceWRLD.png"),
    Artist(name: "Artist 7", image: "assets1/BTS.png"),
    Artist(name: "Artist 8", image: "assets1/ArianaGrande.png"),
    Artist(name: "Artist 9", image: "assets1/BillieEilish.png"),
    Artist(name: "Artist 10", image: "assets1/BTS.png"),
    Artist(name: "Artist 11", image: "assets1/ArianaGrande.png"),
    Artist(name: "Artist 12", image: "assets1/BillieEilish.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Choose 3 or more artists you like.',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.search,
                      size: 35,
                      color: Color.fromRGBO(83, 83, 83, 1),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Search',
                      style: TextStyle(
                        // fontFamily: 'LibreFranklin',
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 4/4.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 23
                ),
                itemCount: artists.length,
                itemBuilder: (context, index) {
                  return ArtistCard(
                    artist: artists[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ArtistCard extends StatefulWidget {
  final Artist artist;

  const ArtistCard({required this.artist});

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
                  child: GFAvatar(
                    shape: GFAvatarShape.circle,
                    // borderRadius: BorderRadius.all(Radius.circular(2)),
                    backgroundImage: AssetImage(
                      widget.artist.image,
                    ),
                    radius: 58,
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.artist.name,
              style: TextStyle(fontSize: 16,color: Colors.white),
              textAlign: TextAlign.center,

            ),
          ],
        ),
      ),
    );
  }
}

