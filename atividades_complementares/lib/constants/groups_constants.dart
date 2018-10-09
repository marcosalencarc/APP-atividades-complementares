

import 'package:atividades_complementares/model/categoria.dart';
import 'package:atividades_complementares/model/grupo.dart';

/*
* @author: Marcos de Alencar Carvalho
* */
final Grupo grupo1 =
Grupo(
    id:1,
    descricao: "Iniciação à acadêmica, monitoria, pesquisa e extensão",
    categorias: [
      Categoria(
          id: 1,
          nome: "Projetos de pesquisa",
          descricao:"Iniciação   Científica   com   bolsa ou voluntário  PIBIC,   ITI   ou   bolsa   ligada   a   projetos   de   pesquisa aprovados na unidade acadêmica",
          qntAp:  3.0, medida: Unidade.SEMANA,grupo: 1),
      Categoria(
          id: 2,
          nome: "Participação PET",
          descricao:"Participação do grupo PET",
          qntAp:  3.0,medida: Unidade.SEMANA,grupo: 1),
      Categoria(
          id: 3,
          nome: "Monitoria (PID)",
          descricao:"Monitoria com bolsa ou voluntário",
          qntAp:  3.0, medida: Unidade.SEMANA,grupo: 1),
      Categoria(
          id: 4,
          nome: "Pojetos de extensão",
          descricao:"Participação em projetos de extensão com bolsa ou voluntário",
          qntAp:  3.0, medida: Unidade.SEMANA,grupo: 1),
      Categoria(
          id: 5,
          nome: "Pojetos de Iniciação Acadêmica (BIA)",
          descricao:"Participação em bolsa de Iniciação Acadêmica",
          qntAp:  3.0, medida: Unidade.SEMANA,grupo: 1),
      Categoria(
          id: 6,
          nome: "Bolsista de informática",
          descricao:"Participação em bolsa de Informática",
          qntAp:  3.0, medida: Unidade.SEMANA,grupo: 1),
      Categoria(
          id: 7,
          nome: "Ministrar cursos",
          descricao:"Cursos ministrados",
          qntAp:  2.0, medida: Unidade.HORAS,grupo: 1),
    ],
    maxAp: 96
);

final Grupo grupo2 =
Grupo(
    id:2,
    descricao: "Atividades artístico, culturais e esportivas",
    categorias: [
      Categoria(
          id: 8,
          nome: "Eventos artístico, culturais e esportivas",
          descricao:"Evento em grupo de teatro, de dança, coral, literário, musical ou em equipe esportiva, envolvendo ensaios/treinos e apresentações/torneios",
          qntAp:  4.0, medida: Unidade.EVENTO,grupo: 2),
    ],
    maxAp: 80
);

final Grupo grupo3 =
Grupo(
    id:3,
    descricao: "Participação e/ou organização de eventos",
    categorias: [
      Categoria(
          id: 9,
          nome: "Congresso internacional",
          descricao:"Participação em congressos internacionais",
          qntAp:  8.0, medida: Unidade.DIAS,grupo: 3),
      Categoria(
          id: 10,
          nome: "Congresso nacional",
          descricao:"Participação em congressos nacionais",
          qntAp:  8.0, medida: Unidade.DIAS,grupo: 3),
      Categoria(
          id: 11,
          nome: "Seminários, colóquios e palestra",
          descricao:"Participação em seminários, colóquios e palestras avaliados pelo Colegiado do curso como  contribuintes para  um  desenvolvimento  integral   do  profissional, "
              "excluídas as atividades internas de grupos de pesquisas",
          qntAp:  0.25,medida: Unidade.HORAS,grupo: 3),
      Categoria(
          id: 12,
          nome: "Apresentação de artigo em congresso internacional",
          descricao:"Apresentação de artigo em congresso internacional",
          qntAp:  8.0, medida: Unidade.QUANTIDADE,grupo: 3),
      Categoria(
          id: 13,
          nome: "Apresentação de artigo em congresso nacional",
          descricao:"Apresentação de artigo em congresso nacional",
          qntAp:  4.0, medida: Unidade.SEMANA,grupo: 3),
      Categoria(
          id: 14,
          nome: "Organização de eventos científicos",
          descricao:"Organização de eventos como coordenador ou membro da comissão do evento",
          qntAp:  32.0, medida: Unidade.QUANTIDADE,grupo: 3),
      Categoria(
          id: 15,
          nome: "Monitor em eventos",
          descricao:"Participação como monitor (ou auxiliar) em eventos",
          qntAp:  4.0, medida: Unidade.DIAS,grupo: 3),
    ],
    maxAp: 32
);
final Grupo grupo4 =
Grupo(
    id:4,
    descricao: "Experiências ligadas à formação profissional e/ou correlatas",
    categorias: [
      Categoria(
          id: 16,
          nome: "Estágio Não-Curricular",
          descricao:"Estágio realizado fora do estágio obrigatório",
          qntAp:  8.0, medida: Unidade.SEMANA,grupo: 4),
      Categoria(
          id: 17,
          nome: "Cursos e minicursos",
          descricao:"Cursos e minicursos correlatos durante o período da graduação",
          qntAp:  1.0, medida: Unidade.HORAS,grupo: 4),
      Categoria(
          id: 18,
          nome: "Participação em Visitas técnicas em Russas",
          descricao:"Participação em Visitas técnicas",
          qntAp:  2.0,medida: Unidade.QUANTIDADE,grupo: 4),
      Categoria(
          id: 19,
          nome: "Participação em Visitas técnicas em outras cidades",
          descricao:"Participação em Visitas técnicas em localidades fora de russas",
          qntAp:  4.0,medida: Unidade.QUANTIDADE,grupo: 4),
    ],
    maxAp: 64
);
final Grupo grupo5 =
Grupo(
    id:5,
    descricao: "Produção Técnica e/ou Científica",
    categorias: [
      Categoria(
          id: 20,
          nome: "Publicação de artigo em revista internacional ou nacional COM Qualis",
          descricao:"Publicação de artigo em revista internacional ou nacional com critério Qualis da Capes (no ano da publicação)",
          qntAp:  96.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 21,
          nome: "Publicação de artigo em revista internacional SEM Qualis",
          descricao:"Publicação de artigo em revista internacional sem critério Qualis da Capes (no ano da publicação)",
          qntAp:  72.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 22,
          nome: "Publicação de artigo em revista nacional SEM Qualis",
          descricao:"Publicação de artigo em revista nacional sem critério Qualis da Capes (no ano da publicação)",
          qntAp:  48.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 23,
          nome: "Publicação de artigo completo em congresso internacional ou nacional COM Qualis",
          descricao:"Publicação de artigo completo em congresso internacional ou nacional com critério Qualis da Capes (no ano da publicação)",
          qntAp:  72.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 24,
          nome: "Publicação de artigo completo em congresso internacional SEM Qualis",
          descricao:"Publicação de artigo completo em congresso internacional sem critério Qualis da Capes (no ano da publicação)",
          qntAp:  54.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 25,
          nome: "Publicação de artigo completo em congresso nacional SEM Qualis",
          descricao:"Publicação de artigo completo em congresso nacional sem critério Qualis da Capes (no ano da publicação)",
          qntAp:  36.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 26,
          nome: "Publicação de artigo resumido em congresso internacional ou nacional COM Qualis",
          descricao:"Publicação de artigo completo em congressointernacional ou nacional com critério Qualis da Capes (no ano da publicação)",
          qntAp:  36.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 27,
          nome: "Publicação de artigo resumido em congresso internacional SEM Qualis",
          descricao:"Publicação de artigo completo em congresso internacional sem critério Qualis da Capes (no ano da publicação)",
          qntAp:  27.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 28,
          nome: "Publicação de artigo resumido em congresso nacional SEM Qualis",
          descricao:"Publicação de artigo resumido em congresso nacional sem critério Qualis da Capes (no ano da publicação)",
          qntAp:  18.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 29,
          nome: "Publicação de resumo em encontro universitários",
          descricao:"Publicação de resumos em encontros universitários",
          qntAp:  4.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 30,
          nome: "Publicação de resumo estendido em encontros universitários",
          descricao:"Publicação de resumos estentidos em encontros universitários",
          qntAp:  4.0, medida: Unidade.QUANTIDADE,grupo: 5),
      Categoria(
          id: 31,
          nome: "Patente ou registro de software",
          descricao:"Patente ou registro de software",
          qntAp:  96.0,medida: Unidade.QUANTIDADE,grupo: 5),
    ],
    maxAp: 96
);
final Grupo grupo6 =
Grupo(
    id:6,
    descricao: "Vivências de gestão",
    categorias: [
      Categoria(
          id: 32,
          nome: "Participação   na   diretoria   de   empresa   júnior",
          descricao:"Participação   na   diretoria   de   empresa   júnior,   como   presidente   e   vice-presidente   ou diretor",
          qntAp:  48 * 1/6, medida: Unidade.MESES,grupo: 6),
      Categoria(
          id: 33,
          nome: "Participação na empresa júnior",
          descricao:"Participação na empresa júnior em qualquer função exeto diretoria",
          qntAp:  48 * 1/6, medida: Unidade.MESES,grupo: 6),
      Categoria(
          id: 34,
          nome: "Diretoria do centro acadêmico",
          descricao:"Participação na diretoria do centro acadêmico do curso",
          qntAp:  2.0, medida: Unidade.QUANTIDADE,grupo: 6),
      Categoria(
          id: 35,
          nome: "Representante estudantil no colegiado de coordenação de curso, departamental e conselho de centro",
          descricao:" Participação na condição de representante estudantil no colegiado de coordenação de curso, departamental e conselho de centro",
          qntAp:  2.0, medida: Unidade.REUNIAO,grupo: 6),
      Categoria(
          id: 36,
          nome: "Representante estudantil em comissão temporária",
          descricao:"Participação na condição de representante estudantil em comissão temporária",
          qntAp:  1.0, medida: Unidade.REUNIAO,grupo: 6),
    ],
    maxAp: 48
);

final Grupo grupo7 =
Grupo(
    id:7,
    descricao: "Outras atividades",
    categorias: [
      Categoria(
          id: 37,
          nome: "Voluntariado em prol da sociedade",
          descricao:"Participação em atividade de voluntariado em prol da sociedade",
          qntAp:  0.5, medida: Unidade.QUANTIDADE,grupo: 7),
      Categoria(
          id: 38,
          nome: "Curso de língua estrangeira",
          descricao:"Curso de língua estrangeira",
          qntAp:  0.5, medida: Unidade.QUANTIDADE,grupo: 7),
      Categoria(
          id: 39,
          nome: "Grupos de estudo",
          descricao:"Participação em grupos de estudo, sob a responsabilidade de um professor ou de ciência da Coordenação de curso",
          qntAp:  0.5, medida: Unidade.QUANTIDADE,grupo: 7),
      Categoria(
          id: 40,
          nome: "Células   de   estudo   do   Programa   de  Aprendizagem   Cooperativa",
          descricao:"Participação   em   células   de   estudo   do   Programa   de  Aprendizagem   Cooperativa   em Células Estudantis",
          qntAp:  1/3, medida: Unidade.QUANTIDADE,grupo: 7),
      Categoria(
          id: 41,
          nome: "Palestras e/ou cursos sobre temas importantes para a sociedade",
          descricao:"Participação em palestras e/ou cursos sobre temas importantes para a sociedade, como acessibilidade, TI verde, dengue e outras doenças transmitidas pelo Aedes Aegypti, educação ambiental, direitos humanos, relações étnico-raciais e africanidades, dentre outros.",
          qntAp: 0.5, medida: Unidade.REUNIAO,grupo: 7),
    ],
    maxAp: 48
);
List<Grupo> groups = [grupo1,grupo2,grupo3,grupo4,grupo5,grupo6,grupo7];

Categoria getCategoria(int idCategoria){
      for(Grupo grupo in groups){
            for(Categoria categoria in grupo.categorias){
                  if(categoria.id == idCategoria){
                      return categoria;
                  }
            }
      }
      return null;
}