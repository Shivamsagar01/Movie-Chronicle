import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/colors.dart';
import 'searchWidget/custom_search_widget.dart';

class MovieAppBar extends StatefulWidget {
  MovieAppBar({Key? key}) : super(key: key);

  @override
  State<MovieAppBar> createState() => _MovieAppBarState();
}

class _MovieAppBarState extends State<MovieAppBar> {




  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        // height: 60,
        height: MediaQuery.of(context).size.height * 0.07,
        color: Colors.red,
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset('assets/svgs/menu.svg', height: 30,)
            ),
            Expanded(child: Center(child: Text('Movie Chronicle',style: GoogleFonts.aBeeZee(fontSize: 28,fontWeight: FontWeight.bold),))),
            // FutureBuilder(
            //   future: searchMovies,
            //   builder: (context,snapshot){
            //     if(snapshot.hasError){
            //       return Center(
            //         child: Text(snapshot.error.toString()),
            //       );
            //     }else if(snapshot.hasData){
            //       return MovieListTile(snapshot: snapshot,);
            //     }else{
            //       return Center(child: CircularProgressIndicator(),);
            //     }
            //   },
            // )
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomSearch()));

                },
                icon: Icon(Icons.search,color: Colors.white,size: 30,)
            ),
          ],
        ),
      ),
    );
  }
}
