
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_project/models/project_item_model.dart';
import 'package:view_project/pages/home_page/widgets/project_item/info_bse.dart';

import '../../../../config/environment.dart';
import '../../providers/home_provider.dart';

class ProjectItemPage extends StatefulWidget {
  final int id;

  const ProjectItemPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProjectItemPage> createState() => _ProjectItemPageState();
}

class _ProjectItemPageState extends State<ProjectItemPage> {
  final String baseUrl = Environment().config.storage;

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
                            width: double.infinity,
                            child: Image.network(
                              '$baseUrl${projectItem.avatarSrc}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.black,
                                  alignment: Alignment.center,
                                  child:  Text(
                                    tr('home_page_error_load'),
                                    style: const TextStyle(fontSize: 20, color: Colors.white),
                                  ),
                                );
                              },
                              loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                              child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                      const InfoBase()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
