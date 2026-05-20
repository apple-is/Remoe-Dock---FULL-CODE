import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../data/models/device_model.dart';
import '../l10n/app_localizations.dart';

class DeviceCard extends StatelessWidget {
  final DeviceModel device;
  final bool isOnline;
  final VoidCallback onTap;

  const DeviceCard({
    super.key,
    required this.device,
    required this.isOnline,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final l = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 12 : 16, vertical: 6),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Card(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 14 : 16),
              child: Row(
                children: [
                  // Clean device icon
                  Container(
                    width: isSmallScreen ? 48 : 52,
                    height: isSmallScreen ? 48 : 52,
                    decoration: BoxDecoration(
                      color: isOnline
                          ? colors.seedColor.withValues(alpha: 0.1)
                          : colors.textSecondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.desktop_windows_rounded,
                            size: isSmallScreen ? 24 : 26,
                            color: isOnline
                                ? colors.seedColor
                                : colors.textSecondary,
                          ),
                        ),
                        // Status indicator
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: isSmallScreen ? 12 : 14,
                            height: isSmallScreen ? 12 : 14,
                            decoration: BoxDecoration(
                              color: isOnline
                                  ? const Color(0xFF4CAF50)
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color: Theme.of(context).cardColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: isSmallScreen ? 12 : 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.name,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 15,
                            fontWeight: FontWeight.w600,
                            color: colors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: isSmallScreen ? 3 : 4),
                        Row(
                          children: [
                            Text(
                              isOnline ? l.online : l.offline,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 11 : 12,
                                fontWeight: FontWeight.w500,
                                color: isOnline
                                    ? const Color(0xFF4CAF50)
                                    : colors.textSecondary,
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 4 : 6),
                            Text(
                              '· ${device.ipAddress}',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 11 : 12,
                                color: colors.textSecondary,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: isSmallScreen ? 18 : 20,
                    color: colors.textSecondary.withValues(alpha: 0.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
