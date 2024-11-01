import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Pastikan ini sesuai dengan nama proyek Anda
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  // Inisialisasi Hive sebelum pengujian
  setUpAll(() async {
    await Hive.initFlutter();
    await Hive.openBox('userBox');
  });

  tearDownAll(() async {
    await Hive.box('userBox').clear();
    await Hive.deleteFromDisk();
  });

  testWidgets('Login and Register flow', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CatatanApp());

    // Test that we start on the login screen
    expect(find.text('Login'), findsOneWidget);

    // Input email and password
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');

    // Tap on the register button
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle(); // Tunggu hingga transisi selesai

    // Verify that we are now on the home screen
    expect(find.text('Selamat datang di aplikasi Catatan!'), findsOneWidget);

    // Tap on the logout button
    await tester.tap(find.byIcon(Icons.logout));
    await tester.pumpAndSettle(); // Tunggu hingga transisi selesai

    // Verify that we are back on the login screen
    expect(find.text('Login'), findsOneWidget);

    // Input email and password for login
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');

    // Tap on the login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // Tunggu hingga transisi selesai

    // Verify that we are on the home screen again
    expect(find.text('Selamat datang di aplikasi Catatan!'), findsOneWidget);
  });
}
