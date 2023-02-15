import 'package:dirst/webtoon/models/webtoon_episode_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.ep,
    required this.webtoonId,
  });

  void onButtonTap() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${ep.id}");
  }

  final WebtoonEpisodeModel ep;
  final String webtoonId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 11),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(10, 10),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ep.title,
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
