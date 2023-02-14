import "package:dirst/webtoon/models/webtoon_episode_model.dart";
import "package:flutter/material.dart";

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

  @override
  void initState() {
    super.initState();
    detail = ApiService().getToonById(widget.id);
    episodes = ApiService().getLatestEpisodesbyId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
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
        ],
      ),
    );
  }
}
