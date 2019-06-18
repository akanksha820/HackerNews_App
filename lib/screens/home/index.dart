import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:hacknewsapp/data/news_scoped_model.dart';

class Home extends StatefulWidget {
  @override
  MyHomeState createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<Home> with SingleTickerProviderStateMixin {
  NewsModel newsModel = NewsModel();

  List<Color> colours = [
    Colors.indigo,
    Colors.red,
    Colors.brown,
    Colors.green,
    Colors.lightBlue,
    Colors.pink,
    Colors.blueGrey,
    Colors.amber,
    Colors.cyan,
    Colors.deepPurpleAccent
  ];
  DateTime date;

  DateTime _parseToTime(str) {
    print(str);
    date = new DateTime.fromMicrosecondsSinceEpoch(str * 1000);
    print(date);
    return date;
  }

  @override
  void initState() {
    super.initState();
    newsModel.getId();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NewsModel>(
        model: newsModel,
        child: ScopedModelDescendant<NewsModel>(
            builder: (BuildContext context, Widget child, NewsModel model) {
          print("here => ${model.newsList}");
          return Scaffold(
            body: model.isLoading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                          0.0,
                          0.3,
                          0.5,
                          0.9
                        ],
                            colors: [
                          Colors.red[200],
                          Colors.pink[200],
                          Colors.red[200],
                          Colors.pink[200],
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 44),
                          child: Text("Hacker News",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.newsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  _launchURL(model.newsList[index].url);
                                },
                                child: Card(
                                  margin: EdgeInsets.only(left: 15),
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: colours[index],
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        width: 300,
                                        height: 150,
                                        child: Text(model.newsList[index].title,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 200, right: 10),
                                          child: Text(
                                              " by~${model.newsList[index].by}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white))),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50.0, left: 250),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.score,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                            Text(
                                                (model.newsList[index].score)
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      //date
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 180.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.access_time,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                RichText(
                                                  text: TextSpan(
                                                    text: _parseToTime(model
                                                            .newsList[index]
                                                            .time)
                                                        .day
                                                        .toString(),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: '-',
                                                      ),
                                                      TextSpan(
                                                          text: _parseToTime(
                                                                  model
                                                                      .newsList[
                                                                          index]
                                                                      .time)
                                                              .month
                                                              .toString()),
                                                      TextSpan(
                                                        text: '-',
                                                      ),
                                                      TextSpan(
                                                        text: _parseToTime(model
                                                                .newsList[index]
                                                                .time)
                                                            .year
                                                            .toString(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      //time
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 250.0),
                                        child: Row(
                                          children: <Widget>[
                                            RichText(
                                                text: TextSpan(
                                                    text: _parseToTime(model
                                                            .newsList[index]
                                                            .time)
                                                        .hour
                                                        .toString(),
                                                    children: <TextSpan>[
                                                  TextSpan(text: ":"),
                                                  TextSpan(
                                                      text: _parseToTime(model
                                                              .newsList[index]
                                                              .time)
                                                          .minute
                                                          .toString()),
                                                  TextSpan(text: ":"),
                                                  TextSpan(
                                                      text: _parseToTime(model
                                                              .newsList[index]
                                                              .time)
                                                          .second
                                                          .toString()),
                                                ]))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        }));
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
