class Branch {
  String attached;
  int branchCode;
  String branchName;
  String province;
  String branchLanIp;
  String primaryWan;
  String primaryCct;
  String primaryBw;
  String primaryService;
  String secondaryWan;
  String secondaryCct;
  String secondaryBw;
  String secondaryService;

  Branch({
    required this.attached,
    required this.branchCode,
    required this.branchName,
    required this.province,
    required this.branchLanIp,
    required this.primaryWan,
    required this.primaryCct,
    required this.primaryBw,
    required this.primaryService,
    required this.secondaryWan,
    required this.secondaryCct,
    required this.secondaryBw,
    required this.secondaryService,
  });
}
final List<Map<String, dynamic>> dummyBranchesData = [
  {
    'attached': 'no',
    'branch_code': 'MB001',
    'branch_name': 'Main Branch',
    'province': 'Western',
    'branch_lan_ip': '192.168.1.1',
    'primary_wan': 'WAN-1',
    'primary_cct': 'CCT-100',
    'primary_bw': '100Mbps',
    'primary_service': 'Fiber',
    'secondary_wan': 'WAN-2',
    'secondary_cct': 'CCT-200',
    'secondary_bw': '50Mbps',
    'secondary_service': 'DSL',
  },
  {
    'attached': 'Yes',
    'branch_code': 'MB001',
    'branch_name': 'Main Branch',
    'province': 'Western',
    'branch_lan_ip': '192.168.1.1',
    'primary_wan': 'WAN-1',
    'primary_cct': 'CCT-120',
    'primary_bw': '100Mbps',
    'primary_service': 'Fiber',
    'secondary_wan': 'WAN-2',
    'secondary_cct': 'CCT-200',
    'secondary_bw': '50Mbps',
    'secondary_service': 'DSL',
  },
  {
    'attached': 'Yes',
    'branch_code': 'MB001',
    'branch_name': 'Mathugama',
    'province': 'Western',
    'branch_lan_ip': '192.168.1.1',
    'primary_wan': 'WAN-1',
    'primary_cct': 'CCT-100',
    'primary_bw': '100Mbps',
    'primary_service': 'Fiber',
    'secondary_wan': 'WAN-2',
    'secondary_cct': 'CCT-200',
    'secondary_bw': '50Mbps',
    'secondary_service': 'DSL',
  },

  // Add more branches as needed
];

