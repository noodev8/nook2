import 'package:flutter/material.dart'; 
 
class ButtonPrimary extends StatelessWidget { 
  final String label; 
  final VoidCallback onPressed; 
 
  const ButtonPrimary({super.key, required this.label, required this.onPressed}); 
 
  @override 
  Widget build(BuildContext context) { 
    return ElevatedButton( 
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)), 
      child: Text(label), 
    ); 
  } 
} 
