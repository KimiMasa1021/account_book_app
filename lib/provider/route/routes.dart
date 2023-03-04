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
    required this.userProfile,
    required this.scanQr,
    required this.memberList,
    required this.inviteMember,
    required this.designManagement,
    required this.accountManagement,
    required this.webView,
    required this.addTag,
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
  final String userProfile;
  final String scanQr;
  final String memberList;
  final String inviteMember;
  final String designManagement;
  final String accountManagement;
  final String webView;
  final String addTag;
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
        userProfile: "userProfile",
        scanQr: "scanQr",
        memberList: "memberList",
        inviteMember: "inviteMember",
        designManagement: "designManagement",
        accountManagement: "accountManagement",
        webView: "webView",
        addTag: "addTag");
  }

  factory Routes.path() {
    return const Routes(
      auth: "/auth",
      root: "/root",
      addProjectMember: "add_project_member",
      addProjectDetails: "add_project_details",
      addProjectImage: "add_project_image",
      projectDetails: "project_details",
      editProject: "edit_project/:targetId",
      memberList: "memberList",
      inviteMember: "invite_member/:targetId",
      addSaving: "add_saving",
      friendManagement: "friend_management",
      userProfile: "userProfile",
      scanQr: "scan_qr",
      designManagement: "design_management",
      accountManagement: "account_management",
      webView: "web_view",
      addTag: "add_tag",
    );
  }
}
