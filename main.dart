import 'package:flutter/material.dart';

// Global list to store reported incidents for My Tasks screen
List<IncidentReport> reportedIncidents = [];

void main() {
  runApp(const MyApp());
}

// Incident Report data model
class IncidentReport {
  final String id;
  final DateTime timestamp;
  final String scheme;
  final String component;
  final String assetType;
  final String componentType;
  final String? componentNo;
  final String location;
  final String description;
  final String status;

  IncidentReport({
    required this.id,
    required this.timestamp,
    required this.scheme,
    required this.component,
    required this.assetType,
    required this.componentType,
    this.componentNo,
    required this.location,
    required this.description,
    this.status = 'Pending',
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHE App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 47, 17, 168),
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Accept any random values for login
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Login Successful')));

    // Navigate to Dashboard after successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo/Icon
                  Icon(
                    Icons.phone_android,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),

                  // Welcome Text
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login to continue',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Mobile Number Field
                  TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter your mobile number',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigate to forgot password screen
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Button
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Login', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 24),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
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

// Sign Up Screen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    // Accept any random values for sign up
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Sign Up Successful')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo/Icon
                  Icon(
                    Icons.person_add,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),

                  // Create Account Text
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign up to get started',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Mobile Number Field
                  TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter your mobile number',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length < 10) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Login'),
                      ),
                    ],
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

// Report Breakdown Screen
class ReportBreakdownScreen extends StatefulWidget {
  const ReportBreakdownScreen({super.key});

  @override
  State<ReportBreakdownScreen> createState() => _ReportBreakdownScreenState();
}

class _ReportBreakdownScreenState extends State<ReportBreakdownScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();

  String? _selectedScheme;
  String? _selectedComponent;
  String? _selectedAssetType;
  String? _selectedComponentType;
  String? _selectedComponentNo;
  // String? _componentQuantity;
  List<String> mediaFiles = [];
  String? _gpsLocation;
  bool _offlineModeEnabled = false;

  // Component units mapping
  final List<String> schemes = ['Dispur WSS', 'Gu & AEC WSS', 'Sarusajai WSS'];
  final List<String> components = [
    'Intake (Barge)',
    'WTPs',
    'Distribution (Boosting Stations & Pipelines)',
  ];
  final List<String> assetTypes = [
    'Machinery Components',
    'Mechanical Components',
    'Electrical Components',
    'Consumables & Maintenance Materials',
  ];
  final Map<String, List<String>> componentTypes = {
    'Machinery Components': [
      'Pumpset',
      'Vacuum Pumpset',
      'Back Washer Pumpset',
      'DG Set',
      'Transformer',
      'Air Blower',
      'OHR Pumpset',
      'Clarifier Scraper Pumpset',
    ],
    'Mechanical Components': [
      'Barge Mechanical Structure',
      'Screening Filter',
      'Flexible Hose Pipe',
      'Steel Ropes',
      'Fullway Valve',
      'Sluice Valve',
      'NRVs',
      'Scraper Systems',
      'Spindle',
      'Air Valve',
      'GI Nipple',
      'GI Union Socket',
      'Pipes',
    ],
    'Electrical Components': [
      'MCCB',
      'MCB',
      'Capacitor',
      'Fuse Wire',
      'Barrel',
      'Switch',
      'LED Bulb',
      'Tube Light',
      'Bulb Holder',
      'Electrical Tape',
    ],
    'Consumables & Maintenance Materials': [
      'Gland Packing',
      'Nut & Bolt',
      'Rubber Gasket',
      'Grease',
      'Cotton Waste',
      'Handwash',
      'Teflon Tape',
      'Hacksaw Blade',
      'UPVC Solvent',
      'M-Seal',
      'Coconut Rope',
      'Filter Sand',
    ],
  };
  // Method to generate component numbers based on quantity
  final Map<String, List<String>> componentSpecs = {
    'Pumpset': ['125 HP', '100 HP', '80 HP', '75 HP'],
    'Vacuum Pumpset': ['10 HP', '5 HP'],
    'Back Washer Pumpset': ['30 Hp'],
    'DG Set': ['325 KVA'],
    'Transformer': ['250 KVA', '500 KVA'],
    'Air Blower': ['20 HP'],
    'OHR Pumpset': ['15 HP'],
    'Clarifier Scraper Pumpset': ['5 HP'],
    'Barge Mechanical Structure': ['Floating intake system'],
    'Screening Filter': [],
    'Flexible Hose Pipe': ['150 mm dia'],
    'Steel Ropes': [],
    'Fullway Valve': ['15 mm', '20 mm'],
    'Sluice Valve': ['150 mm dia'],
    'NRVs': [],
    'Scraper Systems': [],
    'Spindle': ['Filter valve spindle'],
    'Air Valve': ['—'],
    'GI Nipple': ['15 mm', '20 mm'],
    'GI Union Socket': ['—'],
    'Pipes': ['250 mm', '350 mm', '450 mm'],
    'MCCB': ['Panel protection device'],
    'MCB': ['Circuit breaker'],
    'Capacitor': ['Power factor correction'],
    'Fuse Wire': ['HT fuse (40 Amp)'],
    'Barrel': ['HT Barrel'],
    'Switch': ['40 Amp'],
    'LED Bulb': ['Lighting'],
    'Tube Light': ['Lighting'],
    'Bulb Holder': ['Lighting fixture'],
    'Electrical Tape': ['Black tape'],
    'Gland Packing': ['12 mm', '10 mm'],
    'Nut & Bolt': ['Various sizes'],
    'Rubber Gasket': ['250 gm'],
    'Grease': ['Lubricant'],
    'Cotton Waste': ['Cleaning material'],
    'Handwash': ['Hygiene material'],
    'Teflon Tape': ['Sealant'],
    'Hacksaw Blade': ['Cutting tool'],
    'UPVC Solvent': ['Pipe adhesive'],
    'M-Seal': ['Leak sealant'],
    'Coconut Rope': ['Mechanical support'],
    'Filter Sand': ['Rapid sand filter media'],
  };

  List<String> _getComponentNumbers() {
    return List.generate(10, (index) => '${index + 1}');
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _showMediaOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                _addMedia('photo_${DateTime.now().millisecondsSinceEpoch}.jpg');
              },
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Record Video'),
              onTap: () {
                Navigator.pop(context);
                _addMedia('video_${DateTime.now().millisecondsSinceEpoch}.mp4');
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                _addMedia('image_${DateTime.now().millisecondsSinceEpoch}.jpg');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addMedia(String fileName) {
    setState(() {
      mediaFiles.add(fileName);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$fileName added')));
  }

  void _captureGPS() {
    // Simulating GPS capture
    setState(() {
      _gpsLocation =
          '${(26.1445 + (DateTime.now().millisecond % 100) / 10000).toStringAsFixed(4)}, '
          '${(91.7362 + (DateTime.now().millisecond % 100) / 10000).toStringAsFixed(4)}';
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('GPS Location: $_gpsLocation')));
  }

  void _saveDraft() {
    if (_selectedScheme == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a scheme')));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Breakdown saved as draft (Offline mode enabled)'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _submitBreakdown() {
    // Build list of missing fields
    List<String> missingFields = [];

    if (_selectedScheme == null) {
      missingFields.add('Scheme');
    }
    if (_selectedComponent == null) {
      missingFields.add('Component');
    }
    if (_selectedAssetType == null) {
      missingFields.add('Asset Type');
    }
    if (_selectedComponentType == null) {
      missingFields.add('Component Type');
    }
    if (_locationController.text.isEmpty) {
      missingFields.add('Location');
    }
    if (_descriptionController.text.isEmpty) {
      missingFields.add('Description');
    }

    if (missingFields.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select: ${missingFields.join(", ")}'),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    _showSubmissionDialog();
  }

  void _showSubmissionDialog() {
    // Generate incident ID and timestamp
    final now = DateTime.now();
    final incidentId =
        'INC-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Submission'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Breakdown Report Summary:'),
            const SizedBox(height: 12),
            _buildSummaryRow('Scheme:', _selectedScheme ?? ''),
            _buildSummaryRow('Component:', _selectedComponent ?? ''),
            _buildSummaryRow('Asset Type:', _selectedAssetType ?? ''),
            _buildSummaryRow('Component Type:', _selectedComponentType ?? ''),
            _buildSummaryRow('Component Quantity:', _componentQuantity ?? ''),
            _buildSummaryRow('Component No.:', _selectedComponentNo ?? ''),
            _buildSummaryRow('Location:', _locationController.text),
            _buildSummaryRow('Issue:', _descriptionController.text),
            _buildSummaryRow('GPS:', _gpsLocation ?? 'Not captured'),
            _buildSummaryRow('Evidence:', '${mediaFiles.length} file(s)'),
            const SizedBox(height: 16),
            const Text(
              'Approval Status: Auto-approval will be triggered after 2 hours if no response.',
              style: TextStyle(fontSize: 12, color: Colors.orange),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Save incident to global list
              final incident = IncidentReport(
                id: incidentId,
                timestamp: now,
                scheme: _selectedScheme ?? '',
                component: _selectedComponent ?? '',
                assetType: _selectedAssetType ?? '',
                componentType: _selectedComponentType ?? '',
                componentNo: _selectedComponentNo,
                location: _locationController.text,
                description: _descriptionController.text,
                status: 'Pending',
              );
              reportedIncidents.add(incident);

              Navigator.pop(context);
              _showSuccessPopup(incidentId, now);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Submit Report'),
          ),
        ],
      ),
    );
  }

  void _showSuccessPopup(String incidentId, DateTime timestamp) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            const SizedBox(width: 8),
            const Text('Reported Successfully!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your breakdown report has been submitted successfully.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Incident ID:',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    incidentId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Timestamp:',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'You can view this incident in "My Tasks" on the dashboard.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to dashboard
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: Colors.blue[900],
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Breakdown'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Asset Type Selection
              Text(
                'Schemes / Production Centres *',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedScheme,
                  hint: const Text('Select scheme'),
                  isExpanded: true,
                  items: schemes
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedScheme = value;
                      _selectedComponent = null;
                      _selectedAssetType = null;
                      _selectedComponentType = null;
                      _selectedComponentNo = null;
                      _componentQuantity = null;
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a scheme';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Component Selection
              if (_selectedScheme != null) ...[
                Text(
                  'Component *',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedComponent,
                    hint: const Text('Select component'),
                    isExpanded: true,
                    items: components
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedComponent = value;
                        _selectedAssetType = null;
                        _selectedComponentType = null;
                        _selectedComponentNo = null;
                        _componentQuantity = null;
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a component';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Asset Type Selection
              if (_selectedComponent != null) ...[
                Text(
                  'Asset Type *',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedAssetType,
                    hint: const Text('Select asset type'),
                    isExpanded: true,
                    items: assetTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedAssetType = value;
                        _selectedComponentType = null;
                        _selectedComponentNo = null;
                        _componentQuantity = null;
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select an asset type';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Component Type
              if (_selectedAssetType != null) ...[
                Text(
                  'Component Type *',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedComponentType,
                    hint: const Text('Select component type'),
                    isExpanded: true,
                    items: _selectedAssetType != null
                        ? componentTypes[_selectedAssetType]!
                              .map(
                                (type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ),
                              )
                              .toList()
                        : [],
                    onChanged: (value) {
                      setState(() {
                        _selectedComponentType = value;
                        _selectedComponentNo = null;
                        _componentQuantity = null;
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a component type';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Component Quantity
              // if (_selectedComponentType != null) ...[
              //   Text(
              //     'Component Quantity *',
              //     style: Theme.of(
              //       context,
              //     ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              //   ),
              //   const SizedBox(height: 8),
              //   Container(
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.grey[300]!),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     child: DropdownButtonFormField<String>(
              //       value: _componentQuantity,
              //       hint: const Text('Select quantity'),
              //       isExpanded: true,
              //       items: _getComponentNumbers()
              //           .map(
              //             (num) =>
              //                 DropdownMenuItem(value: num, child: Text(num)),
              //           )
              //           .toList(),
              //       onChanged: (value) {
              //         setState(() {
              //           _componentQuantity = value;
              //           _selectedComponentNo = null;
              //         });
              //       },
              //       decoration: const InputDecoration(
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.symmetric(
              //           horizontal: 12,
              //           vertical: 4,
              //         ),
              //       ),
              //       validator: (value) {
              //         if (value == null) {
              //           return 'Please select quantity';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              //   const SizedBox(height: 20),
              // ],

              // Component No
              if (_selectedComponentType != null) ...[
                Text(
                  'Component No.',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedComponentNo,
                    hint: const Text('Select component no/spec'),
                    isExpanded: true,
                    items: componentSpecs[_selectedComponentType]!
                        .map(
                          (spec) =>
                              DropdownMenuItem(value: spec, child: Text(spec)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedComponentNo = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Selection Summary Box
              // if (_selectedScheme != null && _selectedComponent != null && _selectedAssetType != null && _selectedComponentType != null)
              //   Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.all(16),
              //     decoration: BoxDecoration(
              //       color: Colors.blue[50],
              //       border: Border.all(color: Colors.blue[300]!, width: 2),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Icon(Icons.info, color: Colors.blue[700], size: 24),
              //             const SizedBox(width: 12),
              //             Text(
              //               'Selected Options:',
              //               style: Theme.of(context).textTheme.titleSmall
              //                   ?.copyWith(
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.blue[900],
              //                   ),
              //             ),
              //           ],
              //         ),
              //         const SizedBox(height: 16),
              //         _buildSummaryRow('Scheme:', _selectedScheme!),
              //         _buildSummaryRow('Component:', _selectedComponent!),
              //         _buildSummaryRow('Asset Type:', _selectedAssetType!),
              //         _buildSummaryRow('Component Type:', _selectedComponentType!),
              //         if (_selectedComponentNo != null)
              //           _buildSummaryRow('Component No.:', _selectedComponentNo!),
              //       ],
              //     ),
              //   ),
              const SizedBox(height: 20),

              // Location Field
              Text(
                'Issue Location / Description *',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Enter location details',
                  prefixIcon: const Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location details';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Problem Description
              Text(
                'Problem Description *',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Describe the issue in detail...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the problem';
                  }
                  if (value.length < 5) {
                    return 'Description must be at least 5 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // GPS Location
              Text(
                'GPS Location',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.my_location, color: Colors.purple),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Location',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            _gpsLocation ?? 'Not captured',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _captureGPS,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Capture',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Media Upload
              Text(
                'Evidence (Photos/Videos)',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _showMediaOptions,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.add_photo_alternate,
                        size: 32,
                        color: Colors.purple,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap to add photos/videos',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Media List
              if (mediaFiles.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attached Evidence (${mediaFiles.length})',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: mediaFiles
                            .asMap()
                            .entries
                            .map(
                              (entry) => Chip(
                                label: Text(
                                  entry.value,
                                  style: const TextStyle(fontSize: 11),
                                ),
                                onDeleted: () {
                                  setState(() {
                                    mediaFiles.removeAt(entry.key);
                                  });
                                },
                                deleteIcon: const Icon(Icons.close, size: 16),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),

              // Offline Mode Toggle
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  border: Border.all(color: Colors.orange[200]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.cloud_off, color: Colors.orange[700]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Offline Mode',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Save as draft for later submission',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _offlineModeEnabled,
                      onChanged: (value) {
                        setState(() {
                          _offlineModeEnabled = value;
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _saveDraft,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.purple),
                      ),
                      child: const Text(
                        'Save Draft',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _submitBreakdown,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Submit Report',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Info Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue[200]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Approval Timeline',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Report will be reviewed within 2 hours\n'
                      '• Auto-approval if no response within 2 hours\n'
                      '• Contractor will be assigned after approval\n'
                      '• You can track progress in Dashboard',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// My Tasks Screen
class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: reportedIncidents.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Tasks Yet',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your reported incidents will appear here',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reportedIncidents.length,
              itemBuilder: (context, index) {
                final incident = reportedIncidents[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              incident.id,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                incident.status,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          incident.componentType,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          incident.scheme,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                incident.location,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${incident.timestamp.day}/${incident.timestamp.month}/${incident.timestamp.year}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Dashboard Screen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Notifications')));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Header with Avatar
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.purple[300],
                  child: const Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                    Text(
                      'Mr. Joe Doe',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Report Breakdown Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportBreakdownScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.assessment, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'REPORT BREAKDOWN',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Navigation Section
            Text(
              'Quick Navigation',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildNavCard(
                  context,
                  Icons.assignment,
                  'My Tasks',
                  'Your Work Orders',
                  Colors.purple,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyTasksScreen(),
                    ),
                  ),
                ),
                _buildNavCard(
                  context,
                  Icons.share_outlined,
                  'Schemes',
                  'Ongoing Projects',
                  Colors.purple,
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Schemes clicked')),
                  ),
                ),
                _buildNavCard(
                  context,
                  Icons.engineering,
                  'Contractor',
                  'Details',
                  Colors.purple,
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contractor clicked')),
                  ),
                ),
                _buildNavCard(
                  context,
                  Icons.description,
                  'Reports',
                  'Completion Certificates',
                  Colors.purple,
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reports clicked')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Navigation Items List
            _buildListItem(
              context,
              Icons.opacity,
              'Water Treatment Plants',
              Colors.purple,
            ),
            const SizedBox(height: 8),
            _buildListItem(
              context,
              Icons.local_gas_station,
              'Boosting Stations',
              Colors.purple,
            ),
            const SizedBox(height: 8),
            _buildListItem(
              context,
              Icons.settings_input_component,
              'Pipe Lines',
              Colors.purple,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyTasksScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Navigate to ${const ['Home', 'Tasks', 'Alerts', 'Profile'][index]}',
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildNavCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$title clicked')));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F8),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }
}
