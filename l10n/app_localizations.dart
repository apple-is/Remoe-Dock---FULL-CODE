import 'package:flutter/material.dart';

class AppLocalizations {
  final String languageCode;

  AppLocalizations(this.languageCode);

  static AppLocalizations of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return AppLocalizations(locale.languageCode);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _Delegate();

  static final Map<String, Map<String, String>> _t = {
    'de': {
      'tutWelcome': 'Moin!',
      'tutWelcomeSub': 'Schön dass du da bist',
      'tutWelcome1': 'Läuft nur im WLAN',
      'tutWelcome2': 'Kein Account, keine Cloud',
      'tutWelcome3': 'Code ist Open Source',
      'tutWelcome4': 'In 3 Minuten eingerichtet',
      'tutInstall': 'PC vorbereiten',
      'tutInstallSub': 'Kleines Programm drauf',
      'tutInstall1': 'Download',
      'tutInstall1d': 'github.com/apple-is/RemoteDockService',
      'tutInstall2': 'Entpacken',
      'tutInstall2d': 'C:\\RemoteDockService',
      'tutInstall3': 'Installieren',
      'tutInstall3d': 'install.bat als Admin',
      'tutInstall4': 'Testen',
      'tutInstall4d': 'http://localhost:8080/status',
      'tutDefender': 'Windows meckert?',
      'tutDefenderSub': 'Keine Panik',
      'tutDefenderInfo': 'Windows blockiert neue Programme.',
      'tutDefender1': 'Start öffnen',
      'tutDefender1d': 'Windows-Taste → Virenschutz',
      'tutDefender2': 'Einstellungen',
      'tutDefender2d': 'Einstellungen verwalten',
      'tutDefender3': 'Ausschlüsse',
      'tutDefender3d': 'Ausschluss hinzufügen',
      'tutDefender4': 'Fertig',
      'tutDefender4d': 'C:\\RemoteDockService',
      'tutFind': 'PC-Daten finden',
      'tutFindSub': 'IP, MAC & Broadcast',
      'tutFind1': 'IP-Adresse',
      'tutFind1d': 'cmd → ipconfig → IPv4',
      'tutFind2': 'MAC-Adresse',
      'tutFind2d': 'cmd → ipconfig /all',
      'tutFind3': 'Broadcast',
      'tutFind3d': 'IP mit .255 am Ende',
      'tutAdd': 'Gerät hinzufügen',
      'tutAddSub': 'Fast fertig',
      'tutAdd1': '+ drücken',
      'tutAdd1d': 'Blauer Button unten',
      'tutAdd2': 'Daten rein',
      'tutAdd2d': 'Name, IP, MAC, Broadcast',
      'tutAdd3': 'Wake-on-LAN',
      'tutAdd3d': 'Nur an wenn Kabel + BIOS',
      'tutUse': 'So geht\'s',
      'tutUseSub': 'Zwei Buttons',
      'tutUse1': 'PC AUS',
      'tutUse1d': 'Tippen → Standby',
      'tutUse2': 'PC AN',
      'tutUse2d': 'Nur mit WoL',
      'tutUseTip': 'PC AUS geht immer.',
      'tutSecure': 'Sicher?',
      'tutSecureSub': 'Ja!',
      'tutSecure1': 'Nur dein WLAN',
      'tutSecure1d': 'Nichts geht ins Internet',
      'tutSecure2': 'Keine Cloud',
      'tutSecure2d': 'Daten aufm Handy',
      'tutSecure3': 'Open Source',
      'tutSecure3d': 'Code auf GitHub',
      'tutDone': 'Los geht\'s!',
      'appTitle': 'Remote Dock',
      'subtitle': 'PC-Steuerung im WLAN',
      'noDevices': 'Keine Geräte',
      'addHint': 'Tipp auf +',
      'settings': 'Einstellungen',
      'info': 'Info',
      'version': 'Version',
      'developer': 'Entwickler',
      'platform': 'Plattform',
      'tutorial': 'Tutorial',
      'tutorialDesc': 'Lerne Remote Dock.',
      'startTutorial': 'Tutorial starten',
      'privacy': 'Datenschutz',
      'privacyText': 'Lokal gespeichert.',
      'help': 'Hilfe',
      'helpText': 'AN = WoL. AUS = Standby.',
      'addDevice': 'Hinzufügen',
      'editDevice': 'Bearbeiten',
      'name': 'Name',
      'nameHint': 'Mein PC',
      'macAddress': 'MAC-Adresse',
      'macHint': '50:EB:F6:20:1B:80',
      'ipAddress': 'IP-Adresse',
      'ipHint': '192.168.178.46',
      'broadcast': 'Broadcast',
      'broadcastHint': '192.168.178.255',
      'wolPort': 'WoL-Port',
      'shutdownPort': 'Shutdown-Port',
      'wolEnabled': 'Wake-on-LAN',
      'wolSubtitle': 'Per App einschalten',
      'save': 'Speichern',
      'cancel': 'Abbrechen',
      'pcOn': 'PC ANSCHALTEN',
      'pcOff': 'PC AUSSCHALTEN',
      'shutdownConfirm': 'Ausschalten?',
      'shutdownText': 'PC geht in Standby.',
      'shutdown': 'Ausschalten',
      'delete': 'Löschen',
      'deleteConfirm': 'Löschen?',
      'deleteText': '@name löschen?',
      'wolInfo': 'Wake-on-LAN benötigt.',
      'signalSent': 'Signal gesendet',
      'error': 'Fehler',
      'pcStandby': 'PC geht in Standby',
      'language': 'Sprache',
      'restartApp': 'App neustarten',
      'online': 'Online',
      'offline': 'Offline',
      'notFound': 'Nicht gefunden',
      'back': 'Zurück',
      'next': 'Weiter',
      'ok': 'OK',
      'helpNameTitle': 'PC-Namen finden',
      'helpName1': '1. Klicke auf den + Button',
      'helpName2': '2. Gib deinen PC-Namen ein',
      'helpName3': '3. Beispiele: Mein-PC, Büro-PC, Desktop',
      'helpIpTitle': 'IP-Adresse finden',
      'helpIpWindows': 'Windows:',
      'helpIpWindows1': '1. Eingabeaufforderung öffnen (cmd)',
      'helpIpWindows2': '2. Tippe: ipconfig',
      'helpIpWindows3': '3. Suche nach "IPv4-Adresse"',
      'helpIpWindows4': '4. Kopiere die Adresse (z.B. 192.168.1.100)',
      'helpIpMac': 'Mac/Linux:',
      'helpIpMac1': '1. Terminal öffnen',
      'helpIpMac2': '2. Tippe: ifconfig oder ip addr',
      'helpIpMac3': '3. Suche nach "inet" Adresse',
      'helpMacTitle': 'MAC-Adresse finden',
      'helpMacWindows': 'Windows:',
      'helpMacWindows1': '1. Eingabeaufforderung öffnen (cmd)',
      'helpMacWindows2': '2. Tippe: ipconfig /all',
      'helpMacWindows3': '3. Suche nach "Physische Adresse"',
      'helpMacWindows4': '4. Format: XX:XX:XX:XX:XX:XX',
      'helpMacMac': 'Mac/Linux:',
      'helpMacMac1': '1. Terminal öffnen',
      'helpMacMac2': '2. Tippe: ifconfig oder ip addr',
      'helpMacMac3': '3. Suche nach "ether" Adresse',
      'helpBroadcastTitle': 'Broadcast-Adresse finden',
      'helpBroadcast1': '1. Endet normalerweise mit .255',
      'helpBroadcast2': '2. Beispiel: 192.168.1.255',
      'helpBroadcast3': '3. Prüfe deine Router-Einstellungen bei Unsicherheit',
      'helpBroadcast4': '4. Gleiches Netzwerk wie deine IP, letzter Teil = 255',
      'helpDialogTitle': 'Hilfe',
      'helpDialogNotAvailable': 'Hilfe-Information nicht verfügbar.',
      'gotIt': 'Verstanden!',
      'requiredField': 'Pflichtfeld',
      'deviceAdded': 'Gerät hinzugefügt',
      'howToFind': 'Wie man {} findet',
      'setupTitle': 'Windows Built-in Remote Setup',
      'setupIntro':
          'Um die PC-Fernsteuerung ohne externe Software zu aktivieren:',
      'setupStep1': 'Remote Desktop auf deinem PC aktivieren',
      'setupStep2': 'Windows Firewall konfigurieren',
      'setupStep3': 'Energieverwaltung einrichten',
      'setupStep4': 'Wake-on-LAN im BIOS aktivieren',
      'setupNote':
          'Keine zusätzliche Software erforderlich - nutzt Windows-integrierte Funktionen',
      'pcSetupTutorial': 'PC Setup Tutorial',
      'pcControlSetup': 'PC-Steuerung einrichten',
      'pcControlSetupIntro': 'Für die PC-Steuerung müssen Sie einrichten:',
      'pcControlSetupStep1': 'Wake-on-LAN im BIOS und Windows',
      'pcControlSetupStep2': 'Netzwerkkonfiguration',
      'pcControlSetupStep3': 'Energieverwaltungseinstellungen',
      'pcControlSetupNote':
          'Dies erfordert technische Einrichtung auf Ihrem PC.',
      'viewSetupTutorial': 'Setup-Tutorial ansehen',
      'wolTab': 'Wake-on-LAN',
      'remoteDesktopTab': 'Remote Desktop',
      'troubleshootingTab': 'Fehlerbehebung',
      'wolSection1': '1. Wake-on-LAN im BIOS aktivieren (Detailliert)',
      'wolStep1':
          'PC neu starten und BIOS aufrufen: Drücke während des Bootvorgangs wiederholt F2, F10, F12 oder DEL (je nach Hersteller). Du siehst einen blauen/schwarzen Bildschirm mit Text-Menü.',
      'wolStep2':
          'Navigiere mit den Pfeiltasten zu "Power Management Setup", "Advanced" oder "Peripherals". Suche nach Untermenüs wie "ACPI Settings" oder "Power On Options".',
      'wolStep3':
          'Aktiviere diese Optionen: "Wake-on-LAN", "Wake on LAN", "Wake on PCI", "Power On By PCI-E", "Resume by LAN". Setze sie auf "Enabled".',
      'wolStep4':
          'WICHTIG: Aktiviere "Deep Sleep S5" oder "S5 Wake Up". Ohne dies funktioniert Wake-on-LAN nicht im ausgeschalteten Zustand!',
      'wolStep5':
          'Speichere mit F10: Wähle "Save & Exit" oder "Save Changes and Reset". Bestätige mit "Yes" oder "OK".',
      'wolSection2': '2. Windows Energieeinstellungen (Detailliert)',
      'wolPowerStep1':
          'Systemsteuerung → Energieoptionen: Windows-Taste + X → Systemsteuerung → Energieoptionen. Oder Windows-Taste + R → "powercfg.cpl"',
      'wolPowerStep2':
          'Klicke auf "Planeinstellungen ändern" bei deinem aktiven Plan, dann "Erweiterte Energieeinstellungen ändern". Es öffnet sich ein Dialog mit Baumstruktur.',
      'wolPowerStep3':
          'Erweitere "Ruhezustand" → "Wake-Timer zulassen" → Setze auf "Aktivieren". Dies erlaubt Wake-on-LAN-Timer im Ruhezustand.',
      'wolPowerStep4':
          'Erweitere "Netzwerk" → "Wach auf LAN zulassen" → Setze auf "Aktivieren". Dies ist entscheidend für WoL-Funktionalität.',
      'wolPowerStep5':
          'Erweitere "Energieknöpfe und Deckel" → "Energieeinstellungen für Netzwerkadapter" → Setze auf "Maximale Leistung".',
      'wolPowerStep6':
          'Klicke "Übernehmen" dann "OK". Änderungen werden sofort wirksam, kein Neustart nötig.',
      'wolSection3': '3. Netzwerkadapter (Detailliert - KRITISCH!)',
      'wolNetStep1':
          'Geräte-Manager öffnen: Windows-Taste + X → Geräte-Manager. Oder Windows-Taste + R → "devmgmt.msc"',
      'wolNetStep2':
          '"Netzwerkadapter" erweitern: Suche nach deinem LAN-Adapter (NICHT WLAN!). Namen wie "Realtek", "Intel", "Killer", "Broadcom".',
      'wolNetStep3':
          'Rechtsklick auf Ethernet-Adapter → Eigenschaften. NICHT den WLAN-Adapter verwenden!',
      'wolNetStep4':
          'Tab "Energieverwaltung": Häkchen bei "Computer darf Gerät zur Energieeinsparung ausschalten" ENTFERNEN. WICHTIG!',
      'wolNetStep5':
          'Tab "Erweitert": Suche nach "Wake on Magic Packet", "Wake on Pattern Match", "Wake on LAN". Setze auf "Aktiviert".',
      'wolNetStep6':
          'WICHTIG: "Green Ethernet" oder "Energy Efficient Ethernet" auf "Deaktiviert" setzen. Diese Funktion blockiert oft WoL!',
      'wolNetStep7':
          'Klicke "OK" zum Speichern. Adapter wird neu konfiguriert. Überprüfe mit "ipconfig /all" ob Adapter noch aktiv.',
      'wolImportant':
          'KRITISCH: Wake-on-LAN funktioniert NUR mit Ethernet-Kabel (LAN). WLAN/WiFi funktioniert NIEMALS für Wake-on-LAN! Der PC muss mit Kabel am Router angeschlossen sein.',
      'rdSection1': '1. Remote Desktop aktivieren',
      'rdStep1': 'Windows-Taste + R drücken, "sysdm.cpl" eingeben',
      'rdStep2': 'Gehe zum Tab "Remote"',
      'rdStep3':
          'Häkchen bei "Remotedesktopverbindungen zu diesem Computer zulassen"',
      'rdStep4':
          'Wähle "Nur Verbindungen von Computern zulassen, auf denen Remotedesktop ausgeführt wird"',
      'rdSection2': '2. Windows Firewall konfigurieren',
      'rdFirewallStep1': 'Windows Defender Firewall öffnen',
      'rdFirewallStep2': 'Klicke "App oder Feature durch Firewall zulassen"',
      'rdFirewallStep3': 'Häkchen bei "Remotedesktop"',
      'rdFirewallStep4':
          'Stelle sicher, dass sowohl "Privat" als auch "Öffentlich" ausgewählt sind',
      'rdSection3': '3. PC-Namen und IP finden',
      'rdInfoStep1':
          'Für PC-Namen: Windows-Taste + Pause/Untbr → "PC-Name" ansehen',
      'rdInfoStep2':
          'Für IP-Adresse: Eingabeaufforderung öffnen, "ipconfig" eingeben',
      'rdInfoStep3': 'Suche nach "IPv4-Adresse" (z.B. 192.168.1.100)',
      'rdNote':
          'Hinweis: Remote Desktop erfordert Windows Pro/Enterprise Editionen. Windows Home Benutzer benötigen alternative Lösungen.',
      'troubleshootingTitle': 'Häufige Probleme & Lösungen',
      'wolNotWorking': 'Wake-on-LAN funktioniert nicht',
      'wolTroubleshoot1':
          'Prüfen, ob PC per Ethernet verbunden ist (nicht WLAN)',
      'wolTroubleshoot2': 'BIOS-Einstellungen wurden gespeichert',
      'wolTroubleshoot3':
          'Mit PC im Ruhezustand testen (nicht vollständig ausgeschaltet)',
      'wolTroubleshoot4':
          'Router-Einstellungen für UDP-Port-Weiterleitung (Port 9) prüfen',
      'wolTroubleshoot5':
          'Verschiedene Broadcast-Adressen versuchen (normalerweise endet mit .255)',
      'rdConnectionFailed': 'Remote Desktop-Verbindung fehlgeschlagen',
      'rdTroubleshoot1': 'Überprüfen, ob beide PCs im selben Netzwerk sind',
      'rdTroubleshoot2': 'Windows Firewall-Einstellungen prüfen',
      'rdTroubleshoot3':
          'Versuche, IP-Adresse anstelle des Namens zu verwenden',
      'rdTroubleshoot4': 'Stelle sicher, dass Remotedesktop-Dienst läuft',
      'rdTroubleshoot5': 'Prüfen, ob Windows-Edition Remotedesktop unterstützt',
      'deviceOffline': 'App zeigt Gerät als offline',
      'offlineTroubleshoot1': 'IP-Adresse des Geräts überprüfen',
      'offlineTroubleshoot2': 'Prüfen, ob Gerät im selben Netzwerk ist',
      'offlineTroubleshoot3': 'Versuche, das Gerät vom Handy aus zu pingen',
      'offlineTroubleshoot4':
          'Stelle sicher, dass Gerät nicht im Tiefschlafmodus ist',
      'offlineTroubleshoot5': 'Netzwerk-Router-Einstellungen prüfen',
      'alternativeSolutions': 'Alternative Lösungen',
      'alternativeTip1':
          'Für Windows Home Benutzer: Drittanbieter-Remote-Desktop-Apps verwenden',
      'alternativeTip2':
          'Für mobile Steuerung: VNC oder TeamViewer in Betracht ziehen',
      'alternativeTip3':
          'Für einfaches Herunterfahren: Windows PowerShell-Skripte verwenden',
      'alternativeTip4':
          'Für Wake-on-LAN: Spezialisierte WoL-Apps zum Testen verwenden',
      'pcShutdownMethod': 'Wähle die Abschaltmethode:',
      'pcStandbyAction': 'PC in Standby versetzen',
      'pcSetupRequired': 'PC-Setup erforderlich',
      'pcNotResponding': 'PC reagiert nicht auf Abschaltsignal.',
      'pcSolution': 'Lösung:',
      'pcStep1': '1. Erstelle Ordner C:\\RemoteDock',
      'pcStep2': '2. Erstelle shutdown.bat mit diesem Inhalt:',
      'pcStep3': '3. Teste mit Doppelklick auf shutdown.bat',
      'pcListenerStarted': 'UDP Listener gestartet',
      'pcListenerWaiting': 'Warte auf Abschaltsignale...',
      'pcListenerStopped': 'UDP Listener gestoppt',
      'pcListenerError': 'Fehler beim Starten des Listeners',
      'pcSecurityNote': 'Sicherheitshinweis:',
      'pcSecurityText':
          'Diese App funktioniert nur im lokalen WLAN. Keine Daten werden ins Internet gesendet.',

      // UDP Listener Auto-Start Tutorial
      'udpListenerTitle': 'UDP Listener Auto-Start',
      'udpListenerIntro':
          'Starten Sie den UDP Listener automatisch beim Windows-Start im Hintergrund - ohne Fenster!',
      'udpListenerSection1': '1. PowerShell als Administrator öffnen',
      'udpListenerStep1': 'Windows-Taste drücken und "PowerShell" eingeben',
      'udpListenerStep2':
          'NICHT rechtsklicken! Stattdessen: "Als Administrator ausführen" im Ergebnis klicken',
      'udpListenerStep3':
          'Alternativ: Windows-Taste + X → "Windows PowerShell (Administrator)"',
      'udpListenerSection2': '2. Zum Projektordner navigieren',
      'udpListenerNavStep1':
          'In PowerShell: cd "E:\\Programming\\Flutter\\KI Projects\\remote_dock - Dev"',
      'udpListenerNavStep2':
          'Ersetzen Sie den Pfad mit Ihrem tatsächlichen Projektordner',
      'udpListenerNavStep3':
          'Tipp: Ordnerpfad kopieren und in PowerShell einfügen',
      'udpListenerSection3': '3. Installationsskript ausführen',
      'udpListenerInstallStep1':
          'Tippen Sie: .\\install_udp_listener_service.ps1',
      'udpListenerInstallStep2': 'Drücken Sie Enter',
      'udpListenerInstallStep3':
          'Bestätigen Sie alle Sicherheitsabfragen mit "J" oder "Yes"',
      'udpListenerInstallStep4':
          'Warten Sie auf "Installation Complete" Nachricht',
      'udpListenerSection4': '4. Überprüfung',
      'udpListenerVerifyStep1':
          'Aufgabenplanung öffnen: Windows-Taste + R → "taskschd.msc"',
      'udpListenerVerifyStep2': 'Suchen Sie nach "RemoteDockUDPListener"',
      'udpListenerVerifyStep3': 'Status sollte "Bereit" sein',
      'udpListenerSection5': '5. Testen',
      'udpListenerTestStep1': 'PC neu starten',
      'udpListenerTestStep2':
          'Aufgabenplanung öffnen und prüfen ob Aufgabe läuft',
      'udpListenerTestStep3':
          'UDP Listener sollte im Hintergrund laufen (kein Fenster)',
      'udpListenerNote':
          '💡 Der Listener läuft jetzt immer beim PC-Start automatisch!',
      'udpListenerUninstall': 'Zum Entfernen:',
      'udpListenerUninstallStep1': 'PowerShell als Administrator öffnen',
      'udpListenerUninstallStep2': 'Zum Ordner navigieren',
      'udpListenerUninstallStep3':
          'Tippen: .\\uninstall_udp_listener_service.ps1',

      // Worldwide Access Tutorial
      'worldwideTitle': 'Weltweiter PC-Zugriff',
      'worldwideIntro':
          'Steuern Sie Ihren PC von überall auf der Welt! Folgen Sie diesen einfachen Schritten für weltweiten Zugriff.',
      'worldwideSection1': '1. Router konfigurieren (Einfach!)',
      'worldwideRouterStep1':
          'Router-Zugangsseite öffnen: Geben Sie "192.168.1.1" oder "192.168.0.1" in Ihrem Browser ein.',
      'worldwideRouterStep2':
          'Anmelden: Nutzen Sie Admin-Passwort (oft auf Router-Rückseite gedruckt).',
      'worldwideRouterStep3':
          'Port-Forwarding finden: Suchen Sie nach "Port Forwarding" oder "Virtual Server".',
      'worldwideRouterStep4':
          'Regel erstellen: Externer Port 8080 → Interne Port 8080, Protokoll UDP, Ziel: Ihre PC-IP.',
      'worldwideRouterStep5':
          'Speichern: Klicken Sie "Übernehmen" oder "Speichern". Fertig!',
      'worldwideRouterNote':
          '💡 Tipp: Port-Forwarding ist wie eine Tür für Ihre App - nur diese App kann durch diese Tür!',

      'worldwideSection2': '2. Windows Firewall (Automatisch sicher)',
      'worldwideFirewallStep1':
          'Windows-Suche: Geben Sie "Windows Defender Firewall" ein und öffnen.',
      'worldwideFirewallStep2':
          'Erweiterte Einstellungen: Klicken Sie links auf "Erweiterte Einstellungen".',
      'worldwideFirewallStep3':
          'Neue Regel: Rechtsklick auf "Eingehende Regeln" → "Neue Regel erstellen".',
      'worldwideFirewallStep4':
          'Port auswählen: Wählen Sie "Port" → "UDP" → "Spezifische lokale Ports: 8080".',
      'worldwideFirewallStep5':
          'Verbindung erlauben: "Verbindung zulassen" auswählen, alle Profile aktivieren.',
      'worldwideFirewallStep6':
          'Namen geben: "Remote Dock" als Regelname, fertig!',
      'worldwideFirewallNote':
          '🔒 Sicherheit: Dies erlaubt NUR Ihrer App den Zugriff - nichts anderes!',

      'worldwideSection3': '3. Öffentliche IP finden (30 Sekunden)',
      'worldwideIpStep1':
          'Website besuchen: Öffnen Sie whatismyip.com in Ihrem Browser.',
      'worldwideIpStep2':
          'IP kopieren: Die angezeigte Nummer ist Ihre "Wohnungsadresse" im Internet.',
      'worldwideIpStep3':
          'App aktualisieren: In der App Gerät bearbeiten → IP-Adresse durch öffentliche IP ersetzen.',
      'worldwideIpStep4':
          'Port beibehalten: Port 8080 bleibt gleich, nur IP ändert sich.',
      'worldwideIpNote':
          '🌍 Ihre öffentliche IP ändert sich selten - wenn doch, einfach wiederholen!',

      'worldwideSection4': '4. Testen & Fertigstellen!',
      'worldwideTestStep1':
          'UDP Listener starten: Doppelklick auf "start_udp_listener.bat" auf Ihrem PC.',
      'worldwideTestStep2':
          'Mobiles Daten nutzen: Schalten Sie WLAN aus, nutzen Sie mobile Daten.',
      'worldwideTestStep3':
          'App testen: Öffnen Sie Remote Dock, klicken Sie "PC AUSSCHALTEN".',
      'worldwideTestStep4':
          'Erfolg prüfen: PC sollte in Standby gehen - von überall!',
      'worldwideTestNote':
          '🎉 Gratulation! Ihr PC ist jetzt weltweit steuerbar!',

      'worldwideSecurityTitle': 'Sicherheit & Privatsphäre',
      'worldwideSecurityIntro': 'Ihre Sicherheit ist unser höchstes Priorität!',
      'worldwideSecurityPoint1':
          '🔒 ONLY your app: Port-Forwarding erlaubt NUR Ihrer App den Zugriff',
      'worldwideSecurityPoint2':
          '🛡️ No personal data: Die App sendet nur "SHUTDOWN" Befehle, keine persönlichen Daten',
      'worldwideSecurityPoint3':
          '🌐 Local control: Alle Befehle bleiben zwischen Ihrem Handy und PC',
      'worldwideSecurityPoint4':
          '📱 Safe connection: Verschlüsselte Verbindung durch Ihre App',
      'worldwideSecurityTip':
          '💡 Extra sicher: Nutzen Sie VPN für noch mehr Schutz!',

      'worldwideTroubleshooting': 'Fehlerbehebung',
      'worldwideTroubleshoot1':
          'Funktioniert nicht? Prüfen Sie Router-Einstellungen und Firewall.',
      'worldwideTroubleshoot2':
          'Keine Verbindung? Stellen Sie sicher, dass UDP Listener läuft.',
      'worldwideTroubleshoot3':
          'Mobile Daten nicht? Testen Sie zuerst im lokalen WLAN.',
      'worldwideTroubleshoot4':
          'IP hat sich geändert? whatismyip.com besuchen und aktualisieren.',

      'wolWorldwideTitle': 'Wake-on-LAN weltweit',
      'wolWorldwideIntro': 'Wecken Sie Ihren PC von überall auf der Welt!',
      'wolWorldwideSection1': '1. BIOS-Einstellungen (Einmalig)',
      'wolWorldwideBiosStep1':
          'PC neustarten: Während des Starts F2/F10/F12/DEL drücken für BIOS.',
      'wolWorldwideBiosStep2':
          'Wake-on-LAN finden: Suchen Sie nach "Power Management" oder "Advanced".',
      'wolWorldwideBiosStep3':
          'Optionen aktivieren: "Wake-on-LAN", "Deep Sleep S5", "Power On By PCI-E" auf "Enabled".',
      'wolWorldwideBiosStep4':
          'Speichern: F10 drücken, "Save & Exit" bestätigen.',
      'wolWorldwideBiosNote':
          '⚡ BIOS ist wie das Gehirn Ihres PCs - hier sagen wir ihm, dass er aufwachen soll!',

      'wolWorldwideSection2': '2. Router Wake-on-LAN (Wichtig!)',
      'wolWorldwideRouterStep1':
          'Router-Einstellungen: Zurück zu Ihrer Router-Admin-Seite.',
      'wolWorldwideRouterStep2':
          'WoL finden: Suchen Sie nach "Wake-on-LAN" oder "WoL Broadcasting".',
      'wolWorldwideRouterStep3':
          'Broadcast aktivieren: "Wake-on-LAN Broadcasting" einschalten.',
      'wolWorldwideRouterStep4':
          'Port weiterleiten: UDP Port 9 zu Ihrer PC-IP weiterleiten.',
      'wolWorldwideRouterStep5':
          'Broadcast-Adresse: Meistens "192.168.1.255" oder "192.168.0.255".',
      'wolWorldwideRouterNote':
          '📡 Broadcasting ist wie ein Wecker für Ihr Netzwerk - alle PCs hören zu!',

      'wolWorldwideSection3': '3. Windows Netzwerk (Kritisch!)',
      'wolWorldwideWindowsStep1':
          'Geräte-Manager: Windows-Taste + X → Geräte-Manager.',
      'wolWorldwideWindowsStep2':
          'Netzwerkadapter: "Netzwerkadapter" erweitern, Ihren Ethernet-Adapter finden.',
      'wolWorldwideWindowsStep3':
          'Energie-Einstellungen: Rechtsklick → Eigenschaften → "Energieverwaltung".',
      'wolWorldwideWindowsStep4':
          'Ausschalten verhindern: "Computer darf Gerät nicht ausschalten" DEAKTIVIEREN.',
      'wolWorldwideWindowsStep5':
          'Erweitert: Tab "Erweitert" → "Wake on Magic Packet" AKTIVIEREN.',
      'wolWorldwideWindowsStep6':
          'Green Ethernet: "Green Ethernet" oder "Energy Efficient" DEAKTIVIEREN.',
      'wolWorldwideWindowsNote':
          '🔌 Ethernet-Kabel ist Pflicht! WLAN funktioniert für Wake-on-LAN NIEMALS!',

      'wolWorldwideSection4': '4. Testen & Genießen!',
      'wolWorldwideTestStep1':
          'PC in Schlafmodus: Start-Menü → Schlafsymbol (nicht Ausschalten!).',
      'wolWorldwideTestStep2':
          'Warten: 30 Sekunden warten, bis PC wirklich schläft.',
      'wolWorldwideTestStep3':
          'App nutzen: Mobile Daten verwenden, "PC ANSCHALTEN" klicken.',
      'wolWorldwideTestStep4':
          'Erfolg: PC sollte nach 10-30 Sekunden aufwachen!',
      'wolWorldwideTestNote':
          '🌟 Perfekt! Ihr PC ist jetzt weltweit steuerbar!',
      'wolWorldwideSuccess': 'Wake-on-LAN weltweit gesendet',
      'wolWorldwideFailed': 'Wake-on-LAN weltweit fehlgeschlagen',
    },
    'en': {
      'tutWelcome': 'Hey!',
      'tutWelcomeSub': 'Glad you\'re here',
      'tutWelcome1': 'Works in WiFi only',
      'tutWelcome2': 'No account, no cloud',
      'tutWelcome3': 'Open Source code',
      'tutWelcome4': 'Setup in 3 minutes',
      'tutInstall': 'Prepare PC',
      'tutInstallSub': 'Small program needed',
      'tutInstall1': 'Download',
      'tutInstall1d': 'github.com/apple-is/RemoteDockService',
      'tutInstall2': 'Extract',
      'tutInstall2d': 'C:\\RemoteDockService',
      'tutInstall3': 'Install',
      'tutInstall3d': 'install.bat as Admin',
      'tutInstall4': 'Test',
      'tutInstall4d': 'http://localhost:8080/status',
      'tutDefender': 'Windows complaining?',
      'tutDefenderSub': 'No worries',
      'tutDefenderInfo': 'Windows blocks new programs.',
      'tutDefender1': 'Open Start',
      'tutDefender1d': 'Windows key → Virus',
      'tutDefender2': 'Settings',
      'tutDefender2d': 'Manage settings',
      'tutDefender3': 'Exclusions',
      'tutDefender3d': 'Add exclusion',
      'tutDefender4': 'Done',
      'tutDefender4d': 'C:\\RemoteDockService',
      'tutFind': 'Find PC data',
      'tutFindSub': 'IP, MAC & Broadcast',
      'tutFind1': 'IP Address',
      'tutFind1d': 'cmd → ipconfig → IPv4',
      'tutFind2': 'MAC Address',
      'tutFind2d': 'cmd → ipconfig /all',
      'tutFind3': 'Broadcast',
      'tutFind3d': 'IP ending with .255',
      'tutAdd': 'Add device',
      'tutAddSub': 'Almost done',
      'tutAdd1': 'Tap +',
      'tutAdd1d': 'Blue button bottom',
      'tutAdd2': 'Enter data',
      'tutAdd2d': 'Name, IP, MAC, Broadcast',
      'tutAdd3': 'Wake-on-LAN',
      'tutAdd3d': 'Only if wired + BIOS',
      'tutUse': 'How to use',
      'tutUseSub': 'Two buttons',
      'tutUse1': 'PC OFF',
      'tutUse1d': 'Tap → Sleep',
      'tutUse2': 'PC ON',
      'tutUse2d': 'Only with WoL',
      'tutUseTip': 'OFF always works.',
      'tutSecure': 'Safe?',
      'tutSecureSub': 'Yes!',
      'tutSecure1': 'Your WiFi only',
      'tutSecure1d': 'Nothing goes online',
      'tutSecure2': 'No cloud',
      'tutSecure2d': 'Data on phone only',
      'tutSecure3': 'Open Source',
      'tutSecure3d': 'Code on GitHub',
      'tutDone': 'Let\'s go!',
      'appTitle': 'Remote Dock',
      'subtitle': 'PC Control in LAN',
      'noDevices': 'No devices',
      'addHint': 'Tap +',
      'settings': 'Settings',
      'info': 'Info',
      'version': 'Version',
      'developer': 'Developer',
      'platform': 'Platform',
      'tutorial': 'Tutorial',
      'tutorialDesc': 'Learn Remote Dock.',
      'startTutorial': 'Start tutorial',
      'privacy': 'Privacy',
      'privacyText': 'Stored locally.',
      'help': 'Help',
      'helpText': 'ON = WoL. OFF = Sleep.',
      'addDevice': 'Add',
      'editDevice': 'Edit',
      'name': 'Name',
      'nameHint': 'My PC',
      'macAddress': 'MAC',
      'macHint': '50:EB:F6:20:1B:80',
      'ipAddress': 'IP',
      'ipHint': '192.168.178.46',
      'broadcast': 'Broadcast',
      'broadcastHint': '192.168.178.255',
      'wolPort': 'WoL Port',
      'shutdownPort': 'Port',
      'wolEnabled': 'Wake-on-LAN',
      'wolSubtitle': 'Turn on via app',
      'save': 'Save',
      'cancel': 'Cancel',
      'pcOn': 'PC ON',
      'pcOff': 'PC OFF',
      'shutdownConfirm': 'Shutdown?',
      'shutdownText': 'PC goes to sleep.',
      'shutdown': 'Shutdown',
      'delete': 'Delete',
      'deleteConfirm': 'Delete?',
      'deleteText': 'Delete @name?',
      'wolInfo': 'WoL needed.',
      'signalSent': 'Signal sent',
      'error': 'Error',
      'pcStandby': 'Going to sleep',
      'language': 'Language',
      'restartApp': 'Restart app',
      'online': 'Online',
      'offline': 'Offline',
      'notFound': 'Not found',
      'back': 'Back',
      'next': 'Next',
      'helpNameTitle': 'How to find PC Name',
      'helpName1': '1. Click the + button',
      'helpName2': '2. Enter your PC name',
      'helpName3': '3. Examples: My-PC, Office-PC, Desktop',
      'helpIpTitle': 'How to find IP Address',
      'helpIpWindows': 'Windows:',
      'helpIpWindows1': '1. Open Command Prompt (cmd)',
      'helpIpWindows2': '2. Type: ipconfig',
      'helpIpWindows3': '3. Look for "IPv4 Address"',
      'helpIpWindows4': '4. Copy the address (e.g. 192.168.1.100)',
      'helpIpMac': 'Mac/Linux:',
      'helpIpMac1': '1. Open Terminal',
      'helpIpMac2': '2. Type: ifconfig or ip addr',
      'helpIpMac3': '3. Look for "inet" address',
      'helpMacTitle': 'How to find MAC Address',
      'helpMacWindows': 'Windows:',
      'helpMacWindows1': '1. Open Command Prompt (cmd)',
      'helpMacWindows2': '2. Type: ipconfig /all',
      'helpMacWindows3': '3. Look for "Physical Address"',
      'helpMacWindows4': '4. Format: XX:XX:XX:XX:XX:XX',
      'helpMacMac': 'Mac/Linux:',
      'helpMacMac1': '1. Open Terminal',
      'helpMacMac2': '2. Type: ifconfig or ip addr',
      'helpMacMac3': '3. Look for "ether" address',
      'helpBroadcastTitle': 'How to find Broadcast Address',
      'helpBroadcast1': '1. Usually ends with .255',
      'helpBroadcast2': '2. Example: 192.168.1.255',
      'helpBroadcast3': '3. Check your router settings if unsure',
      'helpBroadcast4': '4. Same network as your IP, last part = 255',
      'helpDialogTitle': 'Help',
      'helpDialogNotAvailable': 'Help information not available.',
      'gotIt': 'Got it!',
      'requiredField': 'Required field',
      'deviceAdded': 'Device added',
      'howToFind': 'How to find {}',
      'setupTitle': 'Windows Built-in Remote Setup',
      'setupIntro': 'To enable remote PC control without external software:',
      'setupStep1': 'Enable Remote Desktop on your PC',
      'setupStep2': 'Configure Windows Firewall',
      'setupStep3': 'Set up power management',
      'setupStep4': 'Enable Wake-on-LAN in BIOS',
      'setupNote':
          'No additional software required - uses Windows built-in features',
      'pcSetupTutorial': 'PC Setup Tutorial',
      'pcControlSetup': 'PC Control Setup',
      'pcControlSetupIntro': 'For PC control to work, you need to set up:',
      'pcControlSetupStep1': 'Wake-on-LAN in BIOS and Windows',
      'pcControlSetupStep2': 'Network configuration',
      'pcControlSetupStep3': 'Power management settings',
      'pcControlSetupNote': 'This requires technical setup on your PC.',
      'viewSetupTutorial': 'View Setup Tutorial',
      'wolTab': 'Wake-on-LAN',
      'remoteDesktopTab': 'Remote Desktop',
      'troubleshootingTab': 'Troubleshooting',
      'wolSection1': '1. Enable Wake-on-LAN in BIOS (Detailed)',
      'wolStep1':
          'Restart PC and enter BIOS: Repeatedly press F2, F10, F12, or DEL during boot (varies by manufacturer). You\'ll see a blue/black screen with text menu.',
      'wolStep2':
          'Navigate with arrow keys to "Power Management Setup", "Advanced", or "Peripherals". Look for sub-menus like "ACPI Settings" or "Power On Options".',
      'wolStep3':
          'Enable these options: "Wake-on-LAN", "Wake on LAN", "Wake on PCI", "Power On By PCI-E", "Resume by LAN". Set them to "Enabled".',
      'wolStep4':
          'CRITICAL: Enable "Deep Sleep S5" or "S5 Wake Up". Without this, Wake-on-LAN won\'t work when PC is powered off!',
      'wolStep5':
          'Save with F10: Choose "Save & Exit" or "Save Changes and Reset". Confirm with "Yes" or "OK".',
      'wolSection2': '2. Configure Windows Power Settings',
      'wolPowerStep1': 'Open Control Panel → Power Options',
      'wolPowerStep2':
          'Click "Change plan settings" → "Change advanced power settings"',
      'wolPowerStep3': 'Expand "Sleep" → "Allow wake timers"',
      'wolPowerStep4': 'Set to "Enable"',
      'wolPowerStep5': 'Expand "Power buttons and lid"',
      'wolPowerStep6': 'Set "Sleep button action" to "Sleep"',
      'wolSection3': '3. Configure Network Adapter',
      'wolNetStep1': 'Open Device Manager',
      'wolNetStep2': 'Expand "Network adapters"',
      'wolNetStep3': 'Right-click your Ethernet adapter → Properties',
      'wolNetStep4': 'Go to "Power Management" tab',
      'wolNetStep5': 'Uncheck "Allow computer to turn off this device"',
      'wolNetStep6': 'Go to "Advanced" tab',
      'wolNetStep7': 'Enable "Wake on Magic Packet", "Wake on Pattern Match"',
      'wolImportant':
          'Important: Wake-on-LAN only works with wired Ethernet connection, not WiFi!',
      'rdSection1': '1. Enable Remote Desktop',
      'rdStep1': 'Press Windows Key + R, type "sysdm.cpl"',
      'rdStep2': 'Go to "Remote" tab',
      'rdStep3': 'Check "Allow remote connections to this computer"',
      'rdStep4':
          'Select "Allow connections only from computers running Remote Desktop"',
      'rdSection2': '2. Configure Windows Firewall',
      'rdFirewallStep1': 'Open Windows Defender Firewall',
      'rdFirewallStep2': 'Click "Allow an app or feature through firewall"',
      'rdFirewallStep3': 'Check "Remote Desktop"',
      'rdFirewallStep4':
          'Make sure both "Private" and "Public" networks are checked',
      'rdSection3': '3. Find Your PC Name and IP',
      'rdInfoStep1':
          'For PC Name: Windows Key + Pause/Break → Look at "PC name"',
      'rdInfoStep2': 'For IP Address: Open Command Prompt, type "ipconfig"',
      'rdInfoStep3': 'Look for "IPv4 Address" (e.g., 192.168.1.100)',
      'rdNote':
          'Note: Remote Desktop requires Windows Pro/Enterprise editions. Windows Home users need alternative solutions.',
      'troubleshootingTitle': 'Common Issues & Solutions',
      'wolNotWorking': 'Wake-on-LAN not working',
      'wolTroubleshoot1': 'Check if PC is connected via Ethernet (not WiFi)',
      'wolTroubleshoot2': 'Verify BIOS settings are saved',
      'wolTroubleshoot3': 'Test with PC in sleep mode (not fully shutdown)',
      'wolTroubleshoot4':
          'Check router settings for UDP port forwarding (port 9)',
      'wolTroubleshoot5':
          'Try different broadcast address (usually ends with .255)',
      'rdConnectionFailed': 'Remote Desktop connection failed',
      'rdTroubleshoot1': 'Verify both PCs are on same network',
      'rdTroubleshoot2': 'Check Windows Firewall settings',
      'rdTroubleshoot3': 'Try using PC IP address instead of name',
      'rdTroubleshoot4': 'Ensure Remote Desktop service is running',
      'rdTroubleshoot5': 'Check if Windows edition supports Remote Desktop',
      'deviceOffline': 'App shows device offline',
      'offlineTroubleshoot1': 'Verify device IP address is correct',
      'offlineTroubleshoot2': 'Check if device is on same network',
      'offlineTroubleshoot3': 'Try pinging the device from your phone',
      'offlineTroubleshoot4': 'Ensure device is not in deep sleep mode',
      'offlineTroubleshoot5': 'Check network router settings',
      'alternativeSolutions': 'Alternative Solutions',
      'alternativeTip1':
          'For Windows Home users: Use third-party remote desktop apps',
      'alternativeTip2': 'For mobile control: Consider VNC or TeamViewer',
      'alternativeTip3': 'For simple shutdown: Use Windows PowerShell scripts',
      'alternativeTip4':
          'For Wake-on-LAN: Try specialized WoL apps for testing',
      'pcShutdownMethod': 'Choose shutdown method:',
      'pcStandbyAction': 'Put PC to sleep',
      'pcSetupRequired': 'PC Setup Required',
      'pcNotResponding': 'PC not responding to shutdown signal.',
      'pcSolution': 'Solution:',
      'pcStep1': '1. Create folder C:\\RemoteDock',
      'pcStep2': '2. Create shutdown.bat with this content:',
      'pcStep3': '3. Test by double-clicking shutdown.bat',
      'pcListenerStarted': 'UDP Listener started',
      'pcListenerWaiting': 'Waiting for shutdown signals...',
      'pcListenerStopped': 'UDP Listener stopped',
      'pcListenerError': 'Error starting listener',
      'pcSecurityNote': 'Security Note:',
      'pcSecurityText':
          'This app works only on local WiFi. No data is sent to the internet.',

      // UDP Listener Auto-Start Tutorial
      'udpListenerTitle': 'UDP Listener Auto-Start',
      'udpListenerIntro':
          'Start the UDP Listener automatically at Windows startup in the background - without any window!',
      'udpListenerSection1': '1. Open PowerShell as Administrator',
      'udpListenerStep1': 'Press Windows Key and type "PowerShell"',
      'udpListenerStep2':
          'DO NOT right-click! Instead: Click "Run as Administrator" in the result',
      'udpListenerStep3':
          'Alternative: Windows Key + X → "Windows PowerShell (Administrator)"',
      'udpListenerSection2': '2. Navigate to project folder',
      'udpListenerNavStep1':
          'In PowerShell: cd "E:\\Programming\\Flutter\\KI Projects\\remote_dock - Dev"',
      'udpListenerNavStep2': 'Replace the path with your actual project folder',
      'udpListenerNavStep3': 'Tip: Copy folder path and paste it in PowerShell',
      'udpListenerSection3': '3. Run installation script',
      'udpListenerInstallStep1': 'Type: .\\install_udp_listener_service.ps1',
      'udpListenerInstallStep2': 'Press Enter',
      'udpListenerInstallStep3':
          'Confirm all security prompts with "Y" or "Yes"',
      'udpListenerInstallStep4': 'Wait for "Installation Complete" message',
      'udpListenerSection4': '4. Verify',
      'udpListenerVerifyStep1':
          'Open Task Scheduler: Windows Key + R → "taskschd.msc"',
      'udpListenerVerifyStep2': 'Search for "RemoteDockUDPListener"',
      'udpListenerVerifyStep3': 'Status should be "Ready"',
      'udpListenerSection5': '5. Test',
      'udpListenerTestStep1': 'Restart your PC',
      'udpListenerTestStep2':
          'Open Task Scheduler and check if task is running',
      'udpListenerTestStep3':
          'UDP Listener should be running in background (no window)',
      'udpListenerNote':
          '💡 The listener now starts automatically every time your PC boots!',
      'udpListenerUninstall': 'To remove:',
      'udpListenerUninstallStep1': 'Open PowerShell as Administrator',
      'udpListenerUninstallStep2': 'Navigate to folder',
      'udpListenerUninstallStep3':
          'Type: .\\uninstall_udp_listener_service.ps1',

      // Worldwide Access Tutorial
      'worldwideTitle': 'Worldwide PC Access',
      'worldwideIntro':
          'Control your PC from anywhere in the world! Follow these simple steps for global access.',
      'worldwideSection1': '1. Configure Router (Easy!)',
      'worldwideRouterStep1':
          'Open router admin page: Enter "192.168.1.1" or "192.168.0.1" in your browser.',
      'worldwideRouterStep2':
          'Login: Use admin password (often printed on router back).',
      'worldwideRouterStep3':
          'Find Port Forwarding: Look for "Port Forwarding" or "Virtual Server".',
      'worldwideRouterStep4':
          'Create rule: External Port 8080 → Internal Port 8080, Protocol UDP, Target: Your PC IP.',
      'worldwideRouterStep5': 'Save: Click "Apply" or "Save". Done!',
      'worldwideRouterNote':
          '💡 Tip: Port Forwarding is like a door for your app - only this app can use this door!',

      'worldwideSection2': '2. Windows Firewall (Automatically Safe)',
      'worldwideFirewallStep1':
          'Windows Search: Type "Windows Defender Firewall" and open.',
      'worldwideFirewallStep2':
          'Advanced Settings: Click "Advanced Settings" on the left.',
      'worldwideFirewallStep3':
          'New Rule: Right-click "Inbound Rules" → "New Rule".',
      'worldwideFirewallStep4':
          'Select Port: Choose "Port" → "UDP" → "Specific local ports: 8080".',
      'worldwideFirewallStep5':
          'Allow Connection: Select "Allow the connection", enable all profiles.',
      'worldwideFirewallStep6': 'Name it: "Remote Dock" as rule name, done!',
      'worldwideFirewallNote':
          '🔒 Security: This allows ONLY your app access - nothing else!',

      'worldwideSection3': '3. Find Public IP (30 seconds)',
      'worldwideIpStep1': 'Visit website: Open whatismyip.com in your browser.',
      'worldwideIpStep2':
          'Copy IP: The number shown is your "home address" on the internet.',
      'worldwideIpStep3':
          'Update app: In app, edit device → Replace IP address with public IP.',
      'worldwideIpStep4': 'Keep port: Port 8080 stays same, only IP changes.',
      'worldwideIpNote':
          '🌍 Your public IP rarely changes - if it does, just repeat!',

      'worldwideSection4': '4. Test & Complete!',
      'worldwideTestStep1':
          'Start UDP Listener: Double-click "start_udp_listener.bat" on your PC.',
      'worldwideTestStep2': 'Use Mobile Data: Turn off WiFi, use mobile data.',
      'worldwideTestStep3': 'Test app: Open Remote Dock, click "PC OFF".',
      'worldwideTestStep4':
          'Check success: PC should go to sleep - from anywhere!',
      'worldwideTestNote':
          '🎉 Congratulations! Your PC is now controllable worldwide!',

      'worldwideSecurityTitle': 'Security & Privacy',
      'worldwideSecurityIntro': 'Your security is our highest priority!',
      'worldwideSecurityPoint1':
          '🔒 ONLY your app: Port Forwarding allows ONLY your app access',
      'worldwideSecurityPoint2':
          '🛡️ No personal data: App only sends "SHUTDOWN" commands, no personal data',
      'worldwideSecurityPoint3':
          '🌐 Local control: All commands stay between your phone and PC',
      'worldwideSecurityPoint4':
          '📱 Safe connection: Encrypted connection through your app',
      'worldwideSecurityTip':
          '💡 Extra secure: Use VPN for even more protection!',

      'worldwideTroubleshooting': 'Troubleshooting',
      'worldwideTroubleshoot1':
          'Not working? Check router settings and firewall.',
      'worldwideTroubleshoot2':
          'No connection? Make sure UDP Listener is running.',
      'worldwideTroubleshoot3':
          'Mobile data not working? Test on local WiFi first.',
      'worldwideTroubleshoot4': 'IP changed? Visit whatismyip.com and update.',

      'wolWorldwideTitle': 'Wake-on-LAN Worldwide',
      'wolWorldwideIntro': 'Wake your PC from anywhere in the world!',
      'wolWorldwideSection1': '1. BIOS Settings (One-time)',
      'wolWorldwideBiosStep1':
          'Restart PC: During boot, press F2/F10/F12/DEL for BIOS.',
      'wolWorldwideBiosStep2':
          'Find Wake-on-LAN: Look for "Power Management" or "Advanced".',
      'wolWorldwideBiosStep3':
          'Enable options: Set "Wake-on-LAN", "Deep Sleep S5", "Power On By PCI-E" to "Enabled".',
      'wolWorldwideBiosStep4': 'Save: Press F10, confirm "Save & Exit".',
      'wolWorldwideBiosNote':
          '⚡ BIOS is like your PC\'s brain - here we tell it to wake up!',

      'wolWorldwideSection2': '2. Router Wake-on-LAN (Important!)',
      'wolWorldwideRouterStep1':
          'Router settings: Go back to your router admin page.',
      'wolWorldwideRouterStep2':
          'Find WoL: Look for "Wake-on-LAN" or "WoL Broadcasting".',
      'wolWorldwideRouterStep3':
          'Enable broadcast: Turn on "Wake-on-LAN Broadcasting".',
      'wolWorldwideRouterStep4':
          'Forward port: Forward UDP Port 9 to your PC IP.',
      'wolWorldwideRouterStep5':
          'Broadcast address: Usually "192.168.1.255" or "192.168.0.255".',
      'wolWorldwideRouterNote':
          '📡 Broadcasting is like an alarm clock for your network - all PCs listen!',

      'wolWorldwideSection3': '3. Windows Network (Critical!)',
      'wolWorldwideWindowsStep1':
          'Device Manager: Windows Key + X → Device Manager.',
      'wolWorldwideWindowsStep2':
          'Network adapter: Expand "Network adapters", find your Ethernet adapter.',
      'wolWorldwideWindowsStep3':
          'Power settings: Right-click → Properties → "Power Management".',
      'wolWorldwideWindowsStep4':
          'Prevent shutdown: UNCHECK "Allow computer to turn off this device".',
      'wolWorldwideWindowsStep5':
          'Advanced: "Advanced" tab → Enable "Wake on Magic Packet".',
      'wolWorldwideWindowsStep6':
          'Green Ethernet: DISABLE "Green Ethernet" or "Energy Efficient".',
      'wolWorldwideWindowsNote':
          '🔌 Ethernet cable required! WiFi NEVER works for Wake-on-LAN!',

      'wolWorldwideSection4': '4. Test & Enjoy!',
      'wolWorldwideTestStep1':
          'Sleep mode: Start Menu → Sleep icon (NOT shutdown!).',
      'wolWorldwideTestStep2':
          'Wait: Wait 30 seconds for PC to actually sleep.',
      'wolWorldwideTestStep3': 'Use app: Use mobile data, click "PC ON".',
      'wolWorldwideTestStep4': 'Success: PC should wake up in 10-30 seconds!',
      'wolWorldwideTestNote':
          '🌟 Perfect! Your PC is now controllable worldwide!',
    },
  };

  String get tutWelcome => _g('tutWelcome');
  String get tutWelcomeSub => _g('tutWelcomeSub');
  String get tutWelcome1 => _g('tutWelcome1');
  String get tutWelcome2 => _g('tutWelcome2');
  String get tutWelcome3 => _g('tutWelcome3');
  String get tutWelcome4 => _g('tutWelcome4');
  String get tutInstall => _g('tutInstall');
  String get tutInstallSub => _g('tutInstallSub');
  String get tutInstall1 => _g('tutInstall1');
  String get tutInstall1d => _g('tutInstall1d');
  String get tutInstall2 => _g('tutInstall2');
  String get tutInstall2d => _g('tutInstall2d');
  String get tutInstall3 => _g('tutInstall3');
  String get tutInstall3d => _g('tutInstall3d');
  String get tutInstall4 => _g('tutInstall4');
  String get tutInstall4d => _g('tutInstall4d');
  String get tutDefender => _g('tutDefender');
  String get tutDefenderSub => _g('tutDefenderSub');
  String get tutDefenderInfo => _g('tutDefenderInfo');
  String get tutDefender1 => _g('tutDefender1');
  String get tutDefender1d => _g('tutDefender1d');
  String get tutDefender2 => _g('tutDefender2');
  String get tutDefender2d => _g('tutDefender2d');
  String get tutDefender3 => _g('tutDefender3');
  String get tutDefender3d => _g('tutDefender3d');
  String get tutDefender4 => _g('tutDefender4');
  String get tutDefender4d => _g('tutDefender4d');
  String get tutFind => _g('tutFind');
  String get tutFindSub => _g('tutFindSub');
  String get tutFind1 => _g('tutFind1');
  String get tutFind1d => _g('tutFind1d');
  String get tutFind2 => _g('tutFind2');
  String get tutFind2d => _g('tutFind2d');
  String get tutFind3 => _g('tutFind3');
  String get tutFind3d => _g('tutFind3d');
  String get tutAdd => _g('tutAdd');
  String get tutAddSub => _g('tutAddSub');
  String get tutAdd1 => _g('tutAdd1');
  String get tutAdd1d => _g('tutAdd1d');
  String get tutAdd2 => _g('tutAdd2');
  String get tutAdd2d => _g('tutAdd2d');
  String get tutAdd3 => _g('tutAdd3');
  String get tutAdd3d => _g('tutAdd3d');
  String get tutUse => _g('tutUse');
  String get tutUseSub => _g('tutUseSub');
  String get tutUse1 => _g('tutUse1');
  String get tutUse1d => _g('tutUse1d');
  String get tutUse2 => _g('tutUse2');
  String get tutUse2d => _g('tutUse2d');
  String get tutUseTip => _g('tutUseTip');
  String get tutSecure => _g('tutSecure');
  String get tutSecureSub => _g('tutSecureSub');
  String get tutSecure1 => _g('tutSecure1');
  String get tutSecure1d => _g('tutSecure1d');
  String get tutSecure2 => _g('tutSecure2');
  String get tutSecure2d => _g('tutSecure2d');
  String get tutSecure3 => _g('tutSecure3');
  String get tutSecure3d => _g('tutSecure3d');
  String get tutDone => _g('tutDone');
  String get appTitle => _g('appTitle');
  String get subtitle => _g('subtitle');
  String get noDevices => _g('noDevices');
  String get addHint => _g('addHint');
  String get settings => _g('settings');
  String get info => _g('info');
  String get version => _g('version');
  String get developer => _g('developer');
  String get platform => _g('platform');
  String get tutorial => _g('tutorial');
  String get tutorialDesc => _g('tutorialDesc');
  String get startTutorial => _g('startTutorial');
  String get privacy => _g('privacy');
  String get privacyText => _g('privacyText');
  String get help => _g('help');
  String get helpText => _g('helpText');
  String get addDevice => _g('addDevice');
  String get editDevice => _g('editDevice');
  String get name => _g('name');
  String get nameHint => _g('nameHint');
  String get macAddress => _g('macAddress');
  String get macHint => _g('macHint');
  String get ipAddress => _g('ipAddress');
  String get ipHint => _g('ipHint');
  String get broadcast => _g('broadcast');
  String get broadcastHint => _g('broadcastHint');
  String get wolPort => _g('wolPort');
  String get shutdownPort => _g('shutdownPort');
  String get wolEnabled => _g('wolEnabled');
  String get wolSubtitle => _g('wolSubtitle');
  String get save => _g('save');
  String get cancel => _g('cancel');
  String get pcOn => _g('pcOn');
  String get pcOff => _g('pcOff');
  String get shutdownConfirm => _g('shutdownConfirm');
  String get shutdownText => _g('shutdownText');
  String get shutdown => _g('shutdown');
  String get delete => _g('delete');
  String get deleteConfirm => _g('deleteConfirm');
  String deleteText(String name) => _g('deleteText').replaceAll('@name', name);
  String get wolInfo => _g('wolInfo');
  String get signalSent => _g('signalSent');
  String get error => _g('error');
  String get pcStandby => _g('pcStandby');
  String get language => _g('language');
  String get restartApp => _g('restartApp');
  String get online => _g('online');
  String get offline => _g('offline');
  String get notFound => _g('notFound');
  String get back => _g('back');
  String get next => _g('next');
  String get helpNameTitle => _g('helpNameTitle');
  String get helpName1 => _g('helpName1');
  String get helpName2 => _g('helpName2');
  String get helpName3 => _g('helpName3');
  String get helpIpTitle => _g('helpIpTitle');
  String get helpIpWindows => _g('helpIpWindows');
  String get helpIpWindows1 => _g('helpIpWindows1');
  String get helpIpWindows2 => _g('helpIpWindows2');
  String get helpIpWindows3 => _g('helpIpWindows3');
  String get helpIpWindows4 => _g('helpIpWindows4');
  String get helpIpMac => _g('helpIpMac');
  String get helpIpMac1 => _g('helpIpMac1');
  String get helpIpMac2 => _g('helpIpMac2');
  String get helpIpMac3 => _g('helpIpMac3');
  String get helpMacTitle => _g('helpMacTitle');
  String get helpMacWindows => _g('helpMacWindows');
  String get helpMacWindows1 => _g('helpMacWindows1');
  String get helpMacWindows2 => _g('helpMacWindows2');
  String get helpMacWindows3 => _g('helpMacWindows3');
  String get helpMacWindows4 => _g('helpMacWindows4');
  String get helpMacMac => _g('helpMacMac');
  String get helpMacMac1 => _g('helpMacMac1');
  String get helpMacMac2 => _g('helpMacMac2');
  String get helpMacMac3 => _g('helpMacMac3');
  String get helpBroadcastTitle => _g('helpBroadcastTitle');
  String get helpBroadcast1 => _g('helpBroadcast1');
  String get helpBroadcast2 => _g('helpBroadcast2');
  String get helpBroadcast3 => _g('helpBroadcast3');
  String get helpBroadcast4 => _g('helpBroadcast4');
  String get helpDialogTitle => _g('helpDialogTitle');
  String get helpDialogNotAvailable => _g('helpDialogNotAvailable');
  String get gotIt => _g('gotIt');
  String get requiredField => _g('requiredField');
  String get deviceAdded => _g('deviceAdded');
  String howToFind(String fieldType) =>
      _g('howToFind').replaceAll('{}', fieldType);
  String get setupTitle => _g('setupTitle');
  String get setupIntro => _g('setupIntro');
  String get setupStep1 => _g('setupStep1');
  String get setupStep2 => _g('setupStep2');
  String get setupStep3 => _g('setupStep3');
  String get setupStep4 => _g('setupStep4');
  String get setupNote => _g('setupNote');
  String get pcSetupTutorial => _g('pcSetupTutorial');
  String get pcControlSetup => _g('pcControlSetup');
  String get pcControlSetupIntro => _g('pcControlSetupIntro');
  String get pcControlSetupStep1 => _g('pcControlSetupStep1');
  String get pcControlSetupStep2 => _g('pcControlSetupStep2');
  String get pcControlSetupStep3 => _g('pcControlSetupStep3');
  String get pcControlSetupNote => _g('pcControlSetupNote');
  String get viewSetupTutorial => _g('viewSetupTutorial');
  String get wolTab => _g('wolTab');
  String get remoteDesktopTab => _g('remoteDesktopTab');
  String get troubleshootingTab => _g('troubleshootingTab');
  String get wolSection1 => _g('wolSection1');
  String get wolStep1 => _g('wolStep1');
  String get wolStep2 => _g('wolStep2');
  String get wolStep3 => _g('wolStep3');
  String get wolStep4 => _g('wolStep4');
  String get wolStep5 => _g('wolStep5');
  String get wolSection2 => _g('wolSection2');
  String get wolPowerStep1 => _g('wolPowerStep1');
  String get wolPowerStep2 => _g('wolPowerStep2');
  String get wolPowerStep3 => _g('wolPowerStep3');
  String get wolPowerStep4 => _g('wolPowerStep4');
  String get wolPowerStep5 => _g('wolPowerStep5');
  String get wolPowerStep6 => _g('wolPowerStep6');
  String get wolSection3 => _g('wolSection3');
  String get wolNetStep1 => _g('wolNetStep1');
  String get wolNetStep2 => _g('wolNetStep2');
  String get wolNetStep3 => _g('wolNetStep3');
  String get wolNetStep4 => _g('wolNetStep4');
  String get wolNetStep5 => _g('wolNetStep5');
  String get wolNetStep6 => _g('wolNetStep6');
  String get wolNetStep7 => _g('wolNetStep7');
  String get wolImportant => _g('wolImportant');
  String get rdSection1 => _g('rdSection1');
  String get rdStep1 => _g('rdStep1');
  String get rdStep2 => _g('rdStep2');
  String get rdStep3 => _g('rdStep3');
  String get rdStep4 => _g('rdStep4');
  String get rdSection2 => _g('rdSection2');
  String get rdFirewallStep1 => _g('rdFirewallStep1');
  String get rdFirewallStep2 => _g('rdFirewallStep2');
  String get rdFirewallStep3 => _g('rdFirewallStep3');
  String get rdFirewallStep4 => _g('rdFirewallStep4');
  String get rdSection3 => _g('rdSection3');
  String get rdInfoStep1 => _g('rdInfoStep1');
  String get rdInfoStep2 => _g('rdInfoStep2');
  String get rdInfoStep3 => _g('rdInfoStep3');
  String get rdNote => _g('rdNote');
  String get troubleshootingTitle => _g('troubleshootingTitle');
  String get wolNotWorking => _g('wolNotWorking');
  String get wolTroubleshoot1 => _g('wolTroubleshoot1');
  String get wolTroubleshoot2 => _g('wolTroubleshoot2');
  String get wolTroubleshoot3 => _g('wolTroubleshoot3');
  String get wolTroubleshoot4 => _g('wolTroubleshoot4');
  String get wolTroubleshoot5 => _g('wolTroubleshoot5');
  String get rdConnectionFailed => _g('rdConnectionFailed');
  String get rdTroubleshoot1 => _g('rdTroubleshoot1');
  String get rdTroubleshoot2 => _g('rdTroubleshoot2');
  String get rdTroubleshoot3 => _g('rdTroubleshoot3');
  String get rdTroubleshoot4 => _g('rdTroubleshoot4');
  String get rdTroubleshoot5 => _g('rdTroubleshoot5');
  String get deviceOffline => _g('deviceOffline');
  String get offlineTroubleshoot1 => _g('offlineTroubleshoot1');
  String get offlineTroubleshoot2 => _g('offlineTroubleshoot2');
  String get offlineTroubleshoot3 => _g('offlineTroubleshoot3');
  String get offlineTroubleshoot4 => _g('offlineTroubleshoot4');
  String get offlineTroubleshoot5 => _g('offlineTroubleshoot5');
  String get alternativeSolutions => _g('alternativeSolutions');
  String get alternativeTip1 => _g('alternativeTip1');
  String get alternativeTip2 => _g('alternativeTip2');
  String get alternativeTip3 => _g('alternativeTip3');
  String get alternativeTip4 => _g('alternativeTip4');
  String get pcShutdownMethod => _g('pcShutdownMethod');
  String get pcStandbyAction => _g('pcStandbyAction');
  String get pcSetupRequired => _g('pcSetupRequired');
  String get pcNotResponding => _g('pcNotResponding');
  String get pcSolution => _g('pcSolution');
  String get pcStep1 => _g('pcStep1');
  String get pcStep2 => _g('pcStep2');
  String get pcStep3 => _g('pcStep3');
  String get pcListenerStarted => _g('pcListenerStarted');
  String get pcListenerWaiting => _g('pcListenerWaiting');
  String get pcListenerStopped => _g('pcListenerStopped');
  String get pcListenerError => _g('pcListenerError');
  String get pcSecurityNote => _g('pcSecurityNote');
  String get pcSecurityText => _g('pcSecurityText');
  String get udpListenerTitle => _g('udpListenerTitle');
  String get udpListenerIntro => _g('udpListenerIntro');
  String get udpListenerSection1 => _g('udpListenerSection1');
  String get udpListenerStep1 => _g('udpListenerStep1');
  String get udpListenerStep2 => _g('udpListenerStep2');
  String get udpListenerStep3 => _g('udpListenerStep3');
  String get udpListenerSection2 => _g('udpListenerSection2');
  String get udpListenerNavStep1 => _g('udpListenerNavStep1');
  String get udpListenerNavStep2 => _g('udpListenerNavStep2');
  String get udpListenerNavStep3 => _g('udpListenerNavStep3');
  String get udpListenerSection3 => _g('udpListenerSection3');
  String get udpListenerInstallStep1 => _g('udpListenerInstallStep1');
  String get udpListenerInstallStep2 => _g('udpListenerInstallStep2');
  String get udpListenerInstallStep3 => _g('udpListenerInstallStep3');
  String get udpListenerInstallStep4 => _g('udpListenerInstallStep4');
  String get udpListenerSection4 => _g('udpListenerSection4');
  String get udpListenerVerifyStep1 => _g('udpListenerVerifyStep1');
  String get udpListenerVerifyStep2 => _g('udpListenerVerifyStep2');
  String get udpListenerVerifyStep3 => _g('udpListenerVerifyStep3');
  String get udpListenerSection5 => _g('udpListenerSection5');
  String get udpListenerTestStep1 => _g('udpListenerTestStep1');
  String get udpListenerTestStep2 => _g('udpListenerTestStep2');
  String get udpListenerTestStep3 => _g('udpListenerTestStep3');
  String get udpListenerNote => _g('udpListenerNote');
  String get udpListenerUninstall => _g('udpListenerUninstall');
  String get udpListenerUninstallStep1 => _g('udpListenerUninstallStep1');
  String get udpListenerUninstallStep2 => _g('udpListenerUninstallStep2');
  String get udpListenerUninstallStep3 => _g('udpListenerUninstallStep3');
  String get worldwideTitle => _g('worldwideTitle');
  String get worldwideIntro => _g('worldwideIntro');
  String get worldwideSection1 => _g('worldwideSection1');
  String get worldwideRouterStep1 => _g('worldwideRouterStep1');
  String get worldwideRouterStep2 => _g('worldwideRouterStep2');
  String get worldwideRouterStep3 => _g('worldwideRouterStep3');
  String get worldwideRouterStep4 => _g('worldwideRouterStep4');
  String get worldwideRouterStep5 => _g('worldwideRouterStep5');
  String get worldwideRouterNote => _g('worldwideRouterNote');
  String get worldwideSection2 => _g('worldwideSection2');
  String get worldwideFirewallStep1 => _g('worldwideFirewallStep1');
  String get worldwideFirewallStep2 => _g('worldwideFirewallStep2');
  String get worldwideFirewallStep3 => _g('worldwideFirewallStep3');
  String get worldwideFirewallStep4 => _g('worldwideFirewallStep4');
  String get worldwideFirewallStep5 => _g('worldwideFirewallStep5');
  String get worldwideFirewallStep6 => _g('worldwideFirewallStep6');
  String get worldwideFirewallNote => _g('worldwideFirewallNote');
  String get worldwideSection3 => _g('worldwideSection3');
  String get worldwideIpStep1 => _g('worldwideIpStep1');
  String get worldwideIpStep2 => _g('worldwideIpStep2');
  String get worldwideIpStep3 => _g('worldwideIpStep3');
  String get worldwideIpStep4 => _g('worldwideIpStep4');
  String get worldwideIpNote => _g('worldwideIpNote');
  String get worldwideSection4 => _g('worldwideSection4');
  String get worldwideTestStep1 => _g('worldwideTestStep1');
  String get worldwideTestStep2 => _g('worldwideTestStep2');
  String get worldwideTestStep3 => _g('worldwideTestStep3');
  String get worldwideTestStep4 => _g('worldwideTestStep4');
  String get worldwideTestNote => _g('worldwideTestNote');
  String get worldwideSecurityTitle => _g('worldwideSecurityTitle');
  String get worldwideSecurityIntro => _g('worldwideSecurityIntro');
  String get worldwideSecurityPoint1 => _g('worldwideSecurityPoint1');
  String get worldwideSecurityPoint2 => _g('worldwideSecurityPoint2');
  String get worldwideSecurityPoint3 => _g('worldwideSecurityPoint3');
  String get worldwideSecurityPoint4 => _g('worldwideSecurityPoint4');
  String get worldwideSecurityTip => _g('worldwideSecurityTip');
  String get worldwideTroubleshooting => _g('worldwideTroubleshooting');
  String get worldwideTroubleshoot1 => _g('worldwideTroubleshoot1');
  String get worldwideTroubleshoot2 => _g('worldwideTroubleshoot2');
  String get worldwideTroubleshoot3 => _g('worldwideTroubleshoot3');
  String get worldwideTroubleshoot4 => _g('worldwideTroubleshoot4');
  String get wolWorldwideTitle => _g('wolWorldwideTitle');
  String get wolWorldwideIntro => _g('wolWorldwideIntro');
  String get wolWorldwideSection1 => _g('wolWorldwideSection1');
  String get wolWorldwideBiosStep1 => _g('wolWorldwideBiosStep1');
  String get wolWorldwideBiosStep2 => _g('wolWorldwideBiosStep2');
  String get wolWorldwideBiosStep3 => _g('wolWorldwideBiosStep3');
  String get wolWorldwideBiosStep4 => _g('wolWorldwideBiosStep4');
  String get wolWorldwideBiosNote => _g('wolWorldwideBiosNote');
  String get wolWorldwideSection2 => _g('wolWorldwideSection2');
  String get wolWorldwideRouterStep1 => _g('wolWorldwideRouterStep1');
  String get wolWorldwideRouterStep2 => _g('wolWorldwideRouterStep2');
  String get wolWorldwideRouterStep3 => _g('wolWorldwideRouterStep3');
  String get wolWorldwideRouterStep4 => _g('wolWorldwideRouterStep4');
  String get wolWorldwideRouterStep5 => _g('wolWorldwideRouterStep5');
  String get wolWorldwideRouterNote => _g('wolWorldwideRouterNote');
  String get wolWorldwideSection3 => _g('wolWorldwideSection3');
  String get wolWorldwideWindowsStep1 => _g('wolWorldwideWindowsStep1');
  String get wolWorldwideWindowsStep2 => _g('wolWorldwideWindowsStep2');
  String get wolWorldwideWindowsStep3 => _g('wolWorldwideWindowsStep3');
  String get wolWorldwideWindowsStep4 => _g('wolWorldwideWindowsStep4');
  String get wolWorldwideWindowsStep5 => _g('wolWorldwideWindowsStep5');
  String get wolWorldwideWindowsStep6 => _g('wolWorldwideWindowsStep6');
  String get wolWorldwideWindowsNote => _g('wolWorldwideWindowsNote');
  String get wolWorldwideSection4 => _g('wolWorldwideSection4');
  String get wolWorldwideTestStep1 => _g('wolWorldwideTestStep1');
  String get wolWorldwideTestStep2 => _g('wolWorldwideTestStep2');
  String get wolWorldwideTestStep3 => _g('wolWorldwideTestStep3');
  String get wolWorldwideTestStep4 => _g('wolWorldwideTestStep4');
  String get wolWorldwideTestNote => _g('wolWorldwideTestNote');
  String get wolWorldwideSuccess => _g('wolWorldwideSuccess');
  String get wolWorldwideFailed => _g('wolWorldwideFailed');
  String get authDescription => _g('authDescription');
  String get authReason => _g('authReason');
  String get authenticate => _g('authenticate');
  String get usePassword => _g('usePassword');
  String get authFailed => _g('authFailed');
  String get authFailedMessage => _g('authFailedMessage');
  String get retry => _g('retry');
  String get security => _g('security');
  String get securityEnabled => _g('securityEnabled');
  String get securityDisabled => _g('securityDisabled');
  String get authTimeout => _g('authTimeout');
  String get minutes => _g('minutes');
  String get deviceNotSecure => _g('deviceNotSecure');
  String get deviceNotSecureMessage => _g('deviceNotSecureMessage');
  String get securityRisk => _g('securityRisk');
  String get ok => _g('ok');

  String _g(String key) {
    if (_t.containsKey(languageCode) && _t[languageCode]!.containsKey(key)) {
      return _t[languageCode]![key]!;
    }
    return _t['en']![key] ?? key;
  }
}

class _Delegate extends LocalizationsDelegate<AppLocalizations> {
  const _Delegate();
  @override
  bool isSupported(Locale locale) => true;
  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale.languageCode);
  @override
  bool shouldReload(covariant _Delegate old) => false;
}
