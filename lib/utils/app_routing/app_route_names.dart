enum AppRouteNames {
  signUp('/sign_up'),
  signIn('/sign_in'),
  search('/search'),
  important('/important'),
  complated('/complated'),
  taskListPage('/task_list_page'),
  taskListView('/task_list_view'),
  profile('/profile'),
  home('/home');

  final String route;
  const AppRouteNames(this.route);
}
