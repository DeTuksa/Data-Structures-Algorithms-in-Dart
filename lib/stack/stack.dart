/// * The stack data structure is identical in concept to a physical stack of objects.
/// * The main goal of building a stack is to enforce how you access your data.
/// * There are only two essential opetations for a stack that are constant time [O(1)]
/// *   1. push: Add element to the top of the stack
/// *   2. pop: Remove the top element of the stack
/// 
/// Stacks are crucial to problems that search trees and graphs.

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }

  //Add element to the top of the stack
  void push(E element) => _storage.add(element);

//Remove the top element of the stack
  E pop() => _storage.removeLast();

  //Look at the top element of the stack without mutating its contents
  E get peek => _storage.last;

  //Check if the stack is empty
  bool get isEmpty => _storage.isEmpty;

  //Check if the stack is not empty
  bool get isNotEmpty => !isEmpty;

  //Converting an existing iterable collection to a stack
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);
}
