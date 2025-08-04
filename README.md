# ShapeFlow - Next-Gen Fitness App

A Flutter-based fitness application designed to provide AI-powered workouts and personalized fitness experiences.

## Features

- 🏋️ **AI-Powered Workouts**: Personalized workout plans based on your fitness level and goals
- 📊 **Progress Tracking**: Monitor your fitness journey with detailed analytics
- 🎯 **Goal Setting**: Set and achieve your fitness milestones
- 📱 **Cross-Platform**: Works on both Android and iOS devices
- 🎨 **Modern UI**: Beautiful, intuitive interface designed for optimal user experience

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd shapeflow
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your background image**
   - Place your workout hero image as `assets/images/clean-workout-hero.png`
   - Recommended size: 1080x1920 or similar aspect ratio
   - Format: PNG or JPG

4. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # App screens
│   └── onboarding_screen.dart
├── widgets/                  # Reusable widgets
├── models/                   # Data models
├── services/                 # API and business logic
├── providers/                # State management
│   └── app_provider.dart
└── utils/                    # Utility functions

assets/
├── images/                   # App images
├── icons/                    # App icons
└── fonts/                    # Custom fonts
```

## Dependencies

- **provider**: State management
- **go_router**: Navigation
- **font_awesome_flutter**: Icons
- **shared_preferences**: Local storage
- **http**: API requests
- **cached_network_image**: Image caching
- **flutter_svg**: SVG support

## Building for Production

### Android

1. **Generate a signed APK**
   ```bash
   flutter build apk --release
   ```

2. **Generate a signed App Bundle (recommended for Play Store)**
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Build for iOS**
   ```bash
   flutter build ios --release
   ```

## Google Play Store Preparation

### Required Assets

1. **App Icon**: 512x512 PNG
2. **Feature Graphic**: 1024x500 PNG
3. **Screenshots**: Multiple device screenshots
4. **App Description**: Compelling app description
5. **Privacy Policy**: Required for fitness apps

### Configuration

The app is pre-configured with:
- Proper permissions for fitness tracking
- App signing configuration
- ProGuard optimization
- MultiDex support

### Next Steps

1. **Create a Google Play Console account**
2. **Upload your app bundle**
3. **Add app metadata and screenshots**
4. **Submit for review**

## Development

### Adding New Screens

1. Create a new file in `lib/screens/`
2. Add the route in `lib/main.dart`
3. Update navigation as needed

### State Management

The app uses Provider for state management. Add new providers in `lib/providers/` as needed.

### Styling

The app uses a consistent theme defined in `lib/main.dart`. Colors and typography are centralized for easy maintenance.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@shapeflow.app or create an issue in the repository.

---

**ShapeFlow** - Transform Your Limits
