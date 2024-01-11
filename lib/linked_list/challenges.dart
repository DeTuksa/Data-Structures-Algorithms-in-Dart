import 'package:dsa_dart/linked_list/linked_list.dart';

createLinkedlist() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1);
}

testBasicOps() {
  final list = LinkedList<int>();

  list.push(3);
  list.push(2);
  list.push(1);
  list.append(4);
  // var node = list.nodeAt(2);
  // list.insertAfter(node!, 5);
  // list.pop();
  // list.removeLast();
  // list.removeAfter(node!);
  print(list);
  for (final element in list) {
    print(element);
  }
  printReverse(list.head);
}

//  Print in reverse
printReverse<T>(Node<T>? node) {
  if (node == null) return;

  printReverse(node.next);

  print(node.value);
}
