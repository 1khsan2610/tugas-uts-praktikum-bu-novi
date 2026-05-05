import 'package:flutter/material.dart';
import 'counter_screen.dart';
import 'nested_widget_screen.dart';
import 'user_input_screen.dart';
import 'dynamic_list_screen.dart';
import 'simple_navigation_screen.dart';
import 'grid_view_screen.dart';
import 'about_me_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Track which buttons have been clicked
  final Set<int> _clickedButtons = {};

  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Counter',
      'icon': Icons.add_circle_outline,
      'subtitle': 'Aplikasi Counter Sederhana',
    },
    {
      'title': 'Widget Bertingkat',
      'icon': Icons.layers_outlined,
      'subtitle': 'Nested Widget Example',
    },
    {
      'title': 'User Input Example',
      'icon': Icons.edit_outlined,
      'subtitle': 'Form Input Pengguna',
    },
    {
      'title': 'Dynamic List Example',
      'icon': Icons.list_alt_outlined,
      'subtitle': 'Daftar Dinamis',
    },
    {
      'title': 'Navigasi Sederhana',
      'icon': Icons.navigation_outlined,
      'subtitle': 'Perpindahan Halaman',
    },
    {
      'title': 'Grid View',
      'icon': Icons.grid_view_outlined,
      'subtitle': 'Tampilan Grid',
    },
    {
      'title': 'Tentang Saya',
      'icon': Icons.person_outline,
      'subtitle': 'Profil Mahasiswa',
    },
  ];

  void _navigateTo(BuildContext context, int index) {
    setState(() {
      _clickedButtons.add(index);
    });

    Widget screen;
    switch (index) {
      case 0:
        screen = const CounterScreen();
        break;
      case 1:
        screen = const NestedWidgetScreen();
        break;
      case 2:
        screen = const UserInputScreen();
        break;
      case 3:
        screen = const DynamicListScreen();
        break;
      case 4:
        screen = const SimpleNavigationScreen();
        break;
      case 5:
        screen = const GridViewScreen();
        break;
      case 6:
        screen = const AboutMeScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('MyPorto'),
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ClipOval(
              child: Image.asset(
                'assets/ikhsan.jpeg',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header section
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5C6BC0), Color(0xFF7986CB)],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang! 👋',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Cek hasil karyaku disini:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildStatChip('${_menuItems.length - 1} Proyek', Icons.work_outline),
                    const SizedBox(width: 8),
                    _buildStatChip('${_clickedButtons.length} Dikunjungi', Icons.visibility_outlined),
                  ],
                ),
              ],
            ),
          ),

          // Wave divider
          Container(
            height: 20,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F6FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),

          // Menu list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                final item = _menuItems[index];
                final isClicked = _clickedButtons.contains(index);
                final isAboutMe = index == _menuItems.length - 1;

                return _buildMenuButton(
                  context: context,
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String,
                  icon: item['icon'] as IconData,
                  index: index,
                  isClicked: isClicked,
                  isAboutMe: isAboutMe,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required int index,
    required bool isClicked,
    required bool isAboutMe,
  }) {
    final Color defaultColor = isAboutMe
        ? const Color(0xFFE8EAF6)
        : const Color(0xFFEEEEEE);
    final Color clickedColor = isAboutMe
        ? const Color(0xFF5C6BC0)
        : const Color(0xFF26A69A);
    final Color textColor = isClicked ? Colors.white : const Color(0xFF424242);
    final Color subtitleColor = isClicked
        ? Colors.white70
        : const Color(0xFF9E9E9E);
    final Color iconBgColor = isClicked
        ? Colors.white.withOpacity(0.2)
        : (isAboutMe
            ? const Color(0xFF5C6BC0).withOpacity(0.1)
            : const Color(0xFF26A69A).withOpacity(0.1));
    final Color iconColor = isClicked
        ? Colors.white
        : (isAboutMe ? const Color(0xFF5C6BC0) : const Color(0xFF26A69A));

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _navigateTo(context, index),
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isClicked ? clickedColor : defaultColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: isClicked
                  ? [
                      BoxShadow(
                        color: clickedColor.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      )
                    ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Icon container
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const SizedBox(width: 14),
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: subtitleColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: isClicked ? Colors.white70 : const Color(0xFFBDBDBD),
                  ),
                ),
                // Visited badge
                if (isClicked) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '✓',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
