import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:view_project/models/commentI_item_model.dart';
import 'package:view_project/models/project_item_model.dart';
import 'package:view_project/models/project_pagination_model.dart';
import 'package:view_project/pages/home_page/api/home_api.dart';

class HomeProvider extends ChangeNotifier {
  Logger logger = Logger();
  ScrollController controller = ScrollController();
  bool loadingFirstPage = true;
  bool loadingPage = false;
  bool hasNextPage = true;
  int pageNumber = 1;
  int totalCount = 0;
  bool isProjectDode = false;
  bool loadProject = true;
  List<CommentItemModel> comments = [];
  List<ProjectItemModel> _projectFilter = [];
  ProjectItemModel projectItem = ProjectItemModel();
  List<ProjectItemModel> get projectFilter => _projectFilter;
  final commentController = TextEditingController();

  set projectFilter(List<ProjectItemModel> value) {
    _projectFilter = value;
    notifyListeners();
  }

  List<ProjectItemModel> _projectList = [];

  List<ProjectItemModel> get projectList => _projectList;

  set projectList(List<ProjectItemModel> value) {
    _projectList = value;
    notifyListeners();
  }

  void setDoneProject(bool val) {
    isProjectDode = val;
    notifyListeners();
    projectDoneFilter();
  }

  Future<void> getProjects() async {
    try {
      ProjectPaginationModel? res = await HomeApi.getProjectApi(pageNumber);
      if (res != null) {
        totalCount = res.total!;
        projectList = res.data!;
        projectFilter = res.data!;
        controller.addListener(() => loadProjectNextPage());
        pageNumber = pageNumber + 1;
        notifyListeners();
      }
    } catch (error) {
      logger.i(error);
    } finally {
      loadingFirstPage = false;
      notifyListeners();
    }
  }

  Future<void> loadProjectNextPage() async {
    if (hasNextPage == true &&
        loadingFirstPage == false &&
        loadingPage == false &&
        controller.position.extentAfter < 300) {
      loadingPage = true;
      notifyListeners();
      try {
        ProjectPaginationModel? res = await HomeApi.getProjectApi(pageNumber);

        if (res != null) {
          List<ProjectItemModel> copyResponse = [...?res.data];
          projectList = [...projectList, ...copyResponse];
          projectFilter = [...projectList, ...copyResponse];
          projectDoneFilter();
          pageNumber = pageNumber + 1;
          if (totalCount <= projectList.length) {
            hasNextPage = false;
          }
        }
      } catch (error) {
        logger.i(error);
      } finally {
        loadingPage = false;
        notifyListeners();
      }
    }
  }

  void projectDoneFilter() {
    if (isProjectDode) {
      List<ProjectItemModel> copy = [...projectList];
      projectFilter = copy.where((i) => i.status == "done").toList();
    } else {
      projectFilter = projectList;
    }
  }

  void clearState() {
    loadingFirstPage = true;
    loadingPage = false;
    hasNextPage = true;
    isProjectDode = false;
    pageNumber = 1;
    totalCount = 0;
    projectList = [];
    projectFilter = [];
    controller.removeListener(loadProjectNextPage);
  }

  Future<void> getProjectItem(int id) async {
    try {
      loadProject = true;
      notifyListeners();
      ProjectItemModel? res = await HomeApi.getProjectItemApi(id);
      if (res != null) {
        projectItem = res;
        notifyListeners();
      }
    } catch (error) {
      logger.i(error);
    } finally {
      loadProject = false;
      notifyListeners();
    }
  }
  Future<void> getProjectIComments(int id) async {
    try {
      List<CommentItemModel>? res = await HomeApi.getCommentListApi(id);
      if (res != null) {
        comments = res;
        notifyListeners();
      }
    } catch (error) {
      logger.i(error);
    } finally {
    }
  }
  Future<void> addProjectIComments(int id) async {
    try {
      if(commentController.text.isNotEmpty){
        dynamic data={
          "project_id":id,
          "text":commentController.text
        };
        bool res = await HomeApi.addCommentApi(data);
        if (res) {
          commentController.clear();
          getProjectIComments(id);
        }
      }

    } catch (error) {
      logger.i(error);
    } finally {
    }
  }
}
