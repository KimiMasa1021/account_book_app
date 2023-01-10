class Routes {
  const Routes({
    required this.root,
    required this.auth,
    required this.privacyPolicy,
    required this.addProjectMember,
    required this.addProjectDetails,
    required this.addProjectImage,
    required this.projectDetails,
    required this.editProject,
    required this.addSaving,
    required this.home,
    required this.setting,
    required this.friendManagement,
    required this.addFriendDescription,
    required this.scanQr,
  });
  final String root;
  final String home;
  final String setting;
  final String auth;
  final String privacyPolicy;
  final String addProjectMember;
  final String addProjectDetails;
  final String addProjectImage;
  final String projectDetails;
  final String editProject;
  final String addSaving;
  final String friendManagement;
  final String addFriendDescription;
  final String scanQr;

  factory Routes.name() {
    return const Routes(
      root: "root",
      auth: "auth",
      home: "home",
      setting: "setting",
      privacyPolicy: "privacyPolicy",
      addProjectMember: "addProjectMember",
      addProjectDetails: "addProjectDetails",
      addProjectImage: "addProjectImage",
      projectDetails: "projectDetails",
      editProject: "editProject",
      addSaving: "addSaving",
      friendManagement: "friendManagement",
      addFriendDescription: "addFriendDescription",
      scanQr: "scanQr",
    );
  }

  factory Routes.path() {
    return const Routes(
      // ログイン
      auth: "/auth",
      privacyPolicy: "privacy_policy",
      //ボトムバー
      root: "/root",
      //　ホームタブ
      home: "home",
      addProjectMember: "add_project_member",
      addProjectDetails: "add_project_details",
      addProjectImage: "add_project_image",
      projectDetails: "project_details:docId",
      editProject: "edit_project",
      addSaving: "add_saving:targetId",
      //　設定タブ
      setting: "setting",
      friendManagement: "friend_management",
      addFriendDescription: "add_friend_description",
      scanQr: "scan_qr",
    );
  }
}
