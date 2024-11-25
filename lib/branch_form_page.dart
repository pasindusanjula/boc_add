import 'package:flutter/material.dart';

class BranchFormPage extends StatefulWidget {
  final Map<String, dynamic>? branch; // Optional parameter for editing

  BranchFormPage({this.branch}); // Constructor with an optional branch parameter

  @override
  _BranchFormPageState createState() => _BranchFormPageState();
}

class _BranchFormPageState extends State<BranchFormPage> {
  late TextEditingController _branchAttachedController;
  late TextEditingController _branchCodeController;
  late TextEditingController _branchNameController;
  late TextEditingController _branchProvinceController;
  late TextEditingController _branchLanIpController;
  late TextEditingController _branchPrimaryWanController;
  late TextEditingController _branchPrimaryCctController;
  late TextEditingController _branchPrimaryBwController;
  late TextEditingController _branchPrimaryServiceController;
  late TextEditingController _branchSecondryWanController;
  late TextEditingController _branchSecondryCctController;
  late TextEditingController _branchSecondryBwController;
  late TextEditingController _branchSecondryServiceController;


  // Add controllers for other fields as needed

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with existing branch data if available
    if (widget.branch != null) {
      _branchAttachedController = TextEditingController(text: widget.branch!['attached']);
      _branchCodeController = TextEditingController(text: widget.branch!['branch_code']);
      _branchNameController = TextEditingController(text: widget.branch!['branch_name']);
      _branchProvinceController = TextEditingController(text: widget.branch!['province']);
      _branchLanIpController = TextEditingController(text: widget.branch!['branch_lan_ip']);
      _branchPrimaryWanController = TextEditingController(text: widget.branch!['primary_wan']);
      _branchPrimaryCctController = TextEditingController(text: widget.branch!['primary_cct']);
      _branchPrimaryBwController = TextEditingController(text: widget.branch!['primary_bw']);
      _branchPrimaryServiceController = TextEditingController(text: widget.branch!['primary_service']);
      _branchSecondryWanController = TextEditingController(text: widget.branch!['secondary_wan']);
      _branchSecondryCctController = TextEditingController(text: widget.branch!['secondary_cct']);
      _branchSecondryBwController = TextEditingController(text: widget.branch!['secondary_bw']);
      _branchSecondryServiceController = TextEditingController(text: widget.branch!['secondary_service']);



      // Initialize other controllers with respective values
    } else {
      _branchAttachedController = TextEditingController();
      _branchCodeController = TextEditingController();
      _branchNameController = TextEditingController();
      _branchProvinceController = TextEditingController();
      _branchLanIpController = TextEditingController();
      _branchPrimaryWanController = TextEditingController();
      _branchPrimaryCctController = TextEditingController();
      _branchPrimaryBwController = TextEditingController();
      _branchPrimaryServiceController = TextEditingController();
      _branchSecondryWanController = TextEditingController();
      _branchSecondryCctController = TextEditingController();
      _branchSecondryBwController = TextEditingController();
      _branchSecondryServiceController = TextEditingController();

      // Initialize empty controllers if creating a new branch
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add/Edit Branch',
          style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _branchAttachedController,
                decoration: InputDecoration(labelText: 'Attached'),
              ),
              TextFormField(
                controller: _branchCodeController,
                decoration: InputDecoration(labelText: 'Branch Code'),
              ),
              TextFormField(
                controller: _branchNameController,
                decoration: InputDecoration(labelText: 'Branch Name'),
              ),
              TextFormField(
                controller: _branchProvinceController,
                decoration: InputDecoration(labelText: 'Province'),
              ),
              TextFormField(
                controller: _branchLanIpController,
                decoration: InputDecoration(labelText: 'Branch LAN IP'),
              ),
              TextFormField(
                controller: _branchPrimaryWanController,
                decoration: InputDecoration(labelText: 'Primary WAN'),
              ),
              TextFormField(
                controller: _branchPrimaryCctController,
                decoration: InputDecoration(labelText: 'Primary CCT'),
              ),
              TextFormField(
                controller: _branchPrimaryBwController,
                decoration: InputDecoration(labelText: 'Primary BW'),
              ),
              TextFormField(
                controller: _branchPrimaryServiceController,
                decoration: InputDecoration(labelText: 'Primary Service'),
              ),
              TextFormField(
                controller: _branchSecondryWanController,
                decoration: InputDecoration(labelText: 'Secondry WAN'),
              ),
              TextFormField(
                controller: _branchSecondryCctController,
                decoration: InputDecoration(labelText: 'Secondry CCT'),
              ),
              TextFormField(
                controller: _branchSecondryBwController,
                decoration: InputDecoration(labelText: 'Secondry BW'),
              ),
              TextFormField(
                controller: _branchSecondryServiceController,
                decoration: InputDecoration(labelText: 'Secondry Service'),
              ),
              // Add more form fields for other branch data
              ElevatedButton(
                onPressed: () {
                  final updatedBranch = {
                    'attached': _branchAttachedController.text,
                    'branch_code': _branchCodeController.text,
                    'branch_name': _branchNameController.text,
                    'province': _branchProvinceController.text,
                    'branch_lan_ip': _branchLanIpController.text,
                    'primary_wan': _branchPrimaryWanController.text,
                    'primary_cct': _branchPrimaryCctController.text,
                    'primary_bw': _branchPrimaryBwController.text,
                    'primary_service': _branchPrimaryServiceController.text,
                    'secondary_wan': _branchSecondryWanController.text,
                    'secondary_cct': _branchSecondryCctController.text,
                    'secondary_bw': _branchSecondryBwController.text,
                    'secondary_service': _branchSecondryServiceController.text,
                    // Add other fields here
                  };

                  // Pass the updated branch data back to the home page
                  Navigator.pop(context, updatedBranch);
                },
                child: Text('Save')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
