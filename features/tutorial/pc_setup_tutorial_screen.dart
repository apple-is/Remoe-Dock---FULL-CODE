import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';

class PCSetupTutorialScreen extends StatefulWidget {
  const PCSetupTutorialScreen({super.key});

  @override
  State<PCSetupTutorialScreen> createState() => _PCSetupTutorialScreenState();
}

class _PCSetupTutorialScreenState extends State<PCSetupTutorialScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final l = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
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
                  Text(l.pcSetupTutorial,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: colors.textPrimary)),
                ],
              ),
            ),

            // Tab Bar
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: colors.seedColor,
              unselectedLabelColor: colors.textSecondary,
              indicatorColor: colors.seedColor,
              tabs: [
                Tab(text: l.wolTab),
                Tab(text: l.remoteDesktopTab),
                Tab(text: l.troubleshootingTab),
                Tab(text: l.worldwideTitle),
                Tab(text: l.wolWorldwideTitle),
              ],
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildWakeOnLANTutorial(colors, l),
                  _buildRemoteDesktopTutorial(colors, l),
                  _buildTroubleshooting(colors, l),
                  _buildWorldwideAccess(colors, l),
                  _buildWakeOnLANWorldwide(colors, l),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWakeOnLANTutorial(AppColors colors, AppLocalizations l) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(l.wolSection1, colors),
          _buildStepCard([
            l.wolStep1,
            l.wolStep2,
            l.wolStep3,
            l.wolStep4,
            l.wolStep5,
          ], colors),
          const SizedBox(height: 16),
          _buildSectionTitle(l.wolSection2, colors),
          _buildStepCard([
            l.wolPowerStep1,
            l.wolPowerStep2,
            l.wolPowerStep3,
            l.wolPowerStep4,
            l.wolPowerStep5,
            l.wolPowerStep6,
          ], colors),
          const SizedBox(height: 16),
          _buildSectionTitle(l.wolSection3, colors),
          _buildStepCard([
            l.wolNetStep1,
            l.wolNetStep2,
            l.wolNetStep3,
            l.wolNetStep4,
            l.wolNetStep5,
            l.wolNetStep6,
            l.wolNetStep7,
          ], colors),
          const SizedBox(height: 16),
          _buildInfoCard(l.wolImportant, colors),
        ],
      ),
    );
  }

  Widget _buildRemoteDesktopTutorial(AppColors colors, AppLocalizations l) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(l.rdSection1, colors),
          _buildStepCard([
            l.rdStep1,
            l.rdStep2,
            l.rdStep3,
            l.rdStep4,
          ], colors),
          const SizedBox(height: 16),
          _buildSectionTitle(l.rdSection2, colors),
          _buildStepCard([
            l.rdFirewallStep1,
            l.rdFirewallStep2,
            l.rdFirewallStep3,
            l.rdFirewallStep4,
          ], colors),
          const SizedBox(height: 16),
          _buildSectionTitle(l.rdSection3, colors),
          _buildStepCard([
            l.rdInfoStep1,
            l.rdInfoStep2,
            l.rdInfoStep3,
          ], colors),
          const SizedBox(height: 16),
          _buildInfoCard(l.rdNote, colors),
        ],
      ),
    );
  }

  Widget _buildTroubleshooting(AppColors colors, AppLocalizations l) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(l.troubleshootingTitle, colors),
          _buildTroubleshootingCard(
            l.wolNotWorking,
            [
              l.wolTroubleshoot1,
              l.wolTroubleshoot2,
              l.wolTroubleshoot3,
              l.wolTroubleshoot4,
              l.wolTroubleshoot5,
            ],
            colors,
          ),
          const SizedBox(height: 12),
          _buildTroubleshootingCard(
            l.rdConnectionFailed,
            [
              l.rdTroubleshoot1,
              l.rdTroubleshoot2,
              l.rdTroubleshoot3,
              l.rdTroubleshoot4,
              l.rdTroubleshoot5,
            ],
            colors,
          ),
          const SizedBox(height: 12),
          _buildTroubleshootingCard(
            l.deviceOffline,
            [
              l.offlineTroubleshoot1,
              l.offlineTroubleshoot2,
              l.offlineTroubleshoot3,
              l.offlineTroubleshoot4,
              l.offlineTroubleshoot5,
            ],
            colors,
          ),
          const SizedBox(height: 16),
          _buildWarningCard(
            l.alternativeSolutions,
            [
              l.alternativeTip1,
              l.alternativeTip2,
              l.alternativeTip3,
              l.alternativeTip4,
            ],
            colors,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, AppColors colors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildStepCard(List<String> steps, AppColors colors) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: steps.asMap().entries.map((entry) {
            final index = entry.key + 1;
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
                      color: colors.seedColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        index.toString(),
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
                        color: colors.textPrimary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTroubleshootingCard(
      String title, List<String> solutions, AppColors colors) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ...solutions.map((solution) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 16, color: colors.seedColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          solution,
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String text, AppColors colors) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.seedColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.seedColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: colors.seedColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: colors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningCard(String title, List<String> tips, AppColors colors) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber_outlined,
                  color: Colors.orange, size: 20),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...tips.map((tip) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_right,
                        size: 16, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tip,
                        style: TextStyle(
                          fontSize: 13,
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildWorldwideAccess(AppColors colors, AppLocalizations l) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Introduction
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.worldwideTitle,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.seedColor)),
                  const SizedBox(height: 8),
                  Text(l.worldwideIntro, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Section 1: Router Configuration
          _buildSectionTitle(l.worldwideSection1, colors),
          _buildStepCard([
            l.worldwideRouterStep1,
            l.worldwideRouterStep2,
            l.worldwideRouterStep3,
            l.worldwideRouterStep4,
            l.worldwideRouterStep5,
          ], colors),

          // Section 2: Windows Firewall
          _buildSectionTitle(l.worldwideSection2, colors),
          _buildStepCard([
            l.worldwideFirewallStep1,
            l.worldwideFirewallStep2,
            l.worldwideFirewallStep3,
            l.worldwideFirewallStep4,
            l.worldwideFirewallStep5,
            l.worldwideFirewallStep6,
          ], colors),

          // Section 3: Public IP
          _buildSectionTitle(l.worldwideSection3, colors),
          _buildStepCard([
            l.worldwideIpStep1,
            l.worldwideIpStep2,
            l.worldwideIpStep3,
            l.worldwideIpStep4,
          ], colors),

          // Section 4: Testing
          _buildSectionTitle(l.worldwideSection4, colors),
          _buildStepCard([
            l.worldwideTestStep1,
            l.worldwideTestStep2,
            l.worldwideTestStep3,
            l.worldwideTestStep4,
          ], colors),

          // Security Section
          const SizedBox(height: 20),
          Card(
            color: colors.seedColor.withValues(alpha: 0.1),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.worldwideSecurityTitle,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colors.seedColor)),
                  const SizedBox(height: 8),
                  Text(l.worldwideSecurityIntro,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),
                  Text(l.worldwideSecurityPoint1,
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(l.worldwideSecurityPoint2,
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(l.worldwideSecurityPoint3,
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(l.worldwideSecurityPoint4,
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 8),
                  Text(l.worldwideSecurityTip,
                      style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: colors.seedColor,
                      )),
                ],
              ),
            ),
          ),

          // Troubleshooting
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.worldwideTroubleshooting,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colors.textPrimary)),
                  const SizedBox(height: 8),
                  Text('• ${l.worldwideTroubleshoot1}',
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('• ${l.worldwideTroubleshoot2}',
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('• ${l.worldwideTroubleshoot3}',
                      style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('• ${l.worldwideTroubleshoot4}',
                      style: const TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWakeOnLANWorldwide(AppColors colors, AppLocalizations l) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Introduction
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.wolWorldwideTitle,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.seedColor)),
                  const SizedBox(height: 8),
                  Text(l.wolWorldwideIntro,
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Section 1: BIOS Settings
          _buildSectionTitle(l.wolWorldwideSection1, colors),
          _buildStepCard([
            l.wolWorldwideBiosStep1,
            l.wolWorldwideBiosStep2,
            l.wolWorldwideBiosStep3,
            l.wolWorldwideBiosStep4,
          ], colors),

          // Section 2: Router Wake-on-LAN
          _buildSectionTitle(l.wolWorldwideSection2, colors),
          _buildStepCard([
            l.wolWorldwideRouterStep1,
            l.wolWorldwideRouterStep2,
            l.wolWorldwideRouterStep3,
            l.wolWorldwideRouterStep4,
            l.wolWorldwideRouterStep5,
          ], colors),

          // Section 3: Windows Network
          _buildSectionTitle(l.wolWorldwideSection3, colors),
          _buildStepCard([
            l.wolWorldwideWindowsStep1,
            l.wolWorldwideWindowsStep2,
            l.wolWorldwideWindowsStep3,
            l.wolWorldwideWindowsStep4,
            l.wolWorldwideWindowsStep5,
            l.wolWorldwideWindowsStep6,
          ], colors),

          // Section 4: Testing
          _buildSectionTitle(l.wolWorldwideSection4, colors),
          _buildStepCard([
            l.wolWorldwideTestStep1,
            l.wolWorldwideTestStep2,
            l.wolWorldwideTestStep3,
            l.wolWorldwideTestStep4,
          ], colors),
        ],
      ),
    );
  }
}
