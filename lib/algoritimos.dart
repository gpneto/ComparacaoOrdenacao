List bubbleSort(List<num> list) {
  int contador = 0;
  int contador_trocas = 0;
  int i, step;
  for (step = 0; step < list.length; step++) {
    for (i = 0; i < list.length - step - 1; i++) {
      contador++;
      if (list[i] > list[i + 1]) {
        int temp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = temp;
        contador_trocas++;
      }
    }
  }

  return [list, contador,contador_trocas];
}


List insertionSort(List<num> list) {
  int contador = 0;
  int contador_trocas = 0;
  for (int i = 1; i < list.length; i++) {
    int value = list[i];
    int j = i - 1;
    contador++;
    while (j >= 0 && list[j] > value) {
      list[j + 1] = list[j];
      j = j - 1;
      contador_trocas++;
    }
    list[j + 1] = value;
    contador_trocas++;
  }
  return [list, contador, contador_trocas];
}


List selectionSort(List<num> list) {
  int contador = 0;
  int contador_trocas = 0;
  var len = list.length;
  for (var i = 0; i < len; i++) {
    var minAt = i;
    for (var j = i + 1; j < len; j++) {
      contador++;
      if (list[j] < list[minAt]) {
        minAt = j;
        contador_trocas++;
      }
    }

    if (minAt != i) {
      var temp = list[i];
      list[i] = list[minAt];
      list[minAt] = temp;
      contador_trocas++;
    }
  }
  return [list, contador,contador_trocas];
}

List heapSort(List<num> list) {
  HeapSort heapSort = HeapSort();
  heapSort.heapSort(list);
  return [list, heapSort.contador, heapSort.contador_trocas];
}

class HeapSort {

  int contador = 0;
  int contador_trocas = 0;

  void heapSort(List<num> a) {
    int count = a.length;

    // first place 'a' in max-heap order
    heapify(a, count);

    int end = count - 1;
    while (end > 0) {
      // swap the root (maximum value) of the heap with the
      // last element of the heap
      int tmp = a[end];
      a[end] = a[0];
      a[0] = tmp;
      contador_trocas++;

      // put the heap back in max-heap order
      siftDown(a, 0, end - 1);

      // decrement the size of the heap so that the previous
      // max value will stay in its proper place
      end--;
      contador++;
    }
  }

  void heapify(List a, int count) {
    // start is assigned the index in 'a' of the last parent node
    int start = ((count - 2) / 2).toInt(); // binary heap
    contador++;
    while (start >= 0) {
      // sift down the node at index 'start' to the proper place
      // such that all nodes below the 'start' index are in heap
      // order
      siftDown(a, start, count - 1);
      start--;
      contador_trocas++;

    }
  }

  void siftDown(List a, int start, int end) {
    // end represents the limit of how far down the heap to shift
    int root = start;

    while ((root * 2 + 1) <= end) {
      contador++;
      // While the root has at least one child
      int child = root * 2 + 1; // root*2+1 points to the left child
      // if the child has a sibling and the child's value is less than its sibling's...
      if (child + 1 <= end && a[child] < a[child + 1]) {
        child = child + 1; // .. then point to the right child instead
      }

      if (a[root] < a[child]) {
        contador_trocas++;
        // out of max-heap order
        int tmp = a[root];
        a[root] = a[child];
        a[child] = tmp;
        root = child; // repeat to continue shifting down the child now
      } else {
        return;
      }
    }
  }
}


List quickSort(List a) {
  int contador = 0;
  int contador_trocas = 0;
  if (a.length <= 1) {
    return [a, contador];
  }

  var pivot = a[0];
  var less = [];
  var more = [];
  var pivotList = [];

  // Partition
  a.forEach((var i) {
    contador++;
    if (i.compareTo(pivot) < 0) {
      contador_trocas++;
      less.add(i);
    } else if (i.compareTo(pivot) > 0) {
      contador_trocas++;
      more.add(i);
    } else {
      contador_trocas++;
      pivotList.add(i);
    }
  });

  // Recursively sort sublists

  less = quickSort(less);
  more = quickSort(more);

  // Concatenate results
  less[0].addAll(pivotList);
  contador_trocas++;
  less[0].addAll(more[0]);
  contador_trocas++;
  return [less[0], less[1] + more[1] + contador, contador_trocas];
}




List mergeSort(List<num> list) {
  MergeSortInDart heapSort = MergeSortInDart();
  heapSort.sortTheList(list);
  return [list, heapSort.contador,heapSort.contador_trocas];
}



class MergeSortInDart {
  int contador = 0;
  int contador_trocas = 0;
  List<num> sortedList;

  // In Dart we often put helper functions at the bottom.
  // You could put them anywhere, we just like it this way
  // for organizational purposes. It's nice to be able to
  // read them in the order they're called.

  // Start here
  List<num> sortTheList(List<num> sortThis){
    // My parameters are listed vertically for readability. Dart
    // doesn't care how you list them, vertically or horizontally.
    sortedList = mSort(
      sortThis,
      sortThis.sublist(0, sortThis.length),
      sortThis.length,
    );
    return sortThis;
  }

  mSort(
      List<num> sortThisList,
      List<num> tempList,
      int thisListLength) {

    if (thisListLength == 1) {
      return;
    }

    // In Dart using ~/ is more efficient than using .floor()
    int middle = (thisListLength ~/ 2);

    // If you use something in a try/on/catch/finally block then
    // be sure to declare it outside the block (for scope)
    List<num> tempLeftList;

    // This was used for troubleshooting. It was left here to show
    // how a basic block try/on can be better than a debugPrint since
    // it won't print unless there's a problem.
    try {
      tempLeftList = tempList.sublist(0, middle);
    } on RangeError {
      print(
          'tempLeftList length = ${tempList.length}, thisListLength '
              'was supposedly $thisListLength and Middle was $middle');
    }

    // If you see "myList.getRange(x,y)" that's a sign the code is
    // from Dart 1 and needs to be updated. It's "myList.sublist" in Dart 2
    List<num> tempRightList = tempList.sublist(middle);

    // Left side.
    mSort(
      tempLeftList,
      sortThisList.sublist(0, middle),
      middle,
    );

    // Right side.
    mSort(
      tempRightList,
      sortThisList.sublist(middle),
      sortThisList.length - middle,
    );

    // Merge it.
    dartMerge(
      tempLeftList,
      tempRightList,
      sortThisList,
    );
  }

  dartMerge(
      List<num> leftSide,
      List<num> rightSide,
      List<num> sortThisList,
      ) {
    int index = 0;
    int elementValue;

    contador++;
    // This should be human readable.
    while (leftSide.isNotEmpty && rightSide.isNotEmpty) {
      contador++;
      if (rightSide[0] < leftSide[0]) {
        contador_trocas++;
        elementValue = rightSide[0];
        rightSide.removeRange(0, 1);
      } else {
        contador_trocas++;
        elementValue = leftSide[0];
        leftSide.removeRange(0, 1);
      }
      sortThisList[index++] = elementValue;
      contador_trocas++;
    }

    while (leftSide.isNotEmpty) {
      contador_trocas++;
      elementValue = leftSide[0];
      leftSide.removeRange(0, 1);
      sortThisList[index++] = elementValue;
    }

    while (rightSide.isNotEmpty) {
      contador_trocas++;
      elementValue = rightSide[0];
      rightSide.removeRange(0, 1);
      sortThisList[index++] = elementValue;
    }
    sortedList = sortThisList;
  }
}