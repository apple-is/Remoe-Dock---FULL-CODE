import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../home/home_screen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});
  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _done() async {
    final box = await Hive.openBox('settings');
    await box.put('tutorial_seen', true);
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (p) => setState(() => _page = p),
              children: [
                _buildWelcome(l),
                _buildInstall(l),
                _buildDefender(l),
                _buildFind(l),
                _buildAdd(l),
                _buildUse(l),
                _buildSecure(l),
              ],
            ),
          ),
          _dots(),
          _buttons(l),
        ]),
      ),
    );
  }

  Widget _buildWelcome(AppLocalizations l) => _pageView(
      Icons.waving_hand_rounded,
      l.tutWelcome,
      l.tutWelcomeSub,
      Column(children: [
        _b(Icons.wifi_rounded, l.tutWelcome1),
        _b(Icons.lock_rounded, l.tutWelcome2),
        _b(Icons.code_rounded, l.tutWelcome3),
        _b(Icons.timer_rounded, l.tutWelcome4)
      ]));

  Widget _buildInstall(AppLocalizations l) => _pageView(
      Icons.download_rounded,
      l.tutInstall,
      l.tutInstallSub,
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _s('1', l.tutInstall1, l.tutInstall1d),
        const SizedBox(height: 10),
        _s('2', l.tutInstall2, l.tutInstall2d),
        const SizedBox(height: 10),
        _s('3', l.tutInstall3, l.tutInstall3d),
        const SizedBox(height: 10),
        _s('4', l.tutInstall4, l.tutInstall4d)
      ]));

  Widget _buildDefender(AppLocalizations l) => _pageView(
      Icons.shield_outlined,
      l.tutDefender,
      l.tutDefenderSub,
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              const Icon(Icons.info_outline, color: Colors.orange, size: 20),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(l.tutDefenderInfo,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFF8B8B9E))))
            ])),
        const SizedBox(height: 14),
        _s('1', l.tutDefender1, l.tutDefender1d),
        const SizedBox(height: 10),
        _s('2', l.tutDefender2, l.tutDefender2d),
        const SizedBox(height: 10),
        _s('3', l.tutDefender3, l.tutDefender3d),
        const SizedBox(height: 10),
        _s('4', l.tutDefender4, l.tutDefender4d),
      ]));

  Widget _buildFind(AppLocalizations l) => _pageView(
      Icons.search_rounded,
      l.tutFind,
      l.tutFindSub,
      Column(children: [
        _tip(l.tutFind1, l.tutFind1d),
        const SizedBox(height: 10),
        _tip(l.tutFind2, l.tutFind2d),
        const SizedBox(height: 10),
        _tip(l.tutFind3, l.tutFind3d)
      ]));

  Widget _buildAdd(AppLocalizations l) => _pageView(
      Icons.add_circle_outline,
      l.tutAdd,
      l.tutAddSub,
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _s('1', l.tutAdd1, l.tutAdd1d),
        const SizedBox(height: 10),
        _s('2', l.tutAdd2, l.tutAdd2d),
        const SizedBox(height: 10),
        _s('3', l.tutAdd3, l.tutAdd3d)
      ]));

  Widget _buildUse(AppLocalizations l) => _pageView(
      Icons.touch_app_rounded,
      l.tutUse,
      l.tutUseSub,
      Column(children: [
        _btn(Icons.power_off_rounded, l.tutUse1, l.tutUse1d,
            const Color(0xFFC62828)),
        const SizedBox(height: 12),
        _btn(Icons.power_settings_new_rounded, l.tutUse2, l.tutUse2d,
            const Color(0xFF2E7D32)),
        const SizedBox(height: 14),
        Text(l.tutUseTip,
            style: TextStyle(fontSize: 13, color: Colors.grey[500]))
      ]));

  Widget _buildSecure(AppLocalizations l) => _pageView(
      Icons.lock_rounded,
      l.tutSecure,
      l.tutSecureSub,
      Column(children: [
        _pc(Icons.wifi_off_rounded, l.tutSecure1, l.tutSecure1d),
        const SizedBox(height: 10),
        _pc(Icons.cloud_off_rounded, l.tutSecure2, l.tutSecure2d),
        const SizedBox(height: 10),
        _pc(Icons.code_rounded, l.tutSecure3, l.tutSecure3d),
        const SizedBox(height: 18),
        FilledButton.icon(
            onPressed: _done,
            icon: const Icon(Icons.check),
            label: Text(l.tutDone))
      ]));

  Widget _pageView(IconData ic, String t, String s, Widget c) =>
      SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF4A4584)]),
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(ic, size: 36, color: Colors.white)),
            const SizedBox(height: 16),
            Text(t,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(s, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
            const SizedBox(height: 20),
            c,
          ]));

  Widget _b(IconData ic, String t) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Icon(ic, size: 20, color: const Color(0xFF6C63FF)),
        const SizedBox(width: 10),
        Expanded(child: Text(t, style: const TextStyle(fontSize: 14)))
      ]));

  Widget _s(String n, String t, String d) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                color: const Color(0xFF6C63FF),
                borderRadius: BorderRadius.circular(7)),
            child: Center(
                child: Text(n,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))),
        const SizedBox(width: 10),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(d,
              style:
                  TextStyle(fontSize: 12, color: Colors.grey[500], height: 1.4))
        ])),
      ]);

  Widget _tip(String t, String d) => Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1826),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(d,
            style:
                TextStyle(fontSize: 12, color: Colors.grey[400], height: 1.5))
      ]));

  Widget _btn(IconData ic, String l, String d, Color c) => Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1826),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.withValues(alpha: 0.3))),
      child: Row(children: [
        Icon(ic, color: c, size: 24),
        const SizedBox(width: 12),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(l,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: c)),
          Text(d, style: TextStyle(fontSize: 12, color: Colors.grey[500]))
        ]))
      ]));

  Widget _pc(IconData ic, String t, String d) => Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1826),
          borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Icon(ic, color: const Color(0xFF6C63FF), size: 22),
        const SizedBox(width: 10),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(d, style: TextStyle(fontSize: 12, color: Colors.grey[400]))
        ]))
      ]));

  Widget _dots() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          7,
          (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _page == i ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                  color: _page == i
                      ? const Color(0xFF6C63FF)
                      : const Color(0xFF6C63FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4)))));

  Widget _buttons(AppLocalizations l) => Padding(
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        if (_page > 0)
          TextButton(
              onPressed: () => _controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut),
              child: Text(l.back))
        else
          const SizedBox(width: 80),
        const Spacer(),
        Text('${_page + 1}/7', style: TextStyle(color: Colors.grey[500])),
        const Spacer(),
        if (_page < 6)
          FilledButton(
              onPressed: () => _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut),
              child: Text(l.next))
        else
          const SizedBox(width: 80),
      ]));
}
