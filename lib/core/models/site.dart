class Site {
  int id;
  String name;
  String directory;
  bool wildcards;
  String status;
  String repository;
  String repositoryProvider;
  String repositoryBranch;
  String repositoryStatus;
  bool quickDeploy;
  String deploymentStatus;
  String projectType;
  String app;
  String appStatus;
  String hipchatRoom;
  String slackChannel;
  String createdAt;
  String deploymentUrl;
  List<String> tags;

  Site(
      {this.id,
      this.name,
      this.directory,
      this.wildcards,
      this.status,
      this.repository,
      this.repositoryProvider,
      this.repositoryBranch,
      this.repositoryStatus,
      this.quickDeploy,
      this.deploymentStatus,
      this.projectType,
      this.app,
      this.appStatus,
      this.hipchatRoom,
      this.slackChannel,
      this.createdAt,
      this.deploymentUrl,
      this.tags});

  Site.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    directory = json['directory'];
    wildcards = json['wildcards'];
    status = json['status'];
    repository = json['repository'];
    repositoryProvider = json['repository_provider'];
    repositoryBranch = json['repository_branch'];
    repositoryStatus = json['repository_status'];
    quickDeploy = json['quick_deploy'];
    deploymentStatus = json['deployment_status'];
    projectType = json['project_type'];
    app = json['app'];
    appStatus = json['app_status'];
    hipchatRoom = json['hipchat_room'];
    slackChannel = json['slack_channel'];
    createdAt = json['created_at'];
    deploymentUrl = json['deployment_url'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['directory'] = this.directory;
    data['wildcards'] = this.wildcards;
    data['status'] = this.status;
    data['repository'] = this.repository;
    data['repository_provider'] = this.repositoryProvider;
    data['repository_branch'] = this.repositoryBranch;
    data['repository_status'] = this.repositoryStatus;
    data['quick_deploy'] = this.quickDeploy;
    data['deployment_status'] = this.deploymentStatus;
    data['project_type'] = this.projectType;
    data['app'] = this.app;
    data['app_status'] = this.appStatus;
    data['hipchat_room'] = this.hipchatRoom;
    data['slack_channel'] = this.slackChannel;
    data['created_at'] = this.createdAt;
    data['deployment_url'] = this.deploymentUrl;
    data['tags'] = this.tags;
    return data;
  }
}
