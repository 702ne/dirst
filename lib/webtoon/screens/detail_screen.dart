import "package:dirst/webtoon/models/webtoon_episode_model.dart";
import "package:dirst/webtoon/widgets/episode_widget.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../models/webtoon_detail_model.dart";
import "../services/api_service.dart";

class DetailScreen extends StatefulWidget {
  final String id, title, thumb;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> detail;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList("LikedToons");
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList("LikedToons", []);
    }
  }

  @override
  void initState() {
    super.initState();
    detail = ApiService().getToonById(widget.id);
    episodes = ApiService().getLatestEpisodesbyId(widget.id);
    // check if this content liked
    initPrefs();
  }

  // function store liked func when press the like icon
  void onHeartTap() async {
    final likedToon = prefs.getStringList("LikedToons");
    if (likedToon != null) {
      if (isLiked) {
        likedToon.remove(widget.id);
      } else {
        likedToon.add(widget.id);
      }
      await prefs.setStringList("LikedToons", likedToon);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late WebtoonDetailModel dt;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(isLiked
                ? Icons.favorite_rounded
                : Icons.favorite_outline_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.8),
                              offset: const Offset(10, 10),
                            )
                          ]),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                  //Text(detail.title),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: detail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      dt = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dt.about,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${dt.genre} / ${dt.age}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    }
                    return const Text("...");
                  }),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: episodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var ep in snapshot.data!)
                            Episode(
                              ep: ep,
                              webtoonId: widget.id,
                            ),
                        ],
                      );
                    }
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
