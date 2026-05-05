import 'package:flutter/material.dart';

class DynamicListScreen extends StatefulWidget {
  const DynamicListScreen({super.key});

  @override
  State<DynamicListScreen> createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _items = [
    {'title': 'Belajar Flutter', 'done': false},
    {'title': 'Membuat Aplikasi Mobile', 'done': true},
    {'title': 'Praktikum Pemrograman', 'done': false},
  ];

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _items.add({'title': text, 'done': false});
        _controller.clear();
      });
    }
  }

  void _removeItem(int index) {
    setState(() => _items.removeAt(index));
  }

  void _toggleDone(int index) {
    setState(() => _items[index]['done'] = !_items[index]['done']);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doneCount = _items.where((i) => i['done'] == true).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Dynamic List Example'),
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5C6BC0), Color(0xFF7986CB)],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                          '${_items.length}', 'Total Item', Icons.list),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildStatCard(
                          '$doneCount', 'Selesai', Icons.check_circle_outline),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildStatCard(
                          '${_items.length - doneCount}',
                          'Belum',
                          Icons.radio_button_unchecked),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Input section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tambah item baru...',
                      prefixIcon: const Icon(Icons.add_task,
                          color: Color(0xFF5C6BC0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF5F6FA),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  color: const Color(0xFF5C6BC0),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: _addItem,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 48,
                      height: 48,
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List
          Expanded(
            child: _items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox_outlined,
                            size: 64, color: Colors.grey.shade300),
                        const SizedBox(height: 12),
                        Text(
                          'Belum ada item',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      final isDone = item['done'] as bool;

                      return Dismissible(
                        key: Key('${item['title']}_$index'),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF5350),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.delete_outline,
                              color: Colors.white),
                        ),
                        onDismissed: (_) => _removeItem(index),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            leading: GestureDetector(
                              onTap: () => _toggleDone(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isDone
                                      ? const Color(0xFF26A69A)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isDone
                                        ? const Color(0xFF26A69A)
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                ),
                                child: isDone
                                    ? const Icon(Icons.check,
                                        color: Colors.white, size: 16)
                                    : null,
                              ),
                            ),
                            title: Text(
                              item['title'] as String,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: isDone
                                    ? Colors.grey.shade400
                                    : const Color(0xFF424242),
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Color(0xFFEF5350), size: 20),
                              onPressed: () => _removeItem(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
