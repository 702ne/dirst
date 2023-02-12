import "package:flutter/material.dart";

class DetailScreen extends StatelessWidget {
  final String id, title, thumb;

  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("detail"),
      ),
      body: Text(title),
    );
  }
}
