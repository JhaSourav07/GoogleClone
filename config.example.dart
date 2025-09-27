// Example configuration file for Google Clone Flutter App
// Copy this file to lib/config.dart and add your actual API credentials

class Config {
  // Get your API key from: https://console.cloud.google.com/
  // Enable Custom Search API and create credentials
  static const String apiKey = 'YOUR_GOOGLE_CUSTOM_SEARCH_API_KEY_HERE';
  
  // Create a custom search engine at: https://cse.google.com/cse/
  // Add www.google.com as the site to search and get your search engine ID
  static const String searchEngineId = 'YOUR_CUSTOM_SEARCH_ENGINE_ID_HERE';
  
  // Base URL for Google Custom Search API
  static const String baseUrl = 'https://www.googleapis.com/customsearch/v1';
  
  // Number of results per page (max 10 for Custom Search API)
  static const int resultsPerPage = 10;
  
  // Safe search setting (off, moderate, active)
  static const String safeSearch = 'moderate';
}