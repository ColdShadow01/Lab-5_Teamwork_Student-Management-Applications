import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Use the package import format instead of relative paths.
// NOTE: If your pubspec.yaml name is different than 'student_hub', change it below.
import 'package:student_hut/main.dart';
import 'package:student_hut/providers/navigation_provider.dart';

void main() {
  testWidgets('App launches and displays Home page', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame, including the required Provider
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: const StudentHubApp(),
      ),
    );

    // Wait for any animations to finish
    await tester.pumpAndSettle();

    // Verify that the Navigation Bar contains the 'Home' label
    expect(find.text('Home'), findsWidgets);

    // Verify that the app title 'StudentHub' is present
    expect(find.text('StudentHub'), findsWidgets);
  });
}
