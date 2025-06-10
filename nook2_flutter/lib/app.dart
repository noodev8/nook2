import 'package:flutter/material.dart'; 
import 'config/theme.dart'; 
import 'navigation/router.dart'; 
 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp.router( 
      title: 'App Factory', 
      theme: AppTheme.lightTheme, 
      routerConfig: appRouter, 
    ); 
  } 
} 
