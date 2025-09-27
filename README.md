# Google Clone - Flutter App

A beautiful and functional Google search interface clone built with Flutter. This app replicates the Google search experience and integrates with Google's Custom Search API to provide real search results.

## 🌟 Features

- **Authentic Google UI**: Pixel-perfect recreation of Google's search interface
- **Real Search Results**: Powered by Google Custom Search API
- **Responsive Design**: Works seamlessly across different screen sizes
- **Fast Performance**: Built with Flutter for optimal performance
- **Cross-platform**: Runs on both Android and iOS devices

## 🔧 Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Flutter SDK** (3.0.0 or higher)
  - Download from [Flutter Official Website](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control
- **Google Custom Search API Key** (instructions below)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/JhaSourav07/GoogleClone.git
cd GoogleClone
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Set Up Google Custom Search API

#### Get Your API Key:
1. Go to the [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the **Custom Search API**
4. Go to **Credentials** → **Create Credentials** → **API Key**
5. Copy your API key

#### Create a Custom Search Engine:
1. Visit [Google Custom Search Engine](https://cse.google.com/cse/)
2. Click **Add** to create a new search engine
3. Enter `www.google.com` in "Sites to search"
4. Create the search engine and note down the **Search Engine ID**

#### Configure API Keys:
1. Create a `config.dart` file in `lib/` directory:

```dart
class Config {
  static const String apiKey = 'YOUR_API_KEY_HERE';
  static const String searchEngineId = 'YOUR_SEARCH_ENGINE_ID_HERE';
}
```

2. Add `config.dart` to your `.gitignore` file to keep your keys secure:

```
lib/config.dart
```

### 4. Run the Application

#### For Android:
```bash
flutter run
```

#### For iOS:
```bash
flutter run -d ios
```

#### For Web:
```bash
flutter run -d chrome
```

## 📁 Project Structure

```
GoogleClone/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── config.dart              # API configuration (create this)
│   ├── screens/
│   │   ├── home_screen.dart     # Google homepage
│   │   └── search_screen.dart   # Search results page
│   ├── widgets/
│   │   ├── search_bar.dart      # Search input widget
│   │   ├── search_result.dart   # Individual search result
│   │   └── google_logo.dart     # Google logo widget
│   ├── services/
│   │   └── search_service.dart  # API integration service
│   └── models/
│       └── search_result.dart   # Data models
├── assets/
│   └── images/                  # App images and icons
├── android/                     # Android-specific files
├── ios/                        # iOS-specific files
├── web/                        # Web-specific files
└── pubspec.yaml               # Dependencies and metadata
```

## 🔑 API Integration

This app uses the [Google Custom Search API](https://developers.google.com/custom-search/v1/overview) to fetch real search results. The API provides:

- **10,000 free queries per day**
- **100 queries per day** for free tier
- Rich search results with snippets, links, and metadata
- Image search capabilities
- Safe search filtering

### API Response Format:
```json
{
  "items": [
    {
      "title": "Search result title",
      "link": "https://example.com",
      "snippet": "Description of the search result...",
      "displayLink": "example.com"
    }
  ]
}
```

## 🛠️ Development

### Running Tests
```bash
flutter test
```

### Build for Production

#### Android APK:
```bash
flutter build apk --release
```

#### iOS:
```bash
flutter build ios --release
```

#### Web:
```bash
flutter build web --release
```

## 📱 Screenshots

*Screenshots will be added once the UI is implemented*

<!-- 
Add screenshots here:
- Home screen with Google logo and search bar
- Search results page
- Mobile responsive view
- Tablet view
-->

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📋 TODO

- [ ] Implement voice search functionality
- [ ] Add image search feature
- [ ] Implement search suggestions/autocomplete
- [ ] Add dark mode support
- [ ] Implement search filters (time, type, etc.)
- [ ] Add pagination for search results
- [ ] Implement search history
- [ ] Add unit and integration tests

## ⚠️ Important Notes

- **API Limits**: Be mindful of the Google Custom Search API limits (100 queries/day for free tier)
- **Security**: Never commit your API keys to version control
- **CORS**: For web deployment, you may need to configure CORS settings
- **Production**: Consider implementing API key rotation and rate limiting for production use

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Sourav Jha**
- GitHub: [@JhaSourav07](https://github.com/JhaSourav07)
- Email: souravkjha2007@gmail.com

## 🙏 Acknowledgments

- Google for providing the Custom Search API
- Flutter team for the amazing framework
- Material Design for UI guidelines
- The open-source community for inspiration

---

**⭐ Star this repository if you found it helpful!**