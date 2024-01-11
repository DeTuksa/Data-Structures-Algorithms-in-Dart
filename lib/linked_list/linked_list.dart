/// * A linked list is a collection of values arranged in a linear, unidirectional sequence.
/// * Constant time [O(1)] Time complexity for insertion and removal from the front of the list.
/// * It is a chain of nodes that hold a value and reference the next node with a null reference indicating the end of hte list
/// * There are 3 ways to add values to a list: push, append and insertAfter
/// * There are also 3 ways to remove values: pop, removeLast, removeAfter

class Node<T> {
  Node({required this.value, this.next});

  // Value the node holds
  T value;

  // Reference to the next node
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  /// Adds a value at the front of the list. Also known as head-first insertion
  /// O(1) time complexity
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// Add a value at the end of the list. Also known as tail-end insertion
  /// O(1) time complexity
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);

    tail = tail!.next;
  }

  /// Retrieve node at a particular index in the list
  /// O(1) time complexity
  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  /// Inserts a node afer a particular node in the list
  /// O(n) time complexity
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  /// Removing the value at the front of the linked list.
  /// O(1) time complexity
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  /// Remove the last node of the list
  /// O(n) time complexity
  E? removeLast() {
    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  /// Remove after a particular node in the linked list
  /// O(1) time complexity
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }

    node.next = node.next?.next;
    return value;
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstIteration = true;

  @override
  bool moveNext() {

    if(_list.isEmpty) return false;

    if(_firstIteration) {
      // Set the current node to the heade
      _currentNode = _list.head;
      _firstIteration = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    // Returns true if there are more elements and false when end has been reached.
    return _currentNode != null;
  }
}
