import 'package:flutter/material.dart'; 
 
class AppTheme { 
  static ThemeData lightTheme = ThemeData( 
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), 
    useMaterial3: true, 
    textTheme: const TextTheme( 
      bodyMedium: TextStyle(fontSize: 16), 
      titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), 
    ), 
  ); 
} 
