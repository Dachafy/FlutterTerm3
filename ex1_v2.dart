import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CustomButton()));

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Button")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BuildButton(),
            const SizedBox(height: 20),
            BuildButton(),
            const SizedBox(height: 20),
            BuildButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BuildButton extends StatefulWidget {
  const BuildButton({super.key});

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        child: Center(child: Text(isSelected ? "Selected" : "Not Selected")),
      ),
    );
  }
}
