part of openapi.api;

class VersionInfo {

  String? branch;

  String? buildHost;

  String? buildTime;

  String? buildUserName;

  String? buildVersion;

  String? closestTagCommitCount;

  String? closestTagName;

  String? commitId;

  String? commitIdAbbrev;

  String? commitIdDescribe;

  String? commitIdDescribeShort;

  String? commitMessageFull;

  String? commitMessageShort;

  String? commitTime;

  String? commitUserName;

  String? dirty;

  String? tags;

  VersionInfo();

  @override
  String toString() {
    return 'VersionInfo[branch=$branch, buildHost=$buildHost, buildTime=$buildTime, buildUserName=$buildUserName, buildVersion=$buildVersion, closestTagCommitCount=$closestTagCommitCount, closestTagName=$closestTagName, commitId=$commitId, commitIdAbbrev=$commitIdAbbrev, commitIdDescribe=$commitIdDescribe, commitIdDescribeShort=$commitIdDescribeShort, commitMessageFull=$commitMessageFull, commitMessageShort=$commitMessageShort, commitTime=$commitTime, commitUserName=$commitUserName, dirty=$dirty, tags=$tags, ]';
  }

  VersionInfo.fromJson(Map<String, dynamic> json) {
    if (json['branch'] == null) {
      branch = null;
    } else {
      branch = json['branch'];
    }
    if (json['buildHost'] == null) {
      buildHost = null;
    } else {
      buildHost = json['buildHost'];
    }
    if (json['buildTime'] == null) {
      buildTime = null;
    } else {
      buildTime = json['buildTime'];
    }
    if (json['buildUserName'] == null) {
      buildUserName = null;
    } else {
      buildUserName = json['buildUserName'];
    }
    if (json['buildVersion'] == null) {
      buildVersion = null;
    } else {
      buildVersion = json['buildVersion'];
    }
    if (json['closestTagCommitCount'] == null) {
      closestTagCommitCount = null;
    } else {
      closestTagCommitCount = json['closestTagCommitCount'];
    }
    if (json['closestTagName'] == null) {
      closestTagName = null;
    } else {
      closestTagName = json['closestTagName'];
    }
    if (json['commitId'] == null) {
      commitId = null;
    } else {
      commitId = json['commitId'];
    }
    if (json['commitIdAbbrev'] == null) {
      commitIdAbbrev = null;
    } else {
      commitIdAbbrev = json['commitIdAbbrev'];
    }
    if (json['commitIdDescribe'] == null) {
      commitIdDescribe = null;
    } else {
      commitIdDescribe = json['commitIdDescribe'];
    }
    if (json['commitIdDescribeShort'] == null) {
      commitIdDescribeShort = null;
    } else {
      commitIdDescribeShort = json['commitIdDescribeShort'];
    }
    if (json['commitMessageFull'] == null) {
      commitMessageFull = null;
    } else {
      commitMessageFull = json['commitMessageFull'];
    }
    if (json['commitMessageShort'] == null) {
      commitMessageShort = null;
    } else {
      commitMessageShort = json['commitMessageShort'];
    }
    if (json['commitTime'] == null) {
      commitTime = null;
    } else {
      commitTime = json['commitTime'];
    }
    if (json['commitUserName'] == null) {
      commitUserName = null;
    } else {
      commitUserName = json['commitUserName'];
    }
    if (json['dirty'] == null) {
      dirty = null;
    } else {
      dirty = json['dirty'];
    }
    if (json['tags'] == null) {
      tags = null;
    } else {
      tags = json['tags'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (branch != null)
      json['branch'] = branch;
    if (buildHost != null)
      json['buildHost'] = buildHost;
    if (buildTime != null)
      json['buildTime'] = buildTime;
    if (buildUserName != null)
      json['buildUserName'] = buildUserName;
    if (buildVersion != null)
      json['buildVersion'] = buildVersion;
    if (closestTagCommitCount != null)
      json['closestTagCommitCount'] = closestTagCommitCount;
    if (closestTagName != null)
      json['closestTagName'] = closestTagName;
    if (commitId != null)
      json['commitId'] = commitId;
    if (commitIdAbbrev != null)
      json['commitIdAbbrev'] = commitIdAbbrev;
    if (commitIdDescribe != null)
      json['commitIdDescribe'] = commitIdDescribe;
    if (commitIdDescribeShort != null)
      json['commitIdDescribeShort'] = commitIdDescribeShort;
    if (commitMessageFull != null)
      json['commitMessageFull'] = commitMessageFull;
    if (commitMessageShort != null)
      json['commitMessageShort'] = commitMessageShort;
    if (commitTime != null)
      json['commitTime'] = commitTime;
    if (commitUserName != null)
      json['commitUserName'] = commitUserName;
    if (dirty != null)
      json['dirty'] = dirty;
    if (tags != null)
      json['tags'] = tags;
    return json;
  }

  static List<VersionInfo> listFromJson(List<dynamic> json) {
    return json.map((value) => VersionInfo.fromJson(value)).toList();
  }

  static Map<String, VersionInfo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, VersionInfo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = VersionInfo.fromJson(value));
    }
    return map;
  }
}

