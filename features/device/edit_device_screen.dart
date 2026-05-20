import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../data/providers/device_provider.dart';
import '../../l10n/app_localizations.dart';

class EditDeviceScreen extends StatefulWidget {
  final String deviceId;
  const EditDeviceScreen({super.key, required this.deviceId});
  @override
  State<EditDeviceScreen> createState() => _EditDeviceScreenState();
}

class _EditDeviceScreenState extends State<EditDeviceScreen> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _name, _mac, _ip, _bc, _wp, _sp;
  late bool _wol;

  @override
  void initState() {
    super.initState();
    final d = context.read<DeviceProvider>().getDevice(widget.deviceId);
    _name = TextEditingController(text: d?.name ?? '');
    _mac = TextEditingController(text: d?.macAddress ?? '');
    _ip = TextEditingController(text: d?.ipAddress ?? '');
    _bc = TextEditingController(text: d?.broadcastAddress ?? '');
    _wp = TextEditingController(text: (d?.port ?? 9).toString());
    _sp = TextEditingController(text: (d?.shutdownPort ?? 8080).toString());
    _wol = d?.wolEnabled ?? false;
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colors.iconBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.arrow_back_rounded,
                            size: 20, color: colors.iconFg),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      l.editDevice,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _tf(_name, l.name, l.nameHint, Icons.computer_rounded),
                const SizedBox(height: 16),
                _tf(_mac, l.macAddress, l.macHint, Icons.lan_rounded),
                const SizedBox(height: 16),
                _tf(_ip, l.ipAddress, l.ipHint, Icons.wifi_rounded),
                const SizedBox(height: 16),
                _tf(_bc, l.broadcast, l.broadcastHint,
                    Icons.broadcast_on_personal_rounded),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: _tf(_wp, l.wolPort, '9', Icons.power_rounded,
                            num: true)),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _tf(
                            _sp, l.shutdownPort, '8080', Icons.dns_rounded,
                            num: true)),
                  ],
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
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(l.cancel),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton(
                        onPressed: _save,
                        child: Text(l.save),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tf(TextEditingController c, String label, String hint, IconData icon,
      {bool num = false}) {
    return TextFormField(
      controller: c,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 20),
      ),
      validator: (v) => v == null || v.isEmpty ? 'Pflichtfeld' : null,
    );
  }

  void _save() {
    if (_form.currentState!.validate()) {
      final p = context.read<DeviceProvider>();
      final d = p.getDevice(widget.deviceId);
      if (d != null) {
        d.name = _name.text;
        d.macAddress = _mac.text;
        d.ipAddress = _ip.text;
        d.broadcastAddress = _bc.text;
        d.port = int.tryParse(_wp.text) ?? 9;
        d.shutdownPort = int.tryParse(_sp.text) ?? 8080;
        d.wolEnabled = _wol;
        p.updateDevice(d);
        Navigator.pop(context);
      }
    }
  }
}
