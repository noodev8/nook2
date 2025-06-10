/*
====================================================================================================
App Configuration
====================================================================================================
Purpose: Central configuration for the Flutter application
Contains API base URLs, endpoints, app name, version, and other global settings
====================================================================================================
*/

class AppConfig {
  // Server Configuration
  static const String apiBaseUrl = 'http://192.168.1.182:3000'; // Local dev IP
  // static const String apiBaseUrl = 'http://77.68.13.150:3007'; // Test Server
  // static const String apiBaseUrl = 'https://lacrema.noodev8.com'; // Production Server

  // App Metadata
  static const String appName = 'LaCrema Rewards';
  static const String appVersion = '1.0.0';

  // Common API Endpoints (extend as needed)
  static const String loginEndpoint = '/api/login';
  static const String registerEndpoint = '/api/register';

  // Full URL builders
  static String get loginUrl => '$apiBaseUrl$loginEndpoint';
  static String get registerUrl => '$apiBaseUrl$registerEndpoint';

  // Timeout settings
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 10);
}
