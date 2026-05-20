import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../core/theme/app_theme.dart';
import '../../data/models/device_model.dart';
import '../../data/providers/device_provider.dart';
import '../../data/services/wake_on_lan_service.dart';
import '../../data/services/pc_shutdown_service.dart';
import '../../l10n/app_localizations.dart';
import '../tutorial/pc_setup_tutorial_screen.dart';
import 'edit_device_screen.dart';

class DeviceScreen extends StatefulWidget {
  final String deviceId;
  const DeviceScreen({super.key, required this.deviceId});
  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final _wol = WakeOnLanService();
  final _shutdownService = PCShutdownService();
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final l = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Consumer<DeviceProvider>(
      builder: (context, prov, _) {
        final d = prov.getDevice(widget.deviceId);
        if (d == null) {
          return Scaffold(
            appBar: AppBar(title: Text(l.notFound)),
            body: Center(child: Text(l.notFound)),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: Column(children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12),
                child: Row(children: [
                  IconButton(
                    icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: colors.iconBg,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.arrow_back_rounded,
                            size: 20, color: colors.iconFg)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: colors.iconBg,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.edit_outlined,
                            size: 20, color: colors.iconFg)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EditDeviceScreen(deviceId: d.id))),
                  ),
                  IconButton(
                    icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: colors.iconBg,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.delete_outline,
                            size: 20, color: colors.iconFg)),
                    onPressed: () => _del(d.name, d.id),
                  ),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 20),
                  child: Column(children: [
                    SizedBox(height: isSmallScreen ? 12 : 16),
                    Container(
                      width: isSmallScreen ? 64 : 72,
                      height: isSmallScreen ? 64 : 72,
                      decoration: BoxDecoration(
                        color: colors.seedColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(Icons.desktop_windows_rounded,
                          size: isSmallScreen ? 32 : 36,
                          color: colors.seedColor),
                    ),
                    SizedBox(height: isSmallScreen ? 14 : 18),
                    Text(d.name,
                        style: TextStyle(
                            fontSize: isSmallScreen ? 22 : 24,
                            fontWeight: FontWeight.bold,
                            color: colors.textPrimary)),
                    Text(d.ipAddress,
                        style: TextStyle(
                            fontSize: isSmallScreen ? 13 : 14,
                            color: colors.textSecondary)),
                    if (d.token.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Icon(Icons.lock, size: 14, color: colors.seedColor),
                    ],
                    SizedBox(height: isSmallScreen ? 20 : 24),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(isSmallScreen ? 14 : 18),
                        child: Column(children: [
                          _info(
                              Icons.lan_outlined, 'MAC', d.macAddress, colors),
                          const Divider(height: 24),
                          _info(Icons.broadcast_on_personal_outlined,
                              'Broadcast', d.broadcastAddress, colors),
                          const Divider(height: 24),
                          _info(Icons.power_outlined, 'WoL',
                              d.wolEnabled ? 'An' : 'Aus', colors),
                          const Divider(height: 24),
                          _info(Icons.dns_outlined, 'Port',
                              d.shutdownPort.toString(), colors),
                        ]),
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 20 : 24),
                    if (d.wolEnabled) ...[
                      _btn(l.pcOn, Icons.power_settings_new_rounded,
                          const Color(0xFF2E7D32), () => _wake(d)),
                      const SizedBox(height: 12),
                    ],
                    _btn(l.pcOff, Icons.power_off_rounded,
                        const Color(0xFFC62828), () => _sleep(d)),
                    if (!d.wolEnabled) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: colors.iconBg,
                            borderRadius: BorderRadius.circular(14)),
                        child: Row(children: [
                          Icon(Icons.info_outline,
                              size: 20, color: colors.seedColor),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(l.wolInfo,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: colors.textSecondary))),
                        ]),
                      ),
                    ],
                    if (_load)
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child:
                            CircularProgressIndicator(color: colors.seedColor),
                      ),
                    SizedBox(height: isSmallScreen ? 24 : 30),
                  ]),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget _info(IconData ic, String la, String v, AppColors c) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Row(children: [
      Icon(ic, size: isSmallScreen ? 16 : 18, color: c.seedColor),
      SizedBox(width: isSmallScreen ? 8 : 10),
      Text(la,
          style: TextStyle(
              fontSize: isSmallScreen ? 12 : 13, color: c.textSecondary)),
      const Spacer(),
      Flexible(
          child: Text(v,
              style: TextStyle(
                  fontSize: isSmallScreen ? 12 : 13,
                  fontWeight: FontWeight.w500,
                  color: c.textPrimary),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right)),
    ]);
  }

  Widget _btn(String la, IconData ic, Color col, VoidCallback tap) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _load ? null : tap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: col,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: col.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(ic, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(la,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> _wake(DeviceModel d) async {
    setState(() => _load = true);

    final l = AppLocalizations.of(context);

    try {
      print('=== WAKE ON LAN START ===');
      print('Device: ${d.name}');
      print('MAC: ${d.macAddress}');
      print('Broadcast: ${d.broadcastAddress}');
      print('IP: ${d.ipAddress}');
      print('Port: ${d.port}');

      // Validate MAC address format
      final cleanMac =
          d.macAddress.replaceAll(RegExp(r'[:\-\.]'), '').toUpperCase();
      print('Cleaned MAC: $cleanMac (length: ${cleanMac.length})');

      if (cleanMac.length != 12) {
        print('❌ Invalid MAC address length');
        setState(() => _load = false);
        if (mounted) {
          _snack('MAC-Adresse ungültig: ${d.macAddress}', false);
        }
        return;
      }

      // Validate broadcast address
      try {
        InternetAddress(d.broadcastAddress);
        print('✅ Broadcast-Adresse valid: ${d.broadcastAddress}');
      } catch (e) {
        print('❌ Invalid broadcast address: ${d.broadcastAddress} - $e');
        setState(() => _load = false);
        if (mounted) {
          _snack('Broadcast-Adresse ungültig: ${d.broadcastAddress}', false);
        }
        return;
      }

      bool ok = false;

      // Check if we're using worldwide access (public IP)
      if (_isWorldwideAccess(d.ipAddress)) {
        print('🌍 Using WORLDWIDE Wake-on-LAN');

        // Get subnet mask from device or use default
        final subnetMask = d.subnetMask ?? '255.255.255.0';
        print('Subnet Mask: $subnetMask');

        ok = await _wol.sendWakeOnLanWorldwide(
          macAddress: d.macAddress,
          publicIp: d.ipAddress,
          subnetMask: subnetMask,
          port: d.port,
        );

        if (ok) {
          print('✅ WOL Worldwide erfolgreich');
          _snack(l.wolWorldwideSuccess, true);
        } else {
          print('❌ WOL Worldwide fehlgeschlagen');
          _snack(l.wolWorldwideFailed, false);
        }
      } else {
        // Local network Wake-on-LAN
        print('🏠 Using LOCAL Wake-on-LAN');

        // Try multiple broadcast addresses for better compatibility
        final broadcasts = [
          d.broadcastAddress,
          '255.255.255.255',
          _calculateBroadcastFromIp(d.ipAddress),
        ];

        for (final broadcast in broadcasts) {
          print('Trying broadcast: $broadcast');
          ok = await _wol.sendWakeOnLan(
            macAddress: d.macAddress,
            broadcastAddress: broadcast,
            port: d.port,
          );
          if (ok) {
            print('✅ WOL Local erfolgreich with broadcast: $broadcast');
            _snack(l.signalSent, true);
            setState(() => _load = false);
            return;
          }
        }

        print('❌ WOL Local fehlgeschlagen with all broadcasts');
        _snack(l.error, false);
      }

      setState(() => _load = false);
      print('=== WAKE ON LAN END ===');
    } catch (e) {
      print('❌ Wake-on-LAN error: $e');
      print('Stack trace: ${StackTrace.current}');
      setState(() => _load = false);
      if (mounted) {
        _snack('Fehler: $e', false);
      }
    }
  }

  bool _isWorldwideAccess(String ipAddress) {
    // Check if IP is public (worldwide access)
    if (ipAddress.startsWith('192.168.')) return false;
    if (ipAddress.startsWith('10.')) return false;
    if (ipAddress.startsWith('172.')) {
      final parts = ipAddress.split('.');
      if (parts.length >= 2) {
        final second = int.tryParse(parts[1]) ?? 0;
        if (second >= 16 && second <= 31) return false;
      }
    }
    if (ipAddress.startsWith('127.')) return false;
    return true; // Public IP = worldwide access
  }

  String _calculateBroadcastFromIp(String ipAddress) {
    try {
      final parts = ipAddress.split('.');
      if (parts.length == 4) {
        // Replace last octet with 255 for broadcast
        return '${parts[0]}.${parts[1]}.${parts[2]}.255';
      }
    } catch (e) {
      print('Error calculating broadcast from IP: $e');
    }
    return '255.255.255.255'; // Fallback
  }

  Future<void> _sleep(DeviceModel d) async {
    final l = AppLocalizations.of(context);

    final result = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(l.shutdownConfirm),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l.pcStandby,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(l.pcShutdownMethod,
                    style: const TextStyle(fontStyle: FontStyle.italic)),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(c, true),
                  icon: const Icon(Icons.power_settings_new),
                  label: Text(l.pcStandbyAction),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(c);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PCSetupTutorialScreen()),
                    );
                  },
                  icon: const Icon(Icons.school),
                  label: Text(l.viewSetupTutorial),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF2E7D32),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.red.withValues(alpha: 0.3)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber_outlined,
                              color: Colors.red, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'PC ganz ausschalten',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '⚠️ Wenn du den PC ganz ausschaltest, kann er nicht mehr per App eingeschaltet werden (kein Wake-on-LAN im ausgeschalteten Zustand).',
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(c);
                    _showFullShutdownWarning();
                  },
                  icon: const Icon(Icons.power_off),
                  label: const Text('PC ganz ausschalten'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
        ],
      ),
    );

    if (result == true) {
      await _performShutdown(d);
    }
  }

  Future<void> _performShutdown(DeviceModel d) async {
    setState(() => _load = true);

    try {
      // Try multiple shutdown methods using PCShutdownService
      bool success = false;

      // Method 1: Try UDP shutdown signal
      success = await _shutdownService.sendShutdownSignal(
        ipAddress: d.ipAddress,
        port: d.shutdownPort,
      );

      // Method 2: Try HTTP shutdown (if PC has web server)
      if (!success) {
        success = await _shutdownService.sendHttpShutdown(
          ipAddress: d.ipAddress,
          port: d.shutdownPort,
        );
      }

      // Method 3: Try Remote Desktop API
      if (!success) {
        success = await _shutdownService.sendRemoteDesktopShutdown(
          ipAddress: d.ipAddress,
          port: d.shutdownPort,
        );
      }

      setState(() => _load = false);
      if (mounted) {
        if (success) {
          _snack('PC in Standby versendet', true);
        } else {
          _showSetupInstructions();
        }
      }
    } catch (e) {
      setState(() => _load = false);
      if (mounted) {
        _showSetupInstructions();
      }
    }
  }

  void _showSetupInstructions() {
    final l = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(l.pcSetupRequired),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l.pcNotResponding,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(l.pcSolution,
                    style: const TextStyle(fontStyle: FontStyle.italic)),
                const SizedBox(height: 8),
                Text(l.pcStep1),
                Text(l.pcStep2),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'rundll32.exe powrprof.dll,SetSuspendState 0,1,0',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('3. Teste mit Doppelklick auf shutdown.bat'),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(c);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PCSetupTutorialScreen()),
                    );
                  },
                  icon: const Icon(Icons.school),
                  label: Text(l.viewSetupTutorial),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.red.withValues(alpha: 0.3)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber_outlined,
                              color: Colors.red, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'PC ganz ausschalten',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '⚠️ Wenn du den PC ganz ausschaltest, kann er nicht mehr per App eingeschaltet werden (kein Wake-on-LAN im ausgeschalteten Zustand).',
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(c);
                    _showFullShutdownWarning();
                  },
                  icon: const Icon(Icons.power_off),
                  label: const Text('PC ganz ausschalten'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
        ],
      ),
    );
  }

  void _showFullShutdownWarning() {
    final l = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_outlined, color: Colors.red, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Text('PC ganz ausschalten?'),
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bist du sicher, dass du den PC ganz ausschalten möchtest?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.block, color: Colors.red, size: 18),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Wichtige Warnung:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Der PC kann danach nicht mehr per App eingeschaltet werden',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '• Wake-on-LAN funktioniert nur im Standby-Modus',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '• Du musst den PC manuell einschalten',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '⚠️ Dein UDP Listener muss FULL_SHUTDOWN Befehl unterstützen!',
                      style: TextStyle(fontSize: 11, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
          FilledButton(
            onPressed: () {
              Navigator.pop(c);
              _performFullShutdown();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Ja, ganz ausschalten'),
          ),
        ],
      ),
    );
  }

  Future<void> _performFullShutdown() async {
    final deviceProvider = context.read<DeviceProvider>();
    final devices = deviceProvider.devices;

    if (devices.isEmpty) {
      _snack('Keine Geräte vorhanden', false);
      return;
    }

    final device = devices.first;

    setState(() => _load = true);

    try {
      // Send full shutdown command via UDP
      final success = await _shutdownService.sendFullShutdownSignal(
        ipAddress: device.ipAddress,
        port: device.shutdownPort,
      );

      setState(() => _load = false);

      if (mounted) {
        if (success) {
          _snack('PC wird ganz ausgeschaltet...', true);
        } else {
          _snack(
              'PC reagiert nicht - UDP Listener muss FULL_SHUTDOWN unterstützen',
              false);
        }
      }
    } catch (e) {
      setState(() => _load = false);
      if (mounted) {
        _snack('Fehler: $e', false);
      }
    }
  }

  void _snack(String t, bool ok) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(t),
      backgroundColor: ok ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
    ));
  }

  void _del(String name, String id) {
    final l = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(l.deleteConfirm),
        content: Text(l.deleteText(name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: Text(l.cancel)),
          FilledButton(
            onPressed: () {
              context.read<DeviceProvider>().deleteDevice(id);
              Navigator.pop(c);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFC62828)),
            child: Text(l.delete),
          ),
        ],
      ),
    );
  }
}
