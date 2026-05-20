import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/language_provider.dart';
import '../help/tutorial_screen.dart';
import '../device/udp_listener_tutorial_screen.dart';
import '../../data/providers/device_provider.dart';
import 'package:dart_ping/dart_ping.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _checkReachability(BuildContext context) async {
    final deviceProvider = context.read<DeviceProvider>();
    final devices = deviceProvider.devices;

    if (devices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Keine Geräte vorhanden')),
      );
      return;
    }

    final device = devices.first;

    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Row(
          children: [
            Icon(Icons.wifi_tethering_outlined, color: Color(0xFF7B1FA2)),
            SizedBox(width: 8),
            Text('PC Erreichbarkeit'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IP: ${device.ipAddress}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Wird geprüft...'),
          ],
        ),
      ),
    );

    try {
      final ping = Ping(device.ipAddress, count: 3);
      final results = <String>[];

      await for (final pingData in ping.stream) {
        if (pingData.error != null) {
          results.add('❌ Fehler: ${pingData.error}');
        } else {
          results.add('✅ ${pingData.summary?.time}ms Antwort erhalten');
        }
      }

      if (context.mounted) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (c) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: const Row(
              children: [
                Icon(Icons.wifi_tethering_outlined, color: Color(0xFF7B1FA2)),
                SizedBox(width: 8),
                Text('PC Erreichbarkeit'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('IP: ${device.ipAddress}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ...results.map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(r,
                          style: const TextStyle(
                              fontFamily: 'monospace', fontSize: 12)),
                    )),
                const SizedBox(height: 16),
                if (results.any((r) => r.contains('✅'))) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('✅ PC ist erreichbar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        SizedBox(height: 4),
                        Text(
                            'Wenn der PC erreichbar ist aber nicht auf Wake-on-LAN reagiert, liegt das Problem an den PC-Einstellungen.',
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('❌ PC ist nicht erreichbar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                        SizedBox(height: 4),
                        Text(
                            'Der PC ist entweder ausgeschaltet oder nicht im selben Netzwerk.',
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(c),
                child: const Text('Schließen'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fehler: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final l = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: colors.iconBg,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.arrow_back_rounded,
                          size: 20, color: colors.iconFg),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Text(l.settings,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                          color: colors.textPrimary)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCard(
                      icon: Icons.language,
                      title: l.language,
                      colors: colors,
                      child: _languagePicker(context, l)),
                  const SizedBox(height: 14),
                  _buildCard(
                      icon: Icons.info_outline,
                      title: l.info,
                      colors: colors,
                      child: Column(children: [
                        _buildRow(l.version, '1.0.0', colors),
                        const SizedBox(height: 14),
                        _buildRow(l.developer, 'Remote Dock Team', colors),
                        const SizedBox(height: 14),
                        _buildRow(l.platform, 'Flutter + .NET 8', colors),
                      ])),
                  const SizedBox(height: 14),
                  _buildCard(
                      icon: Icons.help_outline,
                      title: l.tutorial,
                      colors: colors,
                      child: Column(children: [
                        Text(l.tutorialDesc,
                            style: TextStyle(
                                fontSize: 13,
                                color: colors.textSecondary,
                                height: 1.6)),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const TutorialScreen())),
                              icon: const Icon(Icons.play_circle_outline,
                                  size: 18),
                              label: Text(l.startTutorial),
                            )),
                      ])),
                  const SizedBox(height: 14),
                  _buildCard(
                      icon: Icons.lock_outline,
                      title: l.privacy,
                      colors: colors,
                      child: Text(l.privacyText,
                          style: TextStyle(
                              fontSize: 13,
                              color: colors.textSecondary,
                              height: 1.6))),
                  const SizedBox(height: 14),
                  _buildCard(
                      icon: Icons.info_outline,
                      title: l.help,
                      colors: colors,
                      child: Text(l.helpText,
                          style: TextStyle(
                              fontSize: 13,
                              color: colors.textSecondary,
                              height: 1.6))),
                  const SizedBox(height: 14),
                  _buildCard(
                      icon: Icons.wifi_tethering_outlined,
                      title: 'PC Erreichbarkeit prüfen',
                      colors: colors,
                      child: Column(children: [
                        Text(
                            'Prüfe ob dein PC im lokalen Netzwerk erreichbar ist.',
                            style: TextStyle(
                                fontSize: 13,
                                color: colors.textSecondary,
                                height: 1.6)),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () => _checkReachability(context),
                              icon: const Icon(Icons.wifi_tethering_outlined,
                                  size: 18),
                              label: const Text('Prüfen'),
                            )),
                      ])),
                  const SizedBox(height: 14),
                  _buildCard(
                      icon: Icons.settings_suggest_outlined,
                      title: 'UDP Listener Tutorial',
                      colors: colors,
                      child: Column(children: [
                        Text(
                            'Lerne wie du den UDP Listener automatisch beim Windows-Start startest.',
                            style: TextStyle(
                                fontSize: 13,
                                color: colors.textSecondary,
                                height: 1.6)),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const UDPListenerTutorialScreen())),
                              icon: const Icon(Icons.play_circle_outline,
                                  size: 18),
                              label: const Text('Tutorial starten'),
                            )),
                      ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languagePicker(BuildContext context, AppLocalizations l) {
    final langProvider = context.watch<LanguageProvider>();
    return Column(children: [
      Text(l.restartApp,
          style:
              const TextStyle(fontSize: 12, color: Colors.orange, height: 1.4)),
      const SizedBox(height: 12),
      SegmentedButton<String>(
        segments: const [
          ButtonSegment(value: 'de', label: Text('Deutsch')),
          ButtonSegment(value: 'en', label: Text('English'))
        ],
        selected: {langProvider.locale.languageCode},
        onSelectionChanged: (value) {
          langProvider.setLanguage(value.first);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(l.restartApp),
              duration: const Duration(seconds: 2)));
        },
      ),
    ]);
  }

  Widget _buildCard(
      {required IconData icon,
      required String title,
      required AppColors colors,
      required Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    color: colors.seedColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, size: 18, color: colors.seedColor)),
            const SizedBox(width: 12),
            Text(title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary)),
          ]),
          const SizedBox(height: 16),
          child,
        ]),
      ),
    );
  }

  Widget _buildRow(String label, String value, AppColors colors) {
    return Row(children: [
      Expanded(
          child: Text(label,
              style: TextStyle(fontSize: 13, color: colors.textSecondary))),
      Text(value,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colors.textPrimary)),
    ]);
  }
}
