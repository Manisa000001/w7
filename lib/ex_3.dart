import 'package:flutter/material.dart';

List<String> images = [
  "EX-3/assets/bird.jpg",
  "EX-3/assets/bird2.jpg",
  "EX-3/assets/insect.jpg",
  "EX-3/assets/girl.jpg",
  "EX-3/assets/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the little DEBUG banner
      home: const ImageGallery(),
    ));

// PART 2: the stateful widget that wraps the Scaffold
class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  // The state: the position (index) of the image currently displayed
  int currentIndex = 0;

  // PART 1: function for the "previous" button
  void goToPrevious() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex = currentIndex - 1;
      } else {
        // We are on the first image, so go back to the last one
        currentIndex = images.length - 1;
      }
    });
  }

  // PART 1: function for the "next" button
  void goToNext() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex = currentIndex + 1;
      } else {
        // We are on the last image, so go back to the first one
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: goToPrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: goToNext,
            ),
          ),
        ],
      ),
      // Show the image at the current index
      body: Image.asset(images[currentIndex]),
    );
  }
}