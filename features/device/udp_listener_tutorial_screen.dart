import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class UDPListenerTutorialScreen extends StatelessWidget {
  const UDPListenerTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.udpListenerTitle),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          _buildSection(
            context,
            l.udpListenerIntro,
            Icons.info_outline,
            Colors.blue,
            isDark,
          ),
          const SizedBox(height: 16),
          _buildStepSection(
            context,
            l.udpListenerSection1,
            [
              l.udpListenerStep1,
              l.udpListenerStep2,
              l.udpListenerStep3,
            ],
            Icons.admin_panel_settings,
            Colors.purple,
            isDark,
          ),
          const SizedBox(height: 16),
          _buildStepSection(
            context,
            l.udpListenerSection2,
            [
              l.udpListenerNavStep1,
              l.udpListenerNavStep2,
              l.udpListenerNavStep3,
            ],
            Icons.folder_open,
            Colors.orange,
            isDark,
          ),
          const SizedBox(height: 16),
          _buildStepSection(
            context,
            l.udpListenerSection3,
            [
              l.udpListenerInstallStep1,
              l.udpListenerInstallStep2,
              l.udpListenerInstallStep3,
              l.udpListenerInstallStep4,
            ],
            Icons.play_arrow,
            Colors.green,
            isDark,
          ),
          const SizedBox(height: 16),
          _buildStepSection(
            context,
            l.udpListenerSection4,
            [
              l.udpListenerVerifyStep1,
              l.udpListenerVerifyStep2,
              l.udpListenerVerifyStep3,
            ],
            Icons.check_circle,
            Colors.teal,
            isDark,
          ),
          const SizedBox(height: 16),
          _buildStepSection(
            context,
            l.udpListenerSection5,
            [
              l.udpListenerTestStep1,
              l.udpListenerTestStep2,
              l.udpListenerTestStep3,
            ],
            Icons.science,
            Colors.indigo,
            isDark,
          ),
          const SizedBox(height: 16),
          _buildSection(
            context,
            l.udpListenerNote,
            Icons.lightbulb,
            Colors.amber,
            isDark,
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            'Vollständiges Ausschalten (FULL_SHUTDOWN)',
            Icons.power_off,
            Colors.red,
            isDark,
            children: [
              'Die App kann den PC auch ganz ausschalten (nicht nur Standby).',
              'Dafür sendet sie den Befehl "FULL_SHUTDOWN" statt "SHUTDOWN".',
              'Dein UDP Listener muss diesen Befehl erkennen und dann "shutdown /s /t 0" ausführen.',
              'Beispiel-Code für den Listener:',
              'if command == "FULL_SHUTDOWN":',
              '    subprocess.run(["shutdown", "/s", "/t", "0"])',
              '⚠️ Nach dem vollständigen Ausschalten kann der PC nicht mehr per App eingeschaltet werden!',
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            l.udpListenerUninstall,
            Icons.delete_outline,
            Colors.red,
            isDark,
            children: [
              l.udpListenerUninstallStep1,
              l.udpListenerUninstallStep2,
              l.udpListenerUninstallStep3,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    bool isDark, {
    List<String>? children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                if (children != null) ...[
                  const SizedBox(height: 8),
                  ...children.map((child) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          child,
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepSection(
    BuildContext context,
    String title,
    List<String> steps,
    IconData icon,
    Color color,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      step,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
