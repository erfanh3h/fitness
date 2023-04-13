class SettingsModel {
  final String? headerImageLink;
  final String? liveLink;
  final bool? letShowHomeLive;
  final bool? letShowPostLive;
  final bool? forceUpdate;
  final String? lastVersion;
  final bool? isUpdate;

  SettingsModel({
    this.headerImageLink,
    this.liveLink,
    this.letShowHomeLive,
    this.letShowPostLive,
    this.forceUpdate,
    this.lastVersion,
    this.isUpdate,
  });

  factory SettingsModel.fromJson(Map data) {
    return SettingsModel(
      headerImageLink: data['header_image'],
      liveLink: data['live_url_home'],
      letShowHomeLive: data['show_live_home'],
      letShowPostLive: data['show_live_post'],
      forceUpdate: data['version']['force_update'],
      lastVersion: data['version']['last_version'],
      isUpdate: data['version']['is_update'],
    );
  }
}
