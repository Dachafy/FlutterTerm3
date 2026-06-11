import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CustomButton()));

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Buttons")),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },

            child: Center(
              child: Text(isSelected ? "Selected" : "Not Selected"),
            ),
          ),
        ),
      ),
    );
  }
}
