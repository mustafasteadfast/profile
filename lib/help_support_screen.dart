import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Track which FAQ items are expanded
  final Map<int, bool> _expandedItems = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF64748B),
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Help & Support',
          style: GoogleFonts.onest(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          // Add 12px padding below app bar
          const SizedBox(height: 12),

          // Custom Tab Bar
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _tabController.animateTo(0);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "FAQ's",
                            style: GoogleFonts.onest(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  _tabController.index == 0
                                      ? const Color(0xFF00B795)
                                      : Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          height: 2,
                          color:
                              _tabController.index == 0
                                  ? const Color(0xFF00B795)
                                  : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _tabController.animateTo(1);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Contact Us",
                            style: GoogleFonts.onest(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  _tabController.index == 1
                                      ? const Color(0xFF00B795)
                                      : Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          height: 2,
                          color:
                              _tabController.index == 1
                                  ? const Color(0xFF00B795)
                                  : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Add 12px padding below tabs
          const SizedBox(height: 12),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // FAQs Tab
                _buildFaqTab(),

                // Contact Us Tab
                _buildContactUsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqTab() {
    // List of FAQ items
    final List<Map<String, String>> faqItems = [
      {
        'question': 'What is Packly?',
        'answer':
            'Lorem ipsum dolor sit amet consectetur. Risus quam risus scelerisque eu ipsum.',
      },
      {
        'question': 'How to use Packly?',
        'answer':
            'Lorem ipsum dolor sit amet consectetur. Risus quam risus scelerisque eu ipsum.',
      },
      {
        'question': 'How do I save the address?',
        'answer':
            'Lorem ipsum dolor sit amet consectetur. Risus quam risus scelerisque eu ipsum.',
      },
      {
        'question': 'How do I cancel an order?',
        'answer':
            'Lorem ipsum dolor sit amet consectetur. Risus quam risus scelerisque eu ipsum.',
      },
      {
        'question': 'How do I exit the app?',
        'answer':
            'Lorem ipsum dolor sit amet consectetur. Risus quam risus scelerisque eu ipsum.',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: faqItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final isExpanded =
            _expandedItems[index] ??
            (index == 0); // First item expanded by default

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question with expand/collapse button
                InkWell(
                  onTap: () {
                    setState(() {
                      _expandedItems[index] = !isExpanded;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            faqItems[index]['question']!,
                            style: GoogleFonts.onest(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Icon(
                          isExpanded ? Icons.remove : Icons.add,
                          color: const Color(0xFF64748B),
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),

                // Answer (visible only when expanded)
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      faqItems[index]['answer']!,
                      style: GoogleFonts.onest(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactUsTab() {
    // List of contact options
    final List<Map<String, dynamic>> contactOptions = [
      {'title': 'Live Chat', 'subtitle': null, 'icon': null},
      {
        'title': 'Hotline Number',
        'subtitle': '01626-865021',
        'icon': Icons.phone,
        'iconColor': const Color(0xFF00B795),
      },
      {'title': 'Whatsapp', 'subtitle': '01626-865021', 'icon': null},
      {'title': 'Website', 'subtitle': 'www.Packly.com', 'icon': null},
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: contactOptions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final option = contactOptions[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                // Icon if provided
                if (option['icon'] != null) ...[
                  Icon(
                    option['icon'] as IconData,
                    color: option['iconColor'] as Color? ?? Colors.black,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                ],

                // Title and subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option['title'] as String,
                      style: GoogleFonts.onest(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    if (option['subtitle'] != null)
                      Text(
                        option['subtitle'] as String,
                        style: GoogleFonts.onest(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
