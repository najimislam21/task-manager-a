class TMUrls {
  static String baseURL = "https://task-manager-api.ostad.live/api/v1";
  static String singUpURL = "$baseURL/Registration";
  static String loginURL = "$baseURL/Login";
  static String getTaskCountURL = "$baseURL/taskStatusCount";
  static String createTaskURL = "$baseURL/createTask";
  static String getTaskByStatusURL(String status) => "$baseURL/listTaskByStatus/$status";
  static String deleteTasURL(String id) => "$baseURL/deleteTask/$id";
  static String updateTaskStatusURL(String id, String status) => "$baseURL/updateTaskStatus/$id/$status";

}