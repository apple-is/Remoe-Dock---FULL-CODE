import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../data/providers/device_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/device_card.dart';
import '../add_device/add_device_screen.dart';
import '../device/device_screen.dart';
import '../settings/settings_screen.dart';
import '../../data/services/wake_on_lan_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tapCount = 0;
  DateTime? _lastTapTime;

  void _handleTap() {
    final now = DateTime.now();
    if (_lastTapTime == null ||
        now.difference(_lastTapTime!) < const Duration(seconds: 2)) {
      setState(() {
        _tapCount++;
        _lastTapTime = now;
      });

      if (_tapCount >= 10) {
        _showDeveloperLogs();
        setState(() {
          _tapCount = 0;
          _lastTapTime = null;
        });
      }
    } else {
      setState(() {
        _tapCount = 1;
        _lastTapTime = now;
      });
    }
  }

  void _showDeveloperLogs() {
    final logs = WakeOnLanService.getLogs();
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Row(
          children: [
            Icon(Icons.bug_report_outlined, color: Color(0xFF1976D2)),
            SizedBox(width: 8),
            Text('Developer Logs'),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: SingleChildScrollView(
            child: SelectableText(
              logs.isEmpty ? 'Keine Logs vorhanden' : logs,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              WakeOnLanService.clearLogs();
              Navigator.pop(c);
            },
            child: const Text('Löschen'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: const Text('Schließen'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<DeviceProvider>().checkAll());
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final l = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return GestureDetector(
      onTapDown: (details) {
        if (details.globalPosition.dx < 50 &&
            details.globalPosition.dy >
                MediaQuery.of(context).size.height - 100) {
          _handleTap();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  isSmallScreen ? 16 : 20,
                  isSmallScreen ? 16 : 20,
                  isSmallScreen ? 16 : 20,
                  0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                        decoration: BoxDecoration(
                          color: colors.seedColor.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l.appTitle,
                                      style: TextStyle(
                                          fontSize: isSmallScreen ? 24 : 28,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -0.5,
                                          color: colors.textPrimary)),
                                  SizedBox(height: isSmallScreen ? 4 : 6),
                                  Text(l.subtitle,
                                      style: TextStyle(
                                          fontSize: isSmallScreen ? 12 : 13,
                                          color: colors.textSecondary)),
                                ],
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 8 : 12),
                            Container(
                              decoration: BoxDecoration(
                                color: colors.iconBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsScreen()),
                                ),
                                icon: Icon(Icons.settings_outlined,
                                    color: colors.iconFg),
                                iconSize: isSmallScreen ? 20 : 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 24),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.only(top: isSmallScreen ? 20 : 24)),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 100),
                sliver: Consumer<DeviceProvider>(
                  builder: (context, provider, child) {
                    final devices = provider.devices;
                    if (devices.isEmpty) {
                      return SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: isSmallScreen ? 90 : 100,
                                height: isSmallScreen ? 90 : 100,
                                decoration: BoxDecoration(
                                  color:
                                      colors.seedColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Icon(Icons.desktop_windows_rounded,
                                    size: isSmallScreen ? 44 : 48,
                                    color: colors.seedColor),
                              ),
                              SizedBox(height: isSmallScreen ? 24 : 28),
                              Text(l.noDevices,
                                  style: TextStyle(
                                      fontSize: isSmallScreen ? 22 : 24,
                                      fontWeight: FontWeight.bold,
                                      color: colors.textPrimary)),
                              SizedBox(height: isSmallScreen ? 8 : 10),
                              Text(l.addHint,
                                  style: TextStyle(
                                      fontSize: isSmallScreen ? 13 : 14,
                                      color: colors.textSecondary)),
                            ],
                          ),
                        ),
                      );
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) {
                          final d = devices[i];
                          return DeviceCard(
                            device: d,
                            isOnline: d.lastKnownStatus == 'online',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        DeviceScreen(deviceId: d.id))),
                          );
                        },
                        childCount: devices.length,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddDeviceScreen())),
          child: const Icon(Icons.add_rounded, size: 30),
        ),
      ),
    );
  }
}
