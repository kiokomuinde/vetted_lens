import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart'; // For AppDrawer, AppFooter, buildDesktopNav

class QualityGuaranteePage extends StatelessWidget {
  const QualityGuaranteePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OUR QUALITY GUARANTEE', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
        automaticallyImplyLeading: !isDesktop,
        actions: isDesktop ? buildDesktopNav(context) : null,
      ),
      drawer: isDesktop ? null : const AppDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _GuaranteeHero(),
            _ThreePillarsSection(),
            _VettingProcessSection(),
            _ContactSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}

// P5.1. Guarantee Hero Section
class _GuaranteeHero extends StatelessWidget {
  const _GuaranteeHero();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 80),
      color: Colors.red.shade50, // Using a confidence-building color
      child: Column(
        children: [
          const Text(
            'ELIMINATE THE RISK OF FREELANCE UNRELIABILITY',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFFC62828)), // Deep red for emphasis
          ),
          const SizedBox(height: 10),
          Text(
            'The Only Photography Service Backed by a Triple Guarantee.',
            style: TextStyle(fontSize: isDesktop ? 48 : 32, fontWeight: FontWeight.w900, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'We stand by our Vetted Lens network. If we fail to meet any of these three standards, we make it right, guaranteed.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// P5.2. The Triple Guarantee Pillars
class _ThreePillarsSection extends StatelessWidget {
  const _ThreePillarsSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final List<Map<String, dynamic>> guarantees = [
      {'title': '1. Quality Match Guarantee', 'icon': Icons.star_outline, 'color': Colors.red.shade700, 'description': 'The Vetted Lens Pro assigned to your job will meet the technical and stylistic standard shown in our portfolio for the given service type. If the output does not match, we re-shoot for free.'},
      {'title': '2. On-Time Delivery Guarantee', 'icon': Icons.speed, 'color': Colors.red.shade700, 'description': 'All finalized images are delivered via your secure portal within 72 hours of the session end. For every hour past 72, we offer a 5% credit on your final deliverables cost.'},
      {'title': '3. Reliability Guarantee', 'icon': Icons.verified_user_outlined, 'color': Colors.red.shade700, 'description': 'Your Pro will arrive on time and fully prepared. If a booking is cancelled by Vetted Lens less than 24 hours prior, your next booking is 50% off.'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          Text('OUR 3 PROMISES TO YOU', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.blue.shade800)),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: guarantees.map((g) => _buildPillarCard(g, isDesktop)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPillarCard(Map<String, dynamic> item, bool isDesktop) {
    return Container(
      width: isDesktop ? 300 : null,
      constraints: isDesktop ? const BoxConstraints(maxWidth: 350) : null,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: item['color'] as Color, width: 3),
        boxShadow: [
          BoxShadow(color: item['color'].withOpacity(0.1), spreadRadius: 2, blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item['icon'] as IconData, size: 40, color: item['color'] as Color),
          const SizedBox(height: 15),
          Text(item['title'] as String, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 10),
          Text(item['description'] as String, style: const TextStyle(fontSize: 16, color: Colors.black54)),
        ],
      ),
    );
  }
}

// P5.3. Vetting Process (The Why)
class _VettingProcessSection extends StatelessWidget {
  const _VettingProcessSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final List<Map<String, dynamic>> steps = [
      {'title': 'Portfolio Scrutiny', 'icon': Icons.zoom_in, 'description': 'Review of 30+ client images to verify technical consistency and style match.'},
      {'title': 'Equipment Standards', 'icon': Icons.camera_alt_outlined, 'description': 'All Pros must own and use modern, full-frame professional camera and lighting gear.'},
      {'title': 'Professional Conduct', 'icon': Icons.record_voice_over, 'description': 'Mandatory training in client communication, timeliness, and on-site professionalism.'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 80),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'HOW WE GUARANTEE QUALITY: OUR VETTING PROCESS',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'We can offer this guarantee because only the top 5% of applicants are accepted into the Vetted Lens Network.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: steps.map((step) => _buildVettingStep(step)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildVettingStep(Map<String, dynamic> step) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Icon(step['icon'] as IconData, size: 45, color: Colors.blue.shade700),
          const SizedBox(height: 10),
          Text(step['title'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 10),
          Text(step['description'] as String, style: const TextStyle(fontSize: 16, color: Colors.black54), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// P5.4. Final Contact Section
class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      color: const Color(0xFF1942A0),
      child: Column(
        children: [
          const Text(
            'HAVE QUESTIONS ABOUT OUR GUARANTEE?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Our support team is here to walk you through our contracts and policies.',
            style: TextStyle(fontSize: 18, color: Colors.blue.shade200),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            child: const Text('CONTACT SUPPORT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}