import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';
import '../widgets/action_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const HomeScreen({super.key, required this.themeNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleTheme() {
    final current = widget.themeNotifier.value;
    if (current == ThemeMode.dark) {
      widget.themeNotifier.value = ThemeMode.light;
    } else {
      widget.themeNotifier.value = ThemeMode.dark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Starter'),
        actions: [
          IconButton(
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: isDark ? Colors.amber : colorScheme.primary,
            ),
            onPressed: _toggleTheme,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 650;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primary,
                            colorScheme.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'READY FOR DEVELOPMENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Windows 11 Flutter Workspace',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Full Android SDK, Material 3, and Dart configured.',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Metrics Grid (Responsive with fixed mainAxisExtent to prevent overflows)
                    Text(
                      'System Metrics',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isWide ? 4 : 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 145,
                      children: [
                        StatCard(
                          title: 'SDK Version',
                          value: '3.41.2',
                          subtitle: 'Flutter Stable',
                          icon: Icons.layers_rounded,
                          iconColor: const Color(0xFF1E88E5),
                          onTap: () => _navigateToDetails(
                            'Flutter SDK 3.41.2',
                            'Flutter channel stable is installed at D:\\flutter. Dart SDK 3.11.0 is bundled and active.',
                          ),
                        ),
                        StatCard(
                          title: 'Android Target',
                          value: 'API 36',
                          subtitle: 'Upside Down Cake',
                          icon: Icons.android_rounded,
                          iconColor: const Color(0xFF43A047),
                          onTap: () => _navigateToDetails(
                            'Android API 36 Platform',
                            'Android SDK installed at D:\\Android\\Sdk with Platform 36 and Build-Tools 36.0.0.',
                          ),
                        ),
                        StatCard(
                          title: 'Architecture',
                          value: 'x86_64',
                          subtitle: 'Hardware Accel',
                          icon: Icons.memory_rounded,
                          iconColor: const Color(0xFFFB8C00),
                          onTap: () => _navigateToDetails(
                            'x86_64 Architecture',
                            'Android Virtual Device configured with x86_64 hardware acceleration for optimal performance.',
                          ),
                        ),
                        StatCard(
                          title: 'App Counter',
                          value: '$_counter',
                          subtitle: 'Taps recorded',
                          icon: Icons.touch_app_rounded,
                          iconColor: const Color(0xFF8E24AA),
                          onTap: _incrementCounter,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Actions Section
                    Text(
                      'Developer Quick Actions',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ActionCard(
                      title: 'Verify Environment Health',
                      description: 'Check Flutter Doctor status and toolchain dependencies',
                      icon: Icons.verified_user_rounded,
                      onTap: () => _navigateToDetails(
                        'Environment Health',
                        'Flutter Doctor reports all Android toolchain checks passing cleanly with all licenses accepted.',
                      ),
                    ),
                    const SizedBox(height: 8),
                    ActionCard(
                      title: 'Responsive Architecture Guide',
                      description: 'Learn how LayoutBuilder and Material 3 scale on Android',
                      icon: Icons.devices_rounded,
                      onTap: () => _navigateToDetails(
                        'Responsive Architecture',
                        'This starter app uses LayoutBuilder with max-width constraints to dynamically adapt to phones, foldables, and tablets.',
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Increment'),
      ),
    );
  }

  void _navigateToDetails(String title, String detail) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(title: title, detail: detail),
      ),
    );
  }
}
