class Api {
  String title;
  String des;
  String type;
  String logo;
  String streamUrl;
  String hlsUrl;
  String feedUrl;

  Api(
      {this.title,
        this.des,
        this.type,
        this.logo,
        this.streamUrl,
        this.hlsUrl,
        this.feedUrl});

  Api.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    des = json['des'];
    type = json['type'];
    logo = json['logo'];
    streamUrl = json['stream_url'];
    hlsUrl = json['hls_url'];
    feedUrl = json['feed_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['des'] = this.des;
    data['type'] = this.type;
    data['logo'] = this.logo;
    data['stream_url'] = this.streamUrl;
    data['hls_url'] = this.hlsUrl;
    data['feed_url'] = this.feedUrl;
    return data;
  }
}