import 'package:dsa_dart/queues/ring_buffer.dart';

import 'double_linkedlist.dart';

//A data structure that user the FIFO (First-in-first-out) ordering.
//Userful when you need to maintain the order of your elements to process later

abstract class Queue<E> {
  //Insert an element at the back of the queue. Returns true if the operation was successful
  bool enqueue(E element);

  //Remove the element at the front of the queue and return it.
  E? dequeue();

  //Check if the queue is emoty
  bool get isEmpty;

  //Returns the element at the front of the queue without removing it
  E? get peek;
}

// List-Based Implementation
class QueueList<E> implements Queue<E> {
  final _list = <E>[];

  @override
  E? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => (isEmpty) ? null : _list.first;

  @override
  String toString() => _list.toString();
}

// Linked-List-Based Implementation
class QueueLinkedList<E> implements Queue {
  final _list = DoublyLinkedList<E>();

  @override
  dequeue() => _list.pop();

  @override
  bool enqueue(element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;
    return _leftStack.removeLast();
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ].join(', ');
    return '[$combined]';
  }

  int get length => _leftStack.length + _rightStack.length;
}
