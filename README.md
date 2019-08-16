# ProjetoESI

[![Build Status](https://travis-ci.com/Zimmerr/ProjetoESI.svg?branch=master)](https://travis-ci.com/Zimmerr/ProjetoESI)
[![Maintainability](https://api.codeclimate.com/v1/badges/002e6204c3ece91011a9/maintainability)](https://codeclimate.com/github/Zimmerr/ProjetoESI/maintainability)

Integrantes do Projeto:\
Anderson Pereira Barbosa\
Fernando Gardin Casarotto\
Luis Henrique Zimmermann\
Piero Acosta Desenzi

## Proposta
Criação de um sistema de gerenciamento de projetos. Nele, existem os conceitos de "usuário" e "projeto". Usuários poderão ser membros de Projetos, numa relação N para N. Cada Projeto será uma rede de componentes que poderão ser usados por Usuários, mas os usuários que tenham a atribuição Responsável pelo Projeto possuem maior poder para manipular os componentes.
Os componentes que compõe um Projeto incluem agenda, centrais de mensagens análogas a fórums, histórico, etc. O principal componente de um Projeto é a sequência de Tarefas - cada tarefa com data de início, prazo, membros, histórico de ações, etc. Os Usuários podem escrever registros de atividade nas tarefas atribuídas a eles, com informações como data de conclusão da ação, descrição, observações, e o quanto da Tarefa está concluída (em porcentagem) a partir do fim da ação registrada. Além disso, um Usuário Responsável por um Projeto pode criar e deletar Tarefas, adicionar ou remover usuários das Tarefas, mudar datas das Tarefas, etc