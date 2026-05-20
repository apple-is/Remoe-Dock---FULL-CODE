import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/device_model.dart';
import '../../data/providers/device_provider.dart';
import '../../l10n/app_localizations.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});
  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController(),
      _mac = TextEditingController(),
      _ip = TextEditingController(),
      _bc = TextEditingController(),
      _wp = TextEditingController(text: '9'),
      _sp = TextEditingController(text: '8080');
  bool _wol = false;

  @override
  void dispose() {
    _name.dispose();
    _mac.dispose();
    _ip.dispose();
    _bc.dispose();
    _wp.dispose();
    _sp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final l = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _form,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                IconButton(
                    icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: colors.iconBg,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.arrow_back_rounded,
                            size: 20, color: colors.iconFg)),
                    onPressed: () => Navigator.pop(context)),
                const SizedBox(width: 12),
                Text(l.addDevice,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colors.textPrimary)),
              ]),
              const SizedBox(height: 24),
              _buildFieldWithHelp(
                controller: _name,
                label: l.name,
                hint: l.nameHint,
                icon: Icons.computer_rounded,
                fieldType: 'name',
              ),
              const SizedBox(height: 16),
              _buildFieldWithHelp(
                controller: _ip,
                label: l.ipAddress,
                hint: l.ipHint,
                icon: Icons.wifi_rounded,
                fieldType: 'ip',
              ),
              const SizedBox(height: 16),
              _buildFieldWithHelp(
                controller: _mac,
                label: l.macAddress,
                hint: l.macHint,
                icon: Icons.lan_rounded,
                fieldType: 'mac',
              ),
              const SizedBox(height: 16),
              _buildFieldWithHelp(
                controller: _bc,
                label: l.broadcast,
                hint: l.broadcastHint,
                icon: Icons.broadcast_on_personal_rounded,
                fieldType: 'broadcast',
              ),
              const SizedBox(height: 20),
              Card(
                  child: SwitchListTile(
                      title: Text(l.wolEnabled,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(l.wolSubtitle),
                      value: _wol,
                      onChanged: (v) => setState(() => _wol = v),
                      activeThumbColor: colors.seedColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)))),
              const SizedBox(height: 30),
              Row(children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(l.cancel))),
                const SizedBox(width: 16),
                Expanded(
                    child: FilledButton(onPressed: _save, child: Text(l.save)))
              ]),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldWithHelp({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String fieldType,
  }) {
    final l = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              prefixIcon: Icon(icon, size: 20),
            ),
            validator: (v) => v == null || v.isEmpty ? l.requiredField : null,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.help_outline, size: 20),
          onPressed: () => _showHelpDialog(context, fieldType),
          tooltip: 'How to find $fieldType',
        ),
      ],
    );
  }

  void _showHelpDialog(BuildContext context, String fieldType) {
    final l = AppLocalizations.of(context);
    String title;
    List<String> instructions;

    switch (fieldType) {
      case 'name':
        title = l.helpNameTitle;
        instructions = [
          l.helpName1,
          l.helpName2,
          l.helpName3,
        ];
        break;
      case 'ip':
        title = l.helpIpTitle;
        instructions = [
          l.helpIpWindows,
          l.helpIpWindows1,
          l.helpIpWindows2,
          l.helpIpWindows3,
          l.helpIpWindows4,
          '',
          l.helpIpMac,
          l.helpIpMac1,
          l.helpIpMac2,
          l.helpIpMac3,
        ];
        break;
      case 'mac':
        title = l.helpMacTitle;
        instructions = [
          l.helpMacWindows,
          l.helpMacWindows1,
          l.helpMacWindows2,
          l.helpMacWindows3,
          l.helpMacWindows4,
          '',
          l.helpMacMac,
          l.helpMacMac1,
          l.helpMacMac2,
          l.helpMacMac3,
        ];
        break;
      case 'broadcast':
        title = l.helpBroadcastTitle;
        instructions = [
          l.helpBroadcast1,
          l.helpBroadcast2,
          l.helpBroadcast3,
          l.helpBroadcast4,
        ];
        break;
      default:
        title = l.helpDialogTitle;
        instructions = [l.helpDialogNotAvailable];
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: instructions
              .map((instruction) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(instruction),
                  ))
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l.gotIt),
          ),
        ],
      ),
    );
  }

  void _save() {
    final l = AppLocalizations.of(context);
    if (_form.currentState!.validate()) {
      context.read<DeviceProvider>().addDevice(DeviceModel(
            name: _name.text,
            macAddress: _mac.text,
            ipAddress: _ip.text,
            broadcastAddress: _bc.text,
            port: int.tryParse(_wp.text) ?? 9,
            shutdownPort: int.tryParse(_sp.text) ?? 8080,
            wolEnabled: _wol,
          ));
      Navigator.pop(context);
      _snack(l.deviceAdded, true);
    }
  }

  void _snack(String t, bool ok) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(t),
        backgroundColor: ok ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16)));
  }
}
