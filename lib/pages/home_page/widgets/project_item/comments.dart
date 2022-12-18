import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:view_project/_utils/parse_date.dart';
import 'package:view_project/models/commentI_item_model.dart';
import 'package:view_project/pages/login_page/providers/login_provider.dart';

import '../../../../config/environment.dart';
import '../../providers/home_provider.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<CommentItemModel> list = [];
  final String baseUrl = Environment().config.storage;

  @override
  Widget build(BuildContext context) {
    List<CommentItemModel> comments =
        context.select<HomeProvider, List<CommentItemModel>>(
            (state) => state.comments);
    LoginProvider loginProvider = context.watch<LoginProvider>();
    HomeProvider provider = context.watch<HomeProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,bottom: 20),
          child: Text(tr("home_page_comment"),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: fromCssColor("#080A1C")
          ),),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length ?? 0,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, childIndex) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                child: CommentTreeWidget<CommentItemModel, CommentItemModel>(
                  comments[childIndex],
                  comments[childIndex].child_comments ?? list,
                  treeThemeData: TreeThemeData(
                      lineColor: Colors.green[500]!, lineWidth: 3),
                  avatarRoot: (context, data) => const PreferredSize(
                    preferredSize: Size.fromRadius(18),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                      // backgroundImage: AssetImage('assets/avatar_2.png'),
                    ),
                  ),
                  avatarChild: (context, data) => const PreferredSize(
                    preferredSize: Size.fromRadius(12),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey,
                      // backgroundImage: AssetImage('assets/avatar_1.png'),
                    ),
                  ),
                  contentChild: (context, data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data.owner?.last_name ?? ''} ${data.owner?.first_name ?? ''}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: fromCssColor("#121F3E")
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                data.text ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: fromCssColor("#121F3E")
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                                getParseDate(data.created_at??"", context.locale),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: fromCssColor("#8B96A5")
                                ),
                              ),
                            ],
                          ),
                        ),
                        // DefaultTextStyle(
                        //   style: Theme.of(context).textTheme.caption!.copyWith(
                        //       color: Colors.grey[700],
                        //       fontWeight: FontWeight.bold),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(top: 4),
                        //     child: Row(
                        //       children: const [
                        //         SizedBox(
                        //           width: 8,
                        //         ),
                        //         Text('Like'),
                        //         SizedBox(
                        //           width: 24,
                        //         ),
                        //         Text('Reply'),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    );
                  },
                  contentRoot: (context, data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data.owner?.last_name ?? ''} ${data.owner?.first_name ?? ''}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: fromCssColor("#121F3E")
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                data.text ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: fromCssColor("#121F3E")
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text(
                               getParseDate(data.created_at??"", context.locale),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: fromCssColor("#8B96A5")
                                ),
                              ),
                            ],
                          ),
                        ),
                        // DefaultTextStyle(
                        //   style: Theme.of(context).textTheme.caption!.copyWith(
                        //       color: Colors.grey[700],
                        //       fontWeight: FontWeight.bold),
                        //   child: Padding(
                        //     padding: EdgeInsets.only(top: 4),
                        //     child: Row(
                        //       children: [
                        //         SizedBox(
                        //           width: 8,
                        //         ),
                        //         Text('Like'),
                        //         SizedBox(
                        //           width: 24,
                        //         ),
                        //         Text('Reply'),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    );
                  },
                ),
              );
            }),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
              CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('${baseUrl}${loginProvider.userProfile?.avatar??''}'),
              ),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: provider.commentController,
                    style: const TextStyle(fontSize: 14),
                    onSubmitted: (value) {
                      provider.addProjectIComments(provider.projectItem.id??0);
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () => {
                          provider.addProjectIComments(provider.projectItem.id??0)
                        },
                      ),
                      hintText: tr("home_page_comment_add"),
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
