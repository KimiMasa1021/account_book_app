class Routes {
  const Routes({
    required this.root,
    required this.auth,
    required this.addProjectMember,
    required this.addProjectDetails,
    required this.addProjectImage,
    required this.projectDetails,
    required this.editProject,
    required this.addSaving,
    required this.friendManagement,
    required this.addFriendDescription,
    required this.scanQr,
    required this.memberList,
    required this.inviteMember,
    required this.designManagement,
    required this.accountManagement,
    required this.webView,
  });
  final String root;
  final String auth;
  final String addProjectMember;
  final String addProjectDetails;
  final String addProjectImage;
  final String projectDetails;
  final String editProject;
  final String addSaving;
  final String friendManagement;
  final String addFriendDescription;
  final String scanQr;
  final String memberList;
  final String inviteMember;
  final String designManagement;
  final String accountManagement;
  final String webView;

  factory Routes.name() {
    return const Routes(
      root: "root",
      auth: "auth",
      addProjectMember: "addProjectMember",
      addProjectDetails: "addProjectDetails",
      addProjectImage: "addProjectImage",
      projectDetails: "projectDetails",
      editProject: "editProject",
      addSaving: "addSaving",
      friendManagement: "friendManagement",
      addFriendDescription: "addFriendDescription",
      scanQr: "scanQr",
      memberList: "memberList",
      inviteMember: "inviteMember",
      designManagement: "designManagement",
      accountManagement: "accountManagement",
      webView: "webView",
    );
  }

  factory Routes.path() {
    return const Routes(
      // ログイン
      auth: "/auth",
      //ボトムバー
      root: "/root",
      //　ホームタブ
      addProjectMember: "add_project_member",
      addProjectDetails: "add_project_details",
      addProjectImage: "add_project_image",
      projectDetails: "project_details",
      editProject: "edit_project/:targetId",
      memberList: "memberList",
      inviteMember: "invite_member/:targetId",
      addSaving: "add_saving",
      //　設定タブ
      friendManagement: "friend_management",
      addFriendDescription: "add_friend_description",
      scanQr: "scan_qr",
      designManagement: "design_management",
      accountManagement: "account_management",
      //その他
      webView: "web_view",
    );
  }
}
