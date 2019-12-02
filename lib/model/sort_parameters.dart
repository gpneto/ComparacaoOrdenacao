
import 'package:aps_sort/screen/grafico_media.dart';
import "package:built_value/built_value.dart";
import "package:built_collection/built_collection.dart";




class SortParameters  {

  factory SortParameters.init(name, total_vetor) => SortParameters(nome: name, total_vetor: total_vetor,total_itens:0,
      media_sort:0,media_trocas:0, total_interacoes_do_array:0, total_trocas_do_array: 0, total_interacoes_todos: 0, total_trocas_todos: 0, index_array:0, tempo_execucao:Duration(), tempo_execucao_total: Duration());


  @nullable
  String  nome;


  int  total_vetor;

  @nullable
  int  total_itens;


  @nullable
  num  media_sort;

  @nullable
  num  media_trocas;

  @nullable
  num  total_interacoes_do_array;

  @nullable
  num  total_trocas_do_array;


  @nullable
  num  total_interacoes_todos;

  @nullable
  num  total_trocas_todos;


  @nullable
  int  index_array;



  @nullable
  Duration tempo_execucao;

  @nullable
  Duration tempo_execucao_total;


  SortParameters({this.total_vetor, this.total_itens, this.media_sort,
      this.media_trocas, this.total_interacoes_do_array,
      this.total_trocas_do_array, this.total_interacoes_todos,
      this.total_trocas_todos, this.index_array, this.nome, this.tempo_execucao,
      this.tempo_execucao_total});


}


