import 'package:flutter/material.dart';
// Import all necessary pages and components
import 'package:vetted_lens/pages/how_it_works_page.dart';
import 'package:vetted_lens/pages/pricing_page.dart';
import 'package:vetted_lens/pages/quality_guarantee_page.dart'; // NEW IMPORT
import 'package:vetted_lens/widgets/app_scaffold.dart'; 
import 'package:vetted_lens/widgets/home_content.dart'; 


void main() {
  runApp(const VettedLensApp());
}

// --- APP PAGES DATA STRUCTURE (GLOBAL) ---
final Map<String, String> pageRoutes = {
  '/': 'Home',
  '/how-it-works': 'How It Works',
  '/services': 'Services & Portfolio',
  '/pricing': 'Pricing & Booking',
  '/quality-guarantee': 'Our Quality Guarantee',
  '/faq': 'FAQ & Support',
  '/about-us': 'About Us',
  '/join-network': 'Join Our Network',
  '/contact': 'Contact Us',
};

// --- MAIN APPLICATION WIDGET ---
class VettedLensApp extends StatelessWidget {
  const VettedLensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vetted Lens: Photography As A Service',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', 
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1942A0), // Deep Blue
        ),
        // Global button style defined here
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1942A0), 
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 8,
          ),
        ),
      ),
      initialRoute: '/',
      // Define routes using the dedicated Page and Placeholder classes
      routes: {
        '/': (context) => const HomePage(),
        '/how-it-works': (context) => const HowItWorksPage(),
        '/services': (context) => const PlaceholderPage(title: 'Services & Portfolio'),
        '/pricing': (context) => const PricingPage(),
        '/quality-guarantee': (context) => const QualityGuaranteePage(), // NEW ROUTE ADDED
        '/faq': (context) => const PlaceholderPage(title: 'FAQ & Support'),
        '/about-us': (context) => const PlaceholderPage(title: 'About Us'),
        '/join-network': (context) => const PlaceholderPage(title: 'Join Our Network'),
        '/contact': (context) => const PlaceholderPage(title: 'Contact Us'),
      },
    );
  }
}


// --- HOME PAGE CONTAINER (P1) ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('VETTED LENS', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
        automaticallyImplyLeading: !isDesktop,
        actions: isDesktop ? buildDesktopNav(context) : null, 
      ),
      drawer: isDesktop ? null : const AppDrawer(), 
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            TrustSection(), 
            ValuePillars(),
            ServiceShowcase(),
            AppFooter(), 
          ],
        ),
      ),
    );
  }
}