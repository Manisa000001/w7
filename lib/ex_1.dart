import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          // PART 3: a Column with several buttons.
          // Each SelectableButton manages its own state.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SelectableButton(),
              SizedBox(height: 20),
              SelectableButton(),
              SizedBox(height: 20),
              SelectableButton(),
              SizedBox(height: 20),
              SelectableButton(),
            ],
          ),
        ),
      ),
    ));

// PART 2: the stateful widget
class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  // The selected condition (starts as not selected)
  bool isSelected = false;

  // Getter for the text label
  String get textLabel {
    if (isSelected) {
      return "Selected";
    } else {
      return "Not Selected";
    }
  }

  // Getter for the text color
  Color get textColor {
    if (isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  // Getter for the background color
  Color get backgroundColor {
    if (isSelected) {
      return Colors.blue[500]!;
    } else {
      return Colors.blue[50]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          // Change the button background color
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          // When clicked, reverse the selection
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Center(
            child: Text(
              textLabel,
              style: TextStyle(color: textColor),
            ),
          )),
    );
  }
}