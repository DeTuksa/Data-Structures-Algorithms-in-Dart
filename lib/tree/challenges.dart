import 'package:dsa_dart/queues/queue.dart';
import 'package:dsa_dart/tree/tree.dart';

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);
  return tree;
}

void printEachLevel<T>(TreeNode<T> tree) {
  final result = StringBuffer();
  var queue = QueueStack<TreeNode<T>>();
  var nodeLeftInCurrentLevel = 0;
  queue.enqueue(tree);
  while (!queue.isEmpty) {
    nodeLeftInCurrentLevel = queue.length;
    while (nodeLeftInCurrentLevel > 0) {
      final node = queue.dequeue();
      if (node == null) break;
      result.write("${node.value}");
      for (var element in node.children) {
        queue.enqueue(element);
      }
      nodeLeftInCurrentLevel -= 1;
    }
    result.write("\n");
  }
  print(result);
}
