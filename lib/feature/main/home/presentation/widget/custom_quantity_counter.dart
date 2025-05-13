
import 'package:flutter/material.dart';
import 'package:settings_app/core/constant/app_colors.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => QuantityCounterState();
}

class QuantityCounterState extends State<QuantityCounter> {
  int quantity = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.mainAppColor, 
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(   
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCircleButton(Icons.remove, () {
              setState(() {
                if (quantity > 0) quantity--;
              });
            }),
            const SizedBox(width: 12), 
            Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12), 
            buildCircleButton(Icons.add, () {
              setState(() {
                quantity++;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildCircleButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 16,
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.mainAppColor),
      ),
    );
  }
}
