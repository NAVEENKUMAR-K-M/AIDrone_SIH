import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RapidWing Ops',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      ),
      home: const AppWrapper(),
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool isLoggedIn = false;
  String userRole = 'responder';

  void handleLogin(String role) {
    setState(() {
      userRole = role;
      isLoggedIn = true;
    });
  }

  void handleLogout() {
    setState(() {
      isLoggedIn = false;
      userRole = 'responder';
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? MainApp(userRole: userRole, onLogout: handleLogout)
        : LoginScreen(onLogin: handleLogin);
  }
}

// --- Mock Data ---
final List<Map<String, dynamic>> mockActiveMissions = [
  {
    'id': 'M-001',
    'status': 'In Transit',
    'drone': 'Drone-A1',
    'location': {'lat': 9.9252, 'lon': 78.1198},
    'destination': 'Relief Camp Alpha',
    'battery': '78%',
    'eta': '12 mins'
  },
  {
    'id': 'M-002',
    'status': 'Delivering',
    'drone': 'Drone-B3',
    'location': {'lat': 9.9310, 'lon': 78.1238},
    'destination': 'Isolated Village',
    'battery': '55%',
    'eta': '25 mins'
  },
  {
    'id': 'M-003',
    'status': 'Returning',
    'drone': 'Drone-C2',
    'location': {'lat': 9.9195, 'lon': 78.1100},
    'destination': 'Command Post',
    'battery': '30%',
    'eta': '8 mins'
  },
  {
    'id': 'M-COM-01',
    'status': 'Deploying',
    'drone': 'CommRelay-1',
    'location': {'lat': 9.9350, 'lon': 78.1150},
    'destination': 'Highlands Ridge',
    'battery': '92%',
    'eta': '18 mins',
    'type': 'communication'
  },
];

final List<Map<String, dynamic>> mockAlerts = [
  {
    'id': 'A-5',
    'drone': 'COMMAND',
    'type': 'announcement',
    'message':
        'New Safe Area established at "Central School". Evacuate if possible.',
    'timestamp': '2:45 PM'
  },
  {
    'id': 'A-4',
    'drone': 'FIELD-TEAM-CHARLIE',
    'type': 'sos',
    'message': 'SOS signal received! Immediate assistance required.',
    'timestamp': '2:35 PM'
  },
  {
    'id': 'A-1',
    'drone': 'Drone-B3',
    'type': 'warning',
    'message': 'High wind speed detected. Rerouting.',
    'timestamp': '2:28 PM'
  },
  {
    'id': 'A-2',
    'drone': 'Drone-A1',
    'type': 'info',
    'message': 'Payload delivered to Relief Camp Alpha.',
    'timestamp': '2:25 PM'
  },
  {
    'id': 'A-3',
    'drone': 'Drone-C2',
    'type': 'critical',
    'message': 'Obstacle detected! Ascending to new altitude.',
    'timestamp': '2:22 PM'
  },
];

final List<Map<String, dynamic>> mockMissionLogs = [
  {
    'id': 'M-Log-101',
    'date': '2025-09-09',
    'status': 'Completed',
    'duration': '28 mins'
  },
  {
    'id': 'M-Log-102',
    'date': '2025-09-09',
    'status': 'Completed',
    'duration': '45 mins'
  },
  {
    'id': 'M-Log-103',
    'date': '2025-09-08',
    'status': 'Failed (Weather)',
    'duration': '15 mins'
  },
];

final List<Map<String, dynamic>> mockDroneAssignments = [
  {'region': 'North Sector', 'drones': ['Drone-A1', 'Drone-A2', 'Drone-A3']},
  {'region': 'East Riverbank', 'drones': ['Drone-B1', 'Drone-B2', 'Drone-B3']},
  {'region': 'West Highlands', 'drones': ['Drone-C1', 'Drone-C2', 'CommRelay-1']},
];

final List<Map<String, dynamic>> mockSafeRoutes = [
  {'lat': 9.9200, 'lon': 78.1120},
  {'lat': 9.9215, 'lon': 78.1135},
  {'lat': 9.9230, 'lon': 78.1150},
  {'lat': 9.9245, 'lon': 78.1165},
  {'lat': 9.9252, 'lon': 78.1180},
  {'lat': 9.9252, 'lon': 78.1198},
];

final List<Map<String, dynamic>> mockSafeAreas = [
  {
    'id': 'SA-1',
    'name': 'Central School',
    'location': {'lat': 9.928, 'lon': 78.125},
    'radius': 50
  }
];

// ---------------- Login Screen ----------------
class LoginScreen extends StatefulWidget {
  final Function(String) onLogin;

  const LoginScreen({super.key, required this.onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String role = 'responder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'RapidWing Ops',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4A90E2),
                  letterSpacing: -1,
                ),
              ),
              const Text(
                'Disaster Relief Coordination',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8D99AE),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F9FC),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _roleButton('responder', 'Field Responder'),
                    _roleButton('admin', 'Admin'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _inputField('Email', false),
              const SizedBox(height: 16),
              _inputField('Password / OTP', true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => widget.onLogin(role),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blue.withOpacity(0.3),
                ),
                child: const Text(
                  'Secure Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleButton(String value, String text) {
    final isActive = role == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => role = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ]
                : null,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  isActive ? const Color(0xFF4A90E2) : const Color(0xFF8D99AE),
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hint, bool obscure) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEAEBEE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEAEBEE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF4A90E2)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
    );
  }
}

// ---------------- Main App with Navigation ----------------
class MainApp extends StatefulWidget {
  final String userRole;
  final VoidCallback onLogout;

  const MainApp({super.key, required this.userRole, required this.onLogout});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String activeScreen = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getActiveScreen(),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(top: BorderSide(color: Color(0xFFEAEBEE))),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: Row(
          children: [
            _navButton('Dashboard', Icons.dashboard_outlined),
            _navButton('New Mission', Icons.add_circle_outline),
            if (widget.userRole == 'admin') ...[
              _navButton('Analytics', Icons.bar_chart_outlined),
              _navButton('Admin', Icons.settings_outlined),
            ],
          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, IconData icon) {
    final isActive = activeScreen == title;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => activeScreen = title),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFF4A90E2) : const Color(0xFF8D99AE),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color:
                    isActive ? const Color(0xFF4A90E2) : const Color(0xFF8D99AE),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getActiveScreen() {
    switch (activeScreen) {
      case 'Dashboard':
        return DashboardScreen(
            userRole: widget.userRole, onLogout: widget.onLogout);
      case 'New Mission':
        return const NewMissionScreen();
      case 'Analytics':
        return const AnalyticsScreen();
      case 'Admin':
        return const AdminScreen();
      default:
        return DashboardScreen(
            userRole: widget.userRole, onLogout: widget.onLogout);
    }
  }
}

// ---------------- Dashboard Screen ----------------
class DashboardScreen extends StatelessWidget {
  final String userRole;
  final VoidCallback onLogout;

  const DashboardScreen(
      {super.key, required this.userRole, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mission Dashboard',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2C3E50),
                ),
              ),
              Row(
                children: [
                  if (userRole == 'responder') const SOSButton(),
                  IconButton(
                    icon:
                        const Icon(Icons.logout, color: Color(0xFFE74C3C), size: 28),
                    tooltip: "Logout",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Confirm Logout"),
                          content: const Text(
                              "Are you sure you want to log out of RapidWing Ops?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE74C3C)),
                              onPressed: () {
                                Navigator.pop(context);
                                onLogout();
                              },
                              child: const Text("Logout",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const MapViewPlaceholder(),
          const SizedBox(height: 24),
          const Text(
            'Push Notifications',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          ...mockAlerts.map((alert) => _buildAlert(context, alert)).toList(),
          const SizedBox(height: 24),
          const Text(
            'Active Missions',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          ...mockActiveMissions
              .map((mission) => _buildMissionCard(context, mission, userRole))
              .toList(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildAlert(BuildContext context, Map<String, dynamic> alert) {
    final String type = (alert['type'] as String?) ?? 'info';
    Color bgColor;
    Color borderColor;

    switch (type) {
      case 'warning':
        bgColor = const Color(0xFFFEF9E7);
        borderColor = const Color(0xFFF39C12);
        break;
      case 'critical':
        bgColor = const Color(0xFFFDEDEC);
        borderColor = const Color(0xFFE74C3C);
        break;
      case 'sos':
        bgColor = const Color(0xFFFADBD8);
        borderColor = const Color(0xFFE74C3C);
        break;
      case 'announcement':
        bgColor = const Color(0xFFEAF7EE);
        borderColor = const Color(0xFF2ECC71);
        break;
      default:
        bgColor = const Color(0xFFE9F2FF);
        borderColor = const Color(0xFF4A90E2);
    }

    final droneLabel = alert['drone'] as String? ?? '';
    final message = alert['message'] as String? ?? '';
    final timestamp = alert['timestamp'] as String? ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: '$droneLabel: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
              children: [
                TextSpan(
                  text: message,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              timestamp,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF8D99AE),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard(
      BuildContext context, Map<String, dynamic> mission, String userRole) {
    final id = mission['id'] as String? ?? '';
    final drone = mission['drone'] as String? ?? '';
    final status = mission['status'] as String? ?? '';
    final destination = mission['destination'] as String? ?? '';
    final eta = mission['eta'] as String? ?? '';
    final battery = mission['battery'] as String? ?? '';
    final type = mission['type'] as String? ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$id ($drone)',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: 'Status: ',
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF8D99AE),
              ),
              children: [
                TextSpan(
                  text: status,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Destination: $destination',
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF8D99AE),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ETA: $eta',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF8D99AE),
                ),
              ),
              Text(
                'Battery: $battery',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF8D99AE),
                ),
              ),
            ],
          ),
          if (userRole == 'admin')
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Reroute mission confirmation dialog + feedback
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Reroute Mission'),
                      content: Text(
                          'Are you sure you want to reroute mission $id operated by $drone?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Mission $id rerouted successfully.'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF39C12)),
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEF9E7),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Reroute Mission',
                  style: TextStyle(
                    color: Color(0xFFF39C12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------- Map View Placeholder ----------------
class MapViewPlaceholder extends StatelessWidget {
  const MapViewPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F2FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEAEBEE)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final containerWidth = constraints.maxWidth;
          final containerHeight = constraints.maxHeight;

          return Stack(
            children: [
              const Center(
                child: Text(
                  'Live GPS Tracking',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ),
              // Safe Route Points
              ...mockSafeRoutes.map((point) {
                final lat = (point['lat'] as num).toDouble();
                final lon = (point['lon'] as num).toDouble();

                // map lat/lon fractional part to container
                final top = (lat % 1) * containerHeight;
                final left = (lon % 1) * containerWidth;

                return Positioned(
                  top: top,
                  left: left,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2ECC71),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }).toList(),

              // Safe Areas
              ...mockSafeAreas.map((area) {
                final location = area['location'] as Map<String, dynamic>;
                final lat = (location['lat'] as num).toDouble();
                final lon = (location['lon'] as num).toDouble();
                final top = (lat % 1) * containerHeight;
                final left = (lon % 1) * containerWidth;
                final name = area['name'] as String? ?? '';

                return Positioned(
                  top: top,
                  left: left,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0x332ECC71),
                      border: Border.all(color: const Color(0xFF2ECC71), width: 2),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF2ECC71),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),

              // Drone Markers
              ...mockActiveMissions.map((mission) {
                final location = mission['location'] as Map<String, dynamic>;
                final lat = (location['lat'] as num).toDouble();
                final lon = (location['lon'] as num).toDouble();
                final top = (lat % 1) * containerHeight;
                final left = (lon % 1) * containerWidth;
                final type = mission['type'] as String? ?? '';
                final droneLabel = mission['drone'] as String? ?? '';
                final battery = mission['battery'] as String? ?? '';

                return Positioned(
                  top: top,
                  left: left,
                  child: Column(
                    children: [
                      Text(
                        type == 'communication' ? '📡' : '🚁',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '$droneLabel ($battery)',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),

              // Obstacle Marker
              Positioned(
                top: 0.4 * containerHeight,
                left: 0.6 * containerWidth,
                child: Column(
                  children: [
                    const Text('⚠️', style: TextStyle(fontSize: 24)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Obstacle',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE74C3C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ---------------- SOS Button ----------------
class SOSButton extends StatelessWidget {
  const SOSButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Send SOS action: dialog + snackbar
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('SOS Alert'),
            content: const Text(
                'SOS Signal Sent! Command has been notified of your location and status. Acknowledgment pending.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SOS acknowledged locally.')),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFE74C3C),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE74C3C).withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🚨', style: TextStyle(fontSize: 20)),
            Text(
              'SOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- New Mission Screen ----------------
class NewMissionScreen extends StatefulWidget {
  const NewMissionScreen({super.key});

  @override
  State<NewMissionScreen> createState() => _NewMissionScreenState();
}

class _NewMissionScreenState extends State<NewMissionScreen> {
  bool isAssigning = false;
  bool isAssigned = false;

  void handleDispatch() {
    setState(() {
      isAssigning = true;
      isAssigned = false;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isAssigning = false;
        isAssigned = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Drone auto-assigned successfully.')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            'New Delivery Request',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 24),
          if (isAssigned)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Drone Assigned!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2ECC71),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Drone-D4 (89% battery) has been assigned. It is the closest available unit with required payload capacity. ETA to pickup: 6 mins.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8D99AE),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => setState(() => isAssigned = false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.blue.withOpacity(0.3),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Create Another Request',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Drop-off Location (Coordinates)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputField('e.g., 9.9252, 78.1198'),
                  const SizedBox(height: 20),
                  const Text(
                    'Payload Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputField('e.g., Medical Kits, Communication Relay'),
                  const SizedBox(height: 20),
                  const Text(
                    'Payload Weight (kg)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputField('Max 5kg', isNumber: true),
                  const SizedBox(height: 20),
                  const Text(
                    'Urgency',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Marked High urgency')),
                            );
                          },
                          child: Container(
                            height: 44,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE74C3C),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'High',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Marked Medium urgency')),
                            );
                          },
                          child: Container(
                            height: 44,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF39C12),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Medium',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Marked Low urgency')),
                            );
                          },
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2ECC71),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Low',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isAssigning ? null : handleDispatch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.blue.withOpacity(0.3),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        isAssigning ? 'Auto-Assigning Drone...' : 'Dispatch Drone',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _inputField(String hint, {bool isNumber = false}) {
    return TextField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF7F9FC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEAEBEE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEAEBEE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF4A90E2)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
    );
  }
}

// ---------------- Analytics Screen ----------------
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Analytics & Logs',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Performance Metrics',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '92%',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Success Rate',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '35 min',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Avg. Delivery',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '48',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Missions Today',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Mission Logs',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          ...mockMissionLogs.map((log) {
            final String id = log['id'] as String? ?? '';
            final String status = log['status'] as String? ?? '';
            final String date = log['date'] as String? ?? '';
            final String duration = log['duration'] as String? ?? '';

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        id,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: status == 'Completed' ? const Color(0xFFEAF7EE) : const Color(0xFFFDEDEC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: status == 'Completed' ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: $date',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8D99AE),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Duration: $duration',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8D99AE),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

// ---------------- Admin Screen ----------------
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isMobileNetworkActive = true;
  bool isSatelliteNetworkActive = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Admin Control',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Safe Area Management',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Area Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),
                _inputField('e.g., City Hall Shelter'),
                const SizedBox(height: 16),
                const Text(
                  'Coordinates',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),
                _inputField('e.g., 9.9195, 78.1100'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('New Safe Area broadcasted to all responders')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ECC71),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Broadcast New Safe Area',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Communication Network',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          // Mobile Network Card
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mobile Network Relay',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: isMobileNetworkActive ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isMobileNetworkActive ? 'Network Active' : 'Network Disabled',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isMobileNetworkActive ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C),
                          ),
                        ),
                      ],
                    ),  
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage the temporary mobile communication hub.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF8D99AE),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() => isMobileNetworkActive = !isMobileNetworkActive);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isMobileNetworkActive ? 'Mobile relay enabled' : 'Mobile relay disabled')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isMobileNetworkActive ? const Color(0xFFF39C12) : const Color(0xFF50E3C2),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      isMobileNetworkActive ? 'Disable Mobile Relay' : 'Enable Mobile Relay',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Satellite Network Card
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Satellite Uplink',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: isSatelliteNetworkActive ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isSatelliteNetworkActive ? 'Uplink Active' : 'Uplink Disabled',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isSatelliteNetworkActive ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage the temporary satellite communication uplink.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF8D99AE),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() => isSatelliteNetworkActive = !isSatelliteNetworkActive);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isSatelliteNetworkActive ? 'Satellite uplink enabled' : 'Satellite uplink disabled')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isSatelliteNetworkActive ? const Color(0xFFF39C12) : const Color(0xFF50E3C2),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      isSatelliteNetworkActive ? 'Disable Satellite Uplink' : 'Enable Satellite Uplink',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Drone Assignment',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 16),
          ...mockDroneAssignments.map((assignment) {
            final region = assignment['region'] as String? ?? '';
            final drones = (assignment['drones'] as List).cast<String>();
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    region,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Assigned Drones: ${drones.join(', ')}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8D99AE),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Re-assign Drones'),
                          content: Text('Reassign drones for $region? This will automatically choose available drones.'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Drones re-assigned for $region')),
                                );
                              },
                              child: const Text('Confirm'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE9F2FF),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Re-assign Drones',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4A90E2),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _inputField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF7F9FC),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEAEBEE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEAEBEE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF4A90E2)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
    );
  }
}
