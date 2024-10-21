import 'package:flutter/material.dart';
import 'package:news_app/service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ApiHelper.getNews().then((value) {
      setState(() {
        ApiHelper.news.addAll(value);
        ApiHelper.newsInApp = ApiHelper.news;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text("News App",style: TextStyle(color: Colors.black),),
      ),
      body: ApiHelper.newsInApp.isEmpty
          ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Center(child: CircularProgressIndicator(
              color: Colors.orange[300],
            )))
          : ListView.separated(
              itemCount: ApiHelper.newsInApp.length,
              itemBuilder: ((context, index) => ListTile(
                iconColor: Colors.orange[500],
                tileColor: Colors.black,
                selectedTileColor: Colors.orange[100],
                    onTap: () async {
                      final url = ApiHelper.newsInApp[index].url as String;
                      if (await canLaunchUrlString(url)) {
                        await launchUrlString(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    leading: Icon(
                      Icons.newspaper,
                      size: 40,
                    ),
                    title: Text(
                      ApiHelper.newsInApp[index].title as String,
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.orange[500]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    subtitle:
                        Text(ApiHelper.newsInApp[index].publishedAt as String,style: TextStyle(color: Colors.grey[800]),),
                  )),
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.black,
              ),
            ),
    );
  }
}