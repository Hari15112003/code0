import 'package:code0/pages/home/links/link_navigate.dart';
import 'package:code0/pages/home/news/components/custom_list_tile.dart';
import 'package:code0/pages/home/news/model/article_model.dart';
import 'package:code0/pages/home/news/services/api_service.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late ApiService client;

  @override
  void initState() {
    client = ApiService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFF2F9),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const TopButton(text: "News"),
              SizedBox(
                height: 100,
                child: NavigateLink(),
              ),
              Expanded(
                child: FutureBuilder(
                  future: client.getArticle(),
                  builder: (BuildContext context, snapshot) {
                    //let's check if we got a response or not

                    if (snapshot.hasData) {
                      //Now let's make a list of articles
                      List<Article> articles = snapshot.data!;
                      return ListView.builder(
                        //Now let's create our custom List tile
                        itemCount: articles.length,
                        itemBuilder: (context, index) =>
                            customListTile(articles[index], context),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
