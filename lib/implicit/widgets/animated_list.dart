import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/main_scaffold.dart';

class AnimatedListExample extends HookWidget {
  const AnimatedListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedListState> listKey = useMemoized(() => GlobalKey<AnimatedListState>());
    final list = useState([]);

    addItem() {
      list.value.insert(0, "Item ${list.value.length}");
      listKey.currentState?.insertItem(0);
    }

    removeItem(int index) {
      final String item = list.value[index];
      list.value.removeAt(index);
      listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(sizeFactor: animation, child: _ListTileItem(label: item)),
      );
    }

    return MainScaffold(
      title: "AnimatedList",
      githubPath: "/implicit/widgets/animated_list.dart",
      onAction: addItem,
      actionIcon: const Icon(Icons.add),
      body: Center(
        child: AnimatedList(
          key: listKey,
          initialItemCount: list.value.length,
          itemBuilder: (context, index, animation) => SizeTransition(
            sizeFactor: animation,
            child: _ListTileItem(label: list.value[index], onDelete: () => removeItem(index)),
          ),
        ),
      ),
    );
  }
}

class _ListTileItem extends StatelessWidget {
  final String label;
  final void Function()? onDelete;

  const _ListTileItem({required this.label, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
