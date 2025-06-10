/*
====================================================================================================
App Configuration
====================================================================================================
Purpose: Central configuration for The Nook buffet ordering application
Contains API base URLs, endpoints, app name, version, and other global settings
====================================================================================================
*/

class AppConfig {
  // Server Configuration
  static const String apiBaseUrl = 'http://192.168.1.182:3000'; // Local dev IP
  // static const String apiBaseUrl = 'http://77.68.13.150:3007'; // Test Server
  // static const String apiBaseUrl = 'https://nook.noodev8.com'; // Production Server

  // App Metadata
  static const String appName = 'The Nook';
  static const String appFullName = 'The Nook of Welshpool';
  static const String appVersion = '1.0.0';

  // Business Information
  static const String businessEmail = 'NOOKBUFFET@GMAIL.COM';
  static const String businessPhone = '07551428162';
  static const String businessAddress = '42 High Street, Welshpool, SY21 7JQ';

  // App Features
  static const String tagline = 'Your perfect buffet, delivered.';
  static const List<String> serviceTypes = ['Collection', 'Delivery'];
  static const List<String> highlights = [
    'All recyclable packaging',
    'Fresh ingredients',
  ];

  // Common API Endpoints (extend as needed)
  static const String loginEndpoint = '/api/login';
  static const String registerEndpoint = '/api/register';
  static const String buffetsEndpoint = '/api/buffets';
  static const String ordersEndpoint = '/api/orders';

  // Full URL builders
  static String get loginUrl => '$apiBaseUrl$loginEndpoint';
  static String get registerUrl => '$apiBaseUrl$registerEndpoint';
  static String get buffetsUrl => '$apiBaseUrl$buffetsEndpoint';
  static String get ordersUrl => '$apiBaseUrl$ordersEndpoint';

  // Timeout settings
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 10);
}
