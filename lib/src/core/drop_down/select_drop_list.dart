import 'package:fl_school/src/core/app_colors.dart';
import 'package:fl_school/src/core/drop_down/drop_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDropList extends StatefulWidget {
  final List<OptionItem> list ;
  final onSelect ;
  const SelectDropList({super.key, required this.list, this.onSelect});
  @override
  _SelectDropListState createState() => _SelectDropListState();
}

class _SelectDropListState extends State<SelectDropList> with SingleTickerProviderStateMixin {

  var optionItemSelected;
  var expandController;
  var animation;
  bool isShow = false;


  @override
  void initState() {
    super.initState();
    optionItemSelected = widget.list.first ;


    expandController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 350)
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if(isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 17),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10.r,
                    color: Colors.black26,
                    offset: Offset(0, 2))
              ],
            ),
            child:  Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        this.isShow = !this.isShow;
                        _runExpandCheck();
                        setState(() {

                        });
                      },
                      child: Text(optionItemSelected.title, style: TextStyle(
                          color: colorPrimary,
                          fontSize: 16),),
                    )
                ),
                Align(
                  alignment: Alignment(1, 0),
                  child: Icon(
                    isShow ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: colorPrimary,
                    size: 20.h,
                  ),
                ),
              ],
            ),
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10,left: 5,right: 5),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black26,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: _buildDropListOptions(widget.list, context)
              )
          ),
//          Divider(color: Colors.grey.shade300, height: 1,)
        ],
      ),
    );
  }

  Column _buildDropListOptions(List<OptionItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(OptionItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: colorGray, width: 1)),
                ),
                child: Text(item.title,
                    style: TextStyle(
                        color: Color(0xFF307DF1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            this.optionItemSelected = item;
            isShow = false;
            expandController.reverse();
            widget.onSelect(item) ;
          });

          // widget.onOptionSelected(item);
        },
      ),
    );
  }

}