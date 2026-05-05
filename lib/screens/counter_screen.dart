import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() {
        if (_counter > 0) _counter--;
      });
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Counter card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF5C6BC0), Color(0xFF7986CB)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5C6BC0).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Nilai Counter',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Text(
                        '$_counter',
                        key: ValueKey<int>(_counter),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Decrement
                  _buildCircleButton(
                    icon: Icons.remove,
                    color: const Color(0xFFEF5350),
                    onPressed: _decrement,
                    label: 'Kurang',
                  ),
                  const SizedBox(width: 16),
                  // Reset
                  _buildCircleButton(
                    icon: Icons.refresh,
                    color: const Color(0xFFFF7043),
                    onPressed: _reset,
                    label: 'Reset',
                    isSmall: true,
                  ),
                  const SizedBox(width: 16),
                  // Increment
                  _buildCircleButton(
                    icon: Icons.add,
                    color: const Color(0xFF26A69A),
                    onPressed: _increment,
                    label: 'Tambah',
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Info text
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline,
                        size: 16, color: Colors.grey.shade500),
                    const SizedBox(width: 8),
                    Text(
                      'Tekan tombol untuk mengubah nilai counter',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required String label,
    bool isSmall = false,
  }) {
    double size = isSmall ? 54 : 70;
    return Column(
      children: [
        Material(
          color: color,
          borderRadius: BorderRadius.circular(size / 2),
          elevation: 4,
          shadowColor: color.withOpacity(0.5),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(size / 2),
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(icon, color: Colors.white, size: isSmall ? 22 : 28),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
