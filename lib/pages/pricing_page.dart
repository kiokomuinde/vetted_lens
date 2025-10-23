import 'package:flutter/material.dart';
import '../main.dart'; 
import '../widgets/app_scaffold.dart'; // Contains AppDrawer, AppFooter, and buildDesktopNav

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  // Removed: _buildDesktopNav helper. Now using imported buildDesktopNav(context).

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRICING & BOOKING', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
        automaticallyImplyLeading: !isDesktop,
        actions: isDesktop ? buildDesktopNav(context) : null, // Uses imported helper
      ),
      drawer: isDesktop ? null : const AppDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _PricingHero(),
            _RateStructure(),
            _LicensingSection(),
            _BookingCTA(),
            AppFooter(), 
          ],
        ),
      ),
    );
  }
}

// 4.1. Pricing Hero Section
class _PricingHero extends StatelessWidget {
  const _PricingHero();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 60),
      color: Colors.blue.shade50,
      child: Column(
        children: [
          const Text(
            'NO HIDDEN FEES. JUST SIMPLE HOURLY RATES.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1942A0)),
          ),
          const SizedBox(height: 10),
          Text(
            'Transparent Pricing. Guaranteed Quality.',
            style: TextStyle(fontSize: isDesktop ? 48 : 32, fontWeight: FontWeight.w900, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Our modular pricing ensures you only pay for the photographer\'s time and the final images you need. See the full breakdown below.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// 4.2. Two-Part Rate Structure
class _RateStructure extends StatelessWidget {
  const _RateStructure();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 80),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OUR TWO-PART RATE EXPLAINED',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          const Text(
            'Your final price is the sum of the Session Rate (Time) and the Deliverables Rate (Product).',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 60),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildRateCard(context, true)),
                    const SizedBox(width: 40),
                    Expanded(child: _buildRateCard(context, false)),
                  ],
                )
              : Column(
                  children: [
                    _buildRateCard(context, true),
                    const SizedBox(height: 40),
                    _buildRateCard(context, false),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildRateCard(BuildContext context, bool isSessionRate) {
    final title = isSessionRate ? 'PART 1: THE SESSION RATE (TIME)' : 'PART 2: THE DELIVERABLES RATE (PRODUCT)';
    final price = isSessionRate ? 'KSH 6,500 / hr' : 'KSH 300 / image';
    final included = isSessionRate
        ? [
            'Photographer\'s Time & Travel',
            'Professional Gear & Setup',
            'Minimum 1-Hour Booking',
            '5 Lo-Res Proofs for Review',
          ]
        : [
            'Per Final, Edited Image',
            'Color Correction & Retouching',
            'Full Resolution Files (Web & Print)',
            'Standard Personal/Small Business Use License',
          ];
    final color = isSessionRate ? Colors.blue.shade800 : Colors.green.shade700;
    final icon = isSessionRate ? Icons.timer_outlined : Icons.image_outlined;

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isSessionRate ? Colors.blue.shade50 : Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            price,
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900, color: color),
          ),
          const SizedBox(height: 30),
          ...included.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 20, color: color),
                    const SizedBox(width: 10),
                    Flexible(child: Text(item, style: const TextStyle(fontSize: 16))),
                  ],
                ),
              )),
          if (!isSessionRate) ...[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text('CALCULATE TOTAL COST'),
            ),
          ]
        ],
      ),
    );
  }
}

// 4.3. Licensing Section
class _LicensingSection extends StatelessWidget {
  const _LicensingSection();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 24, vertical: 60),
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'COMMERCIAL USAGE & LICENSING',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.black87),
          ),
          const SizedBox(height: 15),
          const Text(
            'All commercial usage requires a clear license based on scale. This protects both you and the photographer.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              _buildLicenseOption(context, 'STANDARD (Included)', 'Personal websites, social media, small business use.', Icons.person_outline),
              _buildLicenseOption(context, 'PREMIUM (+25%)', 'Regional advertising, print media, national social campaigns.', Icons.business_center_outlined),
              _buildLicenseOption(context, 'ENTERPRISE (Custom)', 'Global campaigns, unlimited usage rights, product packaging.', Icons.public),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLicenseOption(BuildContext context, String title, String description, IconData icon) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 35, color: Theme.of(context).primaryColor),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(description, style: const TextStyle(fontSize: 15, color: Colors.black54)),
        ],
      ),
    );
  }
}

// 4.4. Final Booking CTA
class _BookingCTA extends StatelessWidget {
  const _BookingCTA();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      color: Colors.black87,
      child: Column(
        children: [
          const Text(
            'READY TO BOOK?',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            'Use our streamlined form to get matched with a Vetted Lens Pro today.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {}, // Would navigate to a booking form
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            child: const Text('START YOUR ORDER', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}