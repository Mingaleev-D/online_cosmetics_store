import 'package:flutter/material.dart';

//
// по хорошему нужно бы перееиспользовать но мне так хочется

class RectangleLightGreen extends StatelessWidget {
  const RectangleLightGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      height: 4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.99, -0.13),
          end: Alignment(-0.99, 0.13),
          colors: [
            Color(0xFFE3FDF8),
            Color(0xFF65F6DC),
          ],
        ),
      ),
    );
  }
}

class RectangleLightPink extends StatelessWidget {
  const RectangleLightPink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      height: 4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.00, 0.00),
          end: Alignment(1, 0),
          colors: [Color(0xFFF02880), Color(0xFFFEC0E0)],
        ),
      ),
    );
  }
}

class RectangleLightOrange extends StatelessWidget {
  const RectangleLightOrange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 118,
          height: 4,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.99, -0.13),
              end: Alignment(-0.99, 0.13),
              colors: [Color(0xFFF76513), Color(0xFFFCBC5C)],
            ),
          ),
        ),
      ],
    );
  }
}
