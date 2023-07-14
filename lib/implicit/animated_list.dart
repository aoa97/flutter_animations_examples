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
      list.value.removeAt(index);
      listKey.currentState?.removeItem(index, (context, animation) => const SizedBox());
    }

    return MainScaffold(
      title: "AnimatedList",
      onAction: addItem,
      actionIcon: const Icon(Icons.add),
      body: Center(
        child: AnimatedList(
          key: listKey,
          initialItemCount: list.value.length,
          itemBuilder: (context, index, animation) => SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text(list.value[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => removeItem(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
