import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

typedef CustomValueChanged<T> = void Function(T?);

class CustomSliderWidget extends StatelessWidget {
  final String sliderKey;
  final ValueChanged<BuildContext> onDeletePressed;
  final bool isComplated;
  final bool isFavourite;
  final String title;
  final String time;
  final VoidCallback onTapFavoirite;
  final CustomValueChanged<bool> onValueChanged;
  const CustomSliderWidget(
      {super.key,
      required this.sliderKey,
      required this.onDeletePressed,
      required this.isComplated,
      required this.isFavourite,
      required this.title,
      required this.time,
      required this.onValueChanged,
      required this.onTapFavoirite});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),
        color: Theme.of(context).splashColor,
        child: ClipRRect(
          child: Slidable(
            key: ValueKey<String>(sliderKey),
            endActionPane: ActionPane(
              extentRatio: 0.2,
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.red,
                    icon: Icons.delete_outline_rounded,
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(10.w)),
                    onPressed: onDeletePressed)
              ],
            ),
            child: CheckboxListTile(
              value: isComplated,
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).iconTheme.color),
              ),
              subtitle: Text(time),
              controlAffinity: ListTileControlAffinity.leading,
              secondary: IconButton(
                onPressed: onTapFavoirite,
                padding: EdgeInsets.zero,
                icon: isFavourite
                    ? const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    : const Icon(Icons.star_border),
              ),
              onChanged: onValueChanged,
            ),
          ),
        ));
  }
}
