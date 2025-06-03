import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhotoMemoryWallPage(),
  ));
}

class PhotoMemoryWallPage extends StatelessWidget {
  final List<Map<String, String>> memories = [
    {
      "image": "assets/photo1.jpg",
      "message": "Graduation Day 🎓",
    },
    {
      "image": "assets/photo1.jpg",
      "message": "Trip to the hills 🏔️",
    },
    {
      "image": "assets/photo1.jpg",
      "message": "New Year party 🎉",
    },
    {
      "image": "assets/photo1.jpg",
      "message": "Got promoted! 🚀",
    },
  ];

  final Gradient backgroundGradient = const LinearGradient(
    colors: [
      Color.fromARGB(224, 255, 0, 128),
      Color.fromARGB(175, 245, 4, 4),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 40;
    final double cardWidth = MediaQuery.of(context).size.width - (horizontalPadding * 2);

    return Container(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent, // so gradient shows through
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,  // <-- Centers the title
          title: const Text(
            "✨ HeartFrame ✨",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1,
              color: Colors.white.withOpacity(0.8), // semi-transparent border
            ),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
          itemCount: memories.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 6,
              margin: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: cardWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        memories[index]["image"]!,
                        width: cardWidth,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        memories[index]["message"]!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
