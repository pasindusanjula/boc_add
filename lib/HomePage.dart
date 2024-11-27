import 'package:flutter/material.dart';
import 'branch.dart';
import 'branch_form_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List to store branch data
  List<Map<String, dynamic>> branches = dummyBranchesData; // Dummy data
  List<Map<String, dynamic>> filteredBranches = []; // List to store filtered branches
  TextEditingController _searchController = TextEditingController(); // Controller for search input

  @override
  void initState() {
    super.initState();
    filteredBranches = branches; // Initially show all branches

    // Add listener to search controller to filter branches as user types
    _searchController.addListener(() {
      _filterBranches(_searchController.text);
    });
  }

  // Function to filter branches based on search query
  // Function to filter branches based on search query
  void _filterBranches(String query) {
    final filtered = branches.where((branch) {
      final branchCode = branch['branch_code'].toLowerCase();
      final branchName = branch['branch_name'].toLowerCase();
      final primaryCCT = branch['primary_cct'].toString().toLowerCase(); // Add Primary CCT
      final secondaryCCT = branch['secondary_cct'].toString().toLowerCase(); // Add Secondary CCT

      // Check if the query matches any of the fields
      return branchCode.contains(query.toLowerCase()) ||
          branchName.contains(query.toLowerCase()) ||
          primaryCCT.contains(query.toLowerCase()) ||
          secondaryCCT.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredBranches = filtered; // Update filtered branches list
    });
  }


  Future<List<Map<String, dynamic>>> _loadBranches() async {
    // Simulate loading branch data from an API or local storage
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    return branches; // Return dummy data
  }

  void _openForm() async {
    final newBranch = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BranchFormPage()),
    );

    // Add new branch to the list if the form returns valid data
    if (newBranch != null) {
      setState(() {
        branches.add(newBranch);
        filteredBranches = branches; // Reset filtered branches to include the new branch
      });
    }
  }
  void _editBranch(Map<String, dynamic> branch) async {
    // Navigate to the form page with the branch data
    final updatedBranch = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BranchFormPage(branch: branch), // Pass the branch to edit
      ),
    );

    // Update the branch in the list if the form returns updated data
    if (updatedBranch != null) {
      setState(() {
        final index = branches.indexOf(branch);
        if (index != -1) {
          branches[index] = updatedBranch; // Update the specific branch
          filteredBranches = branches; // Reset filtered list to reflect changes
        }
      });
    }
  }


  void _deleteBranch(Map<String, dynamic> branchToDelete) {
    setState(() {
      branches.removeWhere((branch) => branch == branchToDelete);
      filteredBranches = branches; // Update filtered branches after deletion
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOC',
          style: TextStyle(fontWeight: FontWeight.bold),),

        backgroundColor: Colors.amber.shade400,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0), // Height of search bar
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Branch Code or Name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _loadBranches(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Attached')),
                  DataColumn(label: Text('Branch Code')),
                  DataColumn(label: Text('Branch Name')),
                  DataColumn(label: Text('Province')),
                  DataColumn(label: Text('Branch LAN IP')),
                  DataColumn(label: Text('Primary WAN')),
                  DataColumn(label: Text('Primary CCT')),
                  DataColumn(label: Text('Primary BW')),
                  DataColumn(label: Text('Primary Service')),
                  DataColumn(label: Text('Secondary WAN')),
                  DataColumn(label: Text('Secondary CCT')),
                  DataColumn(label: Text('Secondary BW')),
                  DataColumn(label: Text('Secondary Service')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: filteredBranches.map((branch) {
                  return DataRow(cells: [
                    DataCell(Text(branch['attached'].toString())),
                    DataCell(Text(branch['branch_code'].toString())),
                    DataCell(Text(branch['branch_name'].toString())),
                    DataCell(Text(branch['province'].toString())),
                    DataCell(Text(branch['branch_lan_ip'].toString())),
                    DataCell(Text(branch['primary_wan'].toString())),
                    DataCell(Text(branch['primary_cct'].toString())),
                    DataCell(Text(branch['primary_bw'].toString())),
                    DataCell(Text(branch['primary_service'].toString())),
                    DataCell(Text(branch['secondary_wan'].toString())),
                    DataCell(Text(branch['secondary_cct'].toString())),
                    DataCell(Text(branch['secondary_bw'].toString())),
                    DataCell(Text(branch['secondary_service'].toString())),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editBranch(branch),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteBranch(branch),
                          ),
                        ],
                      ),
                    ),

                  ]);
                }).toList(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openForm,
        child: Icon(Icons.add),
      ),
    );
  }
}
