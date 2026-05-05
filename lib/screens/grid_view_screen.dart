import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = ['Semua', 'Alam', 'Teknologi', 'Seni'];

  final List<Map<String, dynamic>> _items = [
    {'title': 'Gunung', 'icon': Icons.terrain, 'color': const Color(0xFF5C6BC0), 'category': 'Alam'},
    {'title': 'Laut', 'icon': Icons.waves, 'color': const Color(0xFF0288D1), 'category': 'Alam'},
    {'title': 'Hutan', 'icon': Icons.forest, 'color': const Color(0xFF388E3C), 'category': 'Alam'},
    {'title': 'Smartphone', 'icon': Icons.smartphone, 'color': const Color(0xFF455A64), 'category': 'Teknologi'},
    {'title': 'Laptop', 'icon': Icons.laptop, 'color': const Color(0xFF37474F), 'category': 'Teknologi'},
    {'title': 'Robot', 'icon': Icons.smart_toy, 'color': const Color(0xFF26A69A), 'category': 'Teknologi'},
    {'title': 'Musik', 'icon': Icons.music_note, 'color': const Color(0xFFAB47BC), 'category': 'Seni'},
    {'title': 'Lukisan', 'icon': Icons.palette, 'color': const Color(0xFFEF5350), 'category': 'Seni'},
    {'title': 'Kamera', 'icon': Icons.photo_camera, 'color': const Color(0xFFFF7043), 'category': 'Seni'},
    {'title': 'Matahari', 'icon': Icons.wb_sunny, 'color': const Color(0xFFFDD835), 'category': 'Alam'},
    {'title': 'Kode', 'icon': Icons.code, 'color': const Color(0xFF5C6BC0), 'category': 'Teknologi'},
    {'title': 'Film', 'icon': Icons.movie, 'color': const Color(0xFFEC407A), 'category': 'Seni'},
  ];

  List<Map<String, dynamic>> get _filteredItems {
    if (_selectedCategory == 0) return _items;
    final cat = _categories[_selectedCategory];
    return _items.where((item) => item['category'] == cat).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Grid View'),
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5C6BC0), Color(0xFF7986CB)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tampilan Grid',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${_filteredItems.length} item ditemukan',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),

          // Category filter
          Container(
            height: 52,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: FilterChip(
                      label: Text(_categories[index]),
                      selected: isSelected,
                      onSelected: (_) =>
                          setState(() => _selectedCategory = index),
                      backgroundColor: const Color(0xFFF5F6FA),
                      selectedColor: const Color(0xFF5C6BC0),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF424242),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      checkmarkColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),

          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return _buildGridItem(item, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item, int index) {
    final Color color = item['color'] as Color;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Kamu memilih: ${item['title']}'),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['title'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                item['category'] as String,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
