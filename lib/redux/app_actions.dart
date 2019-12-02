


import 'package:aps_sort/model/sort_parameters.dart';



class CleanState {
  CleanState();
}



class UpdateMediaSort {
  final SortParameters sortParameters;
  UpdateMediaSort(this.sortParameters);
}


class UpdateDescricao {
  final String descricao;
  UpdateDescricao(this.descricao);
}

class InitSort {

  final int total_vetor;
  final int total_itens;
  final List<String> tipos;

  InitSort({this.total_vetor, this.total_itens, this.tipos});
}


