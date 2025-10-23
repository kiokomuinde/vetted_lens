import 'package:flutter/material.dart';
import '../main.dart'; 
import '../widgets/app_scaffold.dart'; // Contains AppDrawer, AppFooter, and buildDesktopNav

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  // Removed: _buildDesktopNav helper. Now using imported buildDesktopNav(context).

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOW IT WORKS', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
        automaticallyImplyLeading: !isDesktop,
        actions: isDesktop ? buildDesktopNav(context) : null, // Uses imported helper
      ),
      drawer: isDesktop ? null : const AppDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _ProcessHero(),
            _ProcessSteps(),
            _CTASection(),
            AppFooter(), 
          ],
        ),
      ),
    );
  }
}

// 2.1. Hero Section for How It Works
class _ProcessHero extends StatelessWidget {
  const _ProcessHero();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 60),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          const Text(
            'PROFESSIONAL PHOTOGRAPHY MADE SIMPLE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1942A0)),
          ),
          const SizedBox(height: 10),
          Text(
            'The Vetted Lens 3-Step Service Flow',
            style: TextStyle(fontSize: isDesktop ? 48 : 32, fontWeight: FontWeight.w900, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'From booking to final delivery, our technology ensures a seamless, reliable, and high-quality result without the typical freelance back-and-forth.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 2.2. The Core Process Steps
class _ProcessSteps extends StatelessWidget {
  const _ProcessSteps();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final List<Map<String, dynamic>> steps = [
      {
        'number': '1',
        'title': 'BOOK TIME & SPECIFY NEEDS',
        'icon': Icons.calendar_month,
        'description': 'Use our instant rate calculator to select the location, date, and required hourly duration. Specify the shoot type (e.g., Portrait, Real Estate) and any key requirements.',
        'cta': 'Get a Quote',
        'route': '/pricing',
      },
      {
        'number': '2',
        'title': 'WE VET & ASSIGN THE PRO',
        'icon': Icons.assignment_turned_in,
        'description': 'Our proprietary system automatically matches your job to the best Vetted Lens professional based on expertise, availability, and proximity. You receive a confirmation with the pro\'s profile and contact details.',
        'cta': 'Learn about Vetting',
        'route': '/quality-guarantee',
      },
      {
        'number': '3',
        'title': 'SHOOT, REVIEW & DOWNLOAD',
        'icon': Icons.cloud_download,
        'description': 'The photographer executes the session to our precise quality standards. Edited, high-resolution images are delivered via your secure client portal within 48-72 hours. Guaranteed.',
        'cta': 'See the Guarantee',
        'route': '/quality-guarantee',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 80),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: steps.map((step) => _buildStepCard(context, step)).toList(),
            )
          : Column(
              children: steps.map((step) => Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: _buildStepCard(context, step, isMobile: true),
              )).toList(),
            ),
    );
  }

  Widget _buildStepCard(BuildContext context, Map<String, dynamic> step, {bool isMobile = false}) {
    return Container(
      width: isMobile ? double.infinity : 350,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(step['number'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          const SizedBox(height: 20),
          Text(step['title'] as String, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87)),
          const SizedBox(height: 10),
          Text(step['description'] as String, style: const TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, step['route']),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(step['cta'] as String, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF1942A0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 2.3. CTA Section
class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 60),
      color: Colors.blue.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'READY TO EXPERIENCE THE PAAS DIFFERENCE?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Start with an instant quote and see how simple professional photography can be.',
                  style: TextStyle(fontSize: 18, color: Colors.blue.shade200),
                ),
              ],
            ),
          ),
          if (isDesktop) const SizedBox(width: 40),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/pricing'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1942A0),
            ),
            child: const Text('CALCULATE YOUR HOURLY RATE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}