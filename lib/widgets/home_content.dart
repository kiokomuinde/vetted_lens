import 'package:flutter/material.dart';
import '../main.dart'; // For routing
import 'app_scaffold.dart'; // For AppFooter

// --- P1.1 Hero Section (Modernized) ---
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1000;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: isDesktop ? 120 : 60,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildHeroContent(context, isDesktop)),
                const SizedBox(width: 80),
                Expanded(child: _buildImagePlaceholder(isDesktop)),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeroContent(context, isDesktop),
                const SizedBox(height: 40),
                _buildImagePlaceholder(isDesktop),
              ],
            ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PHOTOGRAPHY AS A SERVICE (PAAS)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1942A0),
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: isDesktop ? 16 : 10),
        Text(
          'Vetted Quality. On Demand. Booked by the Hour.',
          style: TextStyle(
            fontSize: isDesktop ? 56 : 38,
            fontWeight: FontWeight.w900,
            height: 1.1,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: isDesktop ? 30 : 20),
        const Text(
          'We eliminate the risk of hiring freelancers. Get a pre-screened, professional photographer assigned to your location with guaranteed quality and transparent hourly pricing.',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/pricing'),
          child: const Text('GET INSTANT HOURLY QUOTE'),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder(bool isDesktop) {
    return Container(
      height: isDesktop ? 450 : 280,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 15),
          )
        ],
      ),
      child: Center(
        child: Text(
          'Consistent Visual Style',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: isDesktop ? 28 : 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// --- P1.2 Trust and Credibility Section (NEW) ---
class TrustSection extends StatelessWidget {
  const TrustSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final List<Map<String, dynamic>> partners = [
      {'name': '5,000+ Bookings', 'icon': Icons.trending_up, 'color': Colors.green},
      {'name': '98% On-Time', 'icon': Icons.verified, 'color': Colors.blue},
      {'name': '100+ Vetted Pros', 'icon': Icons.people_alt_outlined, 'color': Colors.orange},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 30),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.1)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'TRUSTED BY STARTUPS AND FORTUNE 500S',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: isDesktop ? 60 : 30,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: partners.map((p) => _buildTrustPill(p)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTrustPill(Map<String, dynamic> data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(data['icon'] as IconData, size: 24, color: data['color'] as Color),
        const SizedBox(width: 8),
        Text(
          data['name'] as String,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}

// --- P1.3 Value Pillars Section ---
class ValuePillars extends StatelessWidget {
  const ValuePillars({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final List<Map<String, dynamic>> pillars = [
      {'icon': Icons.watch_later_outlined, 'title': 'Simple Hourly Booking', 'subtitle': 'Pay only for the time you need. Our transparent hourly rate includes the photographer and basic production.'},
      {'icon': Icons.assignment_turned_in, 'title': 'Quality is Vetted', 'subtitle': 'We screen and certify every professional on their technical skill and conduct, guaranteeing a high-quality result.'},
      {'icon': Icons.location_on_outlined, 'title': 'Location-Based Service', 'subtitle': 'Book a professional to attend your preferred location, whether it’s an event, a property, or a private studio.'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          Text('WHY VETTED LENS WORKS BETTER', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.blue.shade800), textAlign: TextAlign.center),
          const SizedBox(height: 40),
          Wrap(spacing: 30, runSpacing: 30, alignment: WrapAlignment.center, children: pillars.map((pillar) => _buildPillarCard(context, pillar, isDesktop)).toList()),
          const SizedBox(height: 60),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/how-it-works'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
              side: BorderSide(color: Colors.blue.shade400, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('SEE THE 3-STEP PROCESS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
          )
        ],
      ),
    );
  }

  Widget _buildPillarCard(BuildContext context, Map<String, dynamic> pillar, bool isDesktop) {
    return Container(
      width: isDesktop ? 300 : null,
      constraints: isDesktop ? const BoxConstraints(maxWidth: 350) : null,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(pillar['icon'] as IconData, size: 40, color: Theme.of(context).primaryColor),
          const SizedBox(height: 15),
          Text(pillar['title'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(pillar['subtitle'] as String, style: const TextStyle(fontSize: 16, color: Colors.black54)),
        ],
      ),
    );
  }
}

// --- P1.4 Service Showcase Section ---
class ServiceShowcase extends StatelessWidget {
  const ServiceShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final List<String> services = ['Commercial Product', 'Corporate Events', 'Family & Lifestyle', 'Architectural'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          const Text('CONSISTENTLY DELIVERING ACROSS ALL YOUR NEEDS', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black87), textAlign: TextAlign.center),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 4 : 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage('https://placehold.co/600x400/2962FF/FFFFFF?text=${services[index].replaceAll(' ', '+')}'),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
                child: Center(
                  child: Text(services[index], textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black54, blurRadius: 5)])),
                ),
              );
            },
          ),
          const SizedBox(height: 60),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/services'),
            child: Text('VIEW DETAILED SERVICE PORTFOLIO', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Theme.of(context).primaryColor)),
          )
        ],
      ),
    );
  }
}