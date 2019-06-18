// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'package:hacknewsapp/data/news.dart';
// import 'package:hacknewsapp/models/News.dart';
// import 'package:hacknewsapp/services/api.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ListNews extends StatefulWidget {
//   NewsModel newsModel = NewsModel();

//   @override
//   ListNewsState createState() {
//     return ListNewsState();
//   }
// }

// class ListNewsState extends State<ListNews>
//     with SingleTickerProviderStateMixin {

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     stops: [
//                   0.0,
//                   0.3,
//                   0.5,
//                   0.9
//                 ],
//                     colors: [
//                   Colors.red[200],
//                   Colors.pink[200],
//                   Colors.red[200],
//                   Colors.pink[200],
//                 ])),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(top: 44),
//                   child: Text("Hacker News",
//                       style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white)),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height / 2,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: newsList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return InkWell(
//                         onTap: () {
//                           _launchURL(newsList[index].url);
//                         },
//                         child: Card(
//                           margin: EdgeInsets.only(left: 15),
//                           elevation: 8,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                           color: colours[index],
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 padding: EdgeInsets.all(12),
//                                 width: 300,
//                                 height: 150,
//                                 child: Text(newsList[index].title,
//                                     softWrap: true,
//                                     style: TextStyle(
//                                         fontSize: 24,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold)),
//                               ),
//                               Container(
//                                   margin: EdgeInsets.only(left: 200, right: 10),
//                                   child: Text(" by~${newsList[index].by}",
//                                       style: TextStyle(
//                                           fontSize: 18, color: Colors.white))),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 50.0, left: 250),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.score,
//                                       size: 30,
//                                       color: Colors.white,
//                                     ),
//                                     Text((newsList[index].score).toString(),
//                                         style: TextStyle(
//                                             fontSize: 15, color: Colors.white)),
//                                   ],
//                                 ),
//                               ),
//                               //date
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 30.0, left: 180.0),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.access_time,
//                                       size: 30,
//                                       color: Colors.white,
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(right: 20),
//                                     ),
//                                     Row(
//                                       children: <Widget>[
//                                         RichText(
//                                           text: TextSpan(
//                                             text: _parseToTime(
//                                                     newsList[index].time)
//                                                 .day
//                                                 .toString(),
//                                             children: <TextSpan>[
//                                               TextSpan(
//                                                 text: '-',
//                                               ),
//                                               TextSpan(
//                                                   text: _parseToTime(
//                                                           newsList[index].time)
//                                                       .month
//                                                       .toString()),
//                                               TextSpan(
//                                                 text: '-',
//                                               ),
//                                               TextSpan(
//                                                 text: _parseToTime(
//                                                         newsList[index].time)
//                                                     .year
//                                                     .toString(),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               //time
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 250.0),
//                                 child: Row(
//                                   children: <Widget>[
//                                     RichText(
//                                         text: TextSpan(
//                                             text: _parseToTime(
//                                                     newsList[index].time)
//                                                 .hour
//                                                 .toString(),
//                                             children: <TextSpan>[
//                                           TextSpan(text: ":"),
//                                           TextSpan(
//                                               text: _parseToTime(
//                                                       newsList[index].time)
//                                                   .minute
//                                                   .toString()),
//                                           TextSpan(text: ":"),
//                                           TextSpan(
//                                               text: _parseToTime(
//                                                       newsList[index].time)
//                                                   .second
//                                                   .toString()),
//                                         ]))
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           )
//         : Center(
//             child: CircularProgressIndicator(),
//           );
//   }

//   _launchURL(url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
