import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ovi_landing_page.dart';
import 'theme/responsive_theme.dart';
import 'utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set system UI overlay style for consistent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.systemStatusBar,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.systemNavigationBar,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OVI - Mental Health App',
      theme: ResponsiveTheme.getTheme(context),
      home: const ResponsiveWrapper(child: OviLandingPage()),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaler.scale(1.0).clamp(0.8, 1.2),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

// Wrapper to ensure responsive behavior across the app
class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  
  const ResponsiveWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Set orientation preferences based on device type
        if (constraints.maxWidth > 900) {
          // Tablet/Desktop - allow all orientations
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else {
          // Mobile - prefer portrait but allow landscape
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        }
        
        return Container(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth > 1200 ? 1200 : constraints.maxWidth,
          ),
          child: Center(
            child: child,
          ),
        );
      },
    );
  }
}
