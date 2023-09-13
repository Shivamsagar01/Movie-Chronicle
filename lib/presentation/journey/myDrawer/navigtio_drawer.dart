import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_chronicle/presentation/journey/favouriteMovie/favourite_screen.dart';

import '../../widgets/aboutDialog.dart';
import '../wachedMovies/watched_movies.dart';
import '../watchLater/watch_later_movies.dart';

final String description = "In this app, you can explore movies, mark them as favorites, watched, or pending. Additionally, you can recommend movies to your friends by sharing the movie details with them";
class navigationDrawer extends StatelessWidget {
  const navigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900.withOpacity(0.9),
      width: 300,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top:12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){},
              child: Center(
                child: ClipRRect(
                    child: Container(
                  width: 150,
                  height:150,                           // (if user logged in && user has photo) ? display users photo : display default logo
                     child: Image.asset('assets/pngs/userLogo.png'), //write condinal statement here
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: (){

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Shivam Sagar',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.edit,size: 20,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextButton(
                onPressed: (){
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>FavouriteMovieScreen()
                       ),
                   );
                },
                child: Text('Favourite Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>WatchedMovieScreen()
                    ),
                  );
                },
                child: Text('Watched Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>WatchLaterMovieScreen()
                    ),
                  );
                },
                child: Text('Watch Later',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){

              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text('Log Out',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 24,color: Colors.red
                      ),
                    ),
                  ),
                  SizedBox(width:10),
                  Icon(Icons.logout_outlined,color: Colors.red,)
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextButton(onPressed: (){
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ShowMyDialog(
                          title: 'About',
                          description: description,
                          buttonText: 'Okay',
                        );
                      },
                    );

                  },
                    child: Text('About this App',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 15,color: Colors.white
                      ),
                    ),)
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}


// ShowMyDialog(title:'About',description:description,buttonText: 'Okay');