<img src='https://sigarra.up.pt/feup/pt/imagens/LogotipoSI' width="30%"/>

<h3 align="center">Licenciatura em Engenharia Informática e Computação<br> L.EIC012 - Bases de Dados<br> 2024/2025 </h3>

---
<h3 align="center"> Colaboradores &#129309 </h3>

<div align="center">

| Nome              | Número      |
|-------------------|-------------|
| Elton Vaz         | up202309925 |
| Henrique Vilarinho| up202307037 |
| Tomás Morais      | up202304692 |

Nota: 15,6

</div>

# Relatório da Base de Dados Relacional SQLite - Centro de Exames de Condução

Para ver o relatório completo clica aqui: <a href="reports/901_1ªSubmissão.pdf">Primeiro Relatório</a>  &  <a href="reports/901_2ªSubmissão.pdf">Segundo Relatório</a>

* [Diagrama UML](#diagrama-uml) 
* [Esquema Relacional](#esquema-relacional)


## Diagrama UML

<img width="1274" height="800" alt="Captura de ecrã de 2025-09-17 11-27-35" src="https://github.com/user-attachments/assets/f1ecd6e8-78d3-4aac-bebf-234f0eaf0896" />

## Esquema Relacional

Escola (<ins>IDEscola</ins>, Nome, Morada, CodigoPostal, AlvaraDeFuncionamento)

Instrutor(<ins>IDInstrutor</ins>, Nome, DataDeNascimento, NIF, NumeroCartaoCidadao, CodigoPostal, Morada, LicencaDeInstrucao, IDEscola-->Escola, IDCarta-->CartaDeConducao)

Proprietario (<ins>IDInstrutor</ins>-->Instrutor, <ins>IDEscola</ins>-->Escola, Proprietario ?)

Veiculo (<ins>IDVeiculo</ins>, Matricula, Marca, NumeroKmPercorridos, DataDeInspecao, Seguro, IDEscola-->Escola, IDInstrutor-->Instrutor, IDCategoria-->Categoria)

Categoria (<ins>IDCategoria</ins>, Designacao)

CategoriaCarta (<ins>IDCarta</ins>-->CartaDeConducao, <ins>IDCategoria</ins>-->Categoria)

CartaDeConducao (<ins>IDCarta</ins>, Numero, DataDeEmissao)

Percurso (<ins>IDPercurso</ins>, Nome, Perimetro, PontoDeTroca)

Examinador (<ins>IDExaminador</ins>, Nome, DataDeNascimento, NIF, CartaoCidadao, CodigoPostal, Morada, CredencialDeExaminador, IDCarta-->CartaDeConducao)

Examinando (<ins>IDExaminando</ins>, Nome, DataDeNascimento, NIF, NumeroCartaoCidadao, CodigoPostal, Morada, LicencaDeAprendizagem, IDEscola-->Escola, IDInstrutor-->Instrutor)

Exame (<ins>IDExame</ins>, Data, Hora, IDExaminando-->Examinando, IDExaminador-->Examinador, IDPercurso-->Percurso)

Aprovacao (<ins>IDAprovacao</ins>, Duracao, Avaliacao, Ordem, <ins>IDExaminando</ins>-->Examinando, <ins>IDExame</ins>-->Exame, IDCarta-->CartaDeConducao)

Reprovacao (<ins>IDReprovacao</ins>, Duracao, Motivo, Ordem, <ins>IDExaminando</ins>-->Examinando, <ins>IDExame</ins>-->Exame)
 
<h3>&#x26A0 Aviso:</h3> Este projeto tinha originalmente dois ficheiros de "create" e dois ficheiros de "populate", sendo que um deles incluía a utilização de IA generativa. Para simplificar, apenas uma das versões foi incluída neste repositório.
