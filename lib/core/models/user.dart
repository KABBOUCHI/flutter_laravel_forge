class User {
  int id;
  String name;
  String email;
  String vat;
  String country;
  String cell;
  String forgeToken;
  String cardLastFour;
  bool connectedToGithub;
  bool connectedToGitlab;
  bool connectedToBitbucket;
  bool connectedToBitbucketTwo;
  bool connectedToDigitalocean;
  bool connectedToLinode;
  bool connectedToLinode4;
  bool connectedToVultr;
  bool connectedToAws;
  bool readyForBilling;
  int stripeIsActive;
  String stripePlan;
  int subscribed;
  bool canCreateServers;
  bool b2faEnabled;

  User(
      {this.id,
      this.name,
      this.email,
      this.vat,
      this.country,
      this.cell,
      this.forgeToken,
      this.cardLastFour,
      this.connectedToGithub,
      this.connectedToGitlab,
      this.connectedToBitbucket,
      this.connectedToBitbucketTwo,
      this.connectedToDigitalocean,
      this.connectedToLinode,
      this.connectedToLinode4,
      this.connectedToVultr,
      this.connectedToAws,
      this.readyForBilling,
      this.stripeIsActive,
      this.stripePlan,
      this.subscribed,
      this.canCreateServers,
      this.b2faEnabled});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    vat = json['vat'];
    country = json['country'];
    cell = json['cell'];
    forgeToken = json['forge_token'];
    cardLastFour = json['card_last_four'];
    connectedToGithub = json['connected_to_github'];
    connectedToGitlab = json['connected_to_gitlab'];
    connectedToBitbucket = json['connected_to_bitbucket'];
    connectedToBitbucketTwo = json['connected_to_bitbucket_two'];
    connectedToDigitalocean = json['connected_to_digitalocean'];
    connectedToLinode = json['connected_to_linode'];
    connectedToLinode4 = json['connected_to_linode4'];
    connectedToVultr = json['connected_to_vultr'];
    connectedToAws = json['connected_to_aws'];
    readyForBilling = json['ready_for_billing'];
    stripeIsActive = json['stripe_is_active'];
    stripePlan = json['stripe_plan'];
    subscribed = json['subscribed'];
    canCreateServers = json['can_create_servers'];
    b2faEnabled = json['2fa_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['vat'] = this.vat;
    data['country'] = this.country;
    data['cell'] = this.cell;
    data['forge_token'] = this.forgeToken;
    data['card_last_four'] = this.cardLastFour;
    data['connected_to_github'] = this.connectedToGithub;
    data['connected_to_gitlab'] = this.connectedToGitlab;
    data['connected_to_bitbucket'] = this.connectedToBitbucket;
    data['connected_to_bitbucket_two'] = this.connectedToBitbucketTwo;
    data['connected_to_digitalocean'] = this.connectedToDigitalocean;
    data['connected_to_linode'] = this.connectedToLinode;
    data['connected_to_linode4'] = this.connectedToLinode4;
    data['connected_to_vultr'] = this.connectedToVultr;
    data['connected_to_aws'] = this.connectedToAws;
    data['ready_for_billing'] = this.readyForBilling;
    data['stripe_is_active'] = this.stripeIsActive;
    data['stripe_plan'] = this.stripePlan;
    data['subscribed'] = this.subscribed;
    data['can_create_servers'] = this.canCreateServers;
    data['2fa_enabled'] = this.b2faEnabled;
    return data;
  }
}
