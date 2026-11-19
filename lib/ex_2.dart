import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          // PART 2: the same widget is used many times,
          // only the isFavorite value changes
          children: [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
          ],
        ),
      ),
    ));

// PART 3: StatefulWidget so each card can change its own favorite status
class FavoriteCard extends StatefulWidget {
  // PART 2: the value we receive as a parameter
  final bool isFavorite;

  const FavoriteCard({super.key, required this.isFavorite});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  // The state of THIS card (each card has its own)
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Start with the value given by the parameter
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    // PART 1: the layout of the card
    return Container(
      padding: const EdgeInsets.all(10),
      // Border at the bottom of the card
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        children: [
          // Expanded takes all the space, so the heart goes to the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("description"),
              ],
            ),
          ),
          // The heart icon
          IconButton(
            onPressed: () {
              // PART 3: change the favorite status on click
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}