import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_project/models/project_item_model.dart';

import '../providers/home_provider.dart';

class ProjectItemPage extends StatefulWidget {
  final int id;

  const ProjectItemPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProjectItemPage> createState() => _ProjectItemPageState();
}

class _ProjectItemPageState extends State<ProjectItemPage> {
  Future<void> _pullRefresh() async {
    context.read<HomeProvider>().getProjectItem(widget.id);
  }

  @override
  void initState() {
    context.read<HomeProvider>().getProjectItem(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProjectItemModel projectItem = context
        .select<HomeProvider, ProjectItemModel>((state) => state.projectItem);
    bool loadProject =
        context.select<HomeProvider, bool>((state) => state.loadProject);
    return Scaffold(
      body: SafeArea(
        child: loadProject == true
            ? const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(strokeWidth: 4),
                ),
              )
            : RefreshIndicator(
                onRefresh: _pullRefresh,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 151,
                          ),
                          Positioned(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
