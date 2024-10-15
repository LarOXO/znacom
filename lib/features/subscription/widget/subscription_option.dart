import 'package:flutter/material.dart';

class SubscriptionOption extends StatelessWidget {
  final String duration;
  final String price;

  const SubscriptionOption({
    super.key,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.5),
            color: const Color.fromARGB(255, 40, 40, 40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(duration, style: const TextStyle(fontSize: 16)),
                    Image.asset('assets/icon/glass.png'),
                  ],
                ),
                Text(price, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}