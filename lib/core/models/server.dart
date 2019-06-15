class Server {
  int id;
  int credentialId;
  String name;
  String size;
  String region;
  String phpVersion;
  String ipAddress;
  int sshPort;
  String privateIpAddress;
  String blackfireStatus;
  String papertrailStatus;
  bool revoked;
  String createdAt;
  bool isReady;
  List<Tags> tags;
  List<String> network;

  Server(
      {this.id,
      this.credentialId,
      this.name,
      this.size,
      this.region,
      this.phpVersion,
      this.ipAddress,
      this.sshPort,
      this.privateIpAddress,
      this.blackfireStatus,
      this.papertrailStatus,
      this.revoked,
      this.createdAt,
      this.isReady,
      this.tags,
      this.network});

  Server.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    credentialId = json['credential_id'];
    name = json['name'];
    size = json['size'];
    region = json['region'];
    phpVersion = json['php_version'];
    ipAddress = json['ip_address'];
    sshPort = json['ssh_port'];
    privateIpAddress = json['private_ip_address'];
    blackfireStatus = json['blackfire_status'];
    papertrailStatus = json['papertrail_status'];
    revoked = json['revoked'];
    createdAt = json['created_at'];
    isReady = json['is_ready'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    network = json['network'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credential_id'] = this.credentialId;
    data['name'] = this.name;
    data['size'] = this.size;
    data['region'] = this.region;
    data['php_version'] = this.phpVersion;
    data['ip_address'] = this.ipAddress;
    data['ssh_port'] = this.sshPort;
    data['private_ip_address'] = this.privateIpAddress;
    data['blackfire_status'] = this.blackfireStatus;
    data['papertrail_status'] = this.papertrailStatus;
    data['revoked'] = this.revoked;
    data['created_at'] = this.createdAt;
    data['is_ready'] = this.isReady;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['network'] = this.network;
    return data;
  }
}

class Tags {
  int id;
  String name;
  String createdAt;

  Tags({this.id, this.name, this.createdAt});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    return data;
  }
}
