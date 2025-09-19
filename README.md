<img src='https://sigarra.up.pt/feup/pt/imagens/LogotipoSI' width="30%"/>

<h3 align="center">Licenciatura em Engenharia Informática e Computação<br> L.EIC012 - Bases de Dados<br> 2024/2025 </h3>

---
<h3 align="center"> Colaboradores &#129309 </h2>

<div align="center">

| Nome               | Número      |
|--------------------|-------------|
| Elton Vaz          | up202309925 |
| Henrique Vilarinho | up202307037 |
| Tomás Morais       | up202304692 |

Nota : 15,6

</div>

## Project Report

To see the full report click here: <a href="reports/901_1ªSubmissão.pdf">First Report</a>  &  <a href="reports/901_2ªSubmissão.pdf">Second Report</a>

**UML Diagram:**

<img width="1274" height="800" alt="Captura de ecrã de 2025-09-17 11-27-35" src="https://github.com/user-attachments/assets/f1ecd6e8-78d3-4aac-bebf-234f0eaf0896" />

**Relational Schema:**

Escola (<ins>IDEscola</ins>, Nome, Morada, CodigoPostal, AlvaraDeFuncionamento)

Instrutor(<ins>IDInstrutor</ins>,Nome,DataDeNascimento,NIF,NumeroCartaoCidadao, CodigoPostal, Morada, LicencaDeInstrucao,IDEscola-->Escola,IDCarta-->CartadeConducao)

Proprietario (<ins>IDInstrutor</ins>-->Instrutor, <ins>IDEscola</ins>-->Escola, Proprietario ?)

Veiculo (<ins>IDVeiculo</ins>, Matricula, Marca, NumeroKmPercorridos,DataDeInspecao, Seguro, IDEscola-->Escola, IDInstrutor-->Instrutor,IDCategoria-->Categoria)

Categoria (<ins>IDCategoria</ins>, Designacao)

CategoriaCarta (<ins>IDCarta</ins>-->CartaDeConducao, <ins>IDCategoria</ins>-->Categoria)

CartaDeConducao (<ins>IDCarta</ins>, Numero, DataDeEmissao)

Percurso (<ins>IDPercurso</ins>, Nome, Perimetro, PontoDeTroca)

Examinador(<ins>IDExaminador</ins>,Nome,DataDeNascimento,NIF,CartaoCidadao,CodigoPostal, Morada, CredencialDeExaminador,IDCarta-->CartaDeConducao)

Examinando (<ins>IDExaminando</ins>, Nome, DataDeNascimento, NIF,NumeroCartaoCidadao, CodigoPostal, Morada, LicencaDeAprendizagem,IDEscola-->Escola, IDInstrutor-->Instrutor)

Exame (<ins>IDExame</ins>, Data, Hora, IDExaminando--> Examinando,IDExaminador-->Examinador, IDPercurso-->Percurso)

Aprovacao (<ins>IDAprovacao</ins>,Duracao, Avaliacao, Ordem, <ins>IDExaminando</ins>-->Examinando, <ins>IDExame</ins>-->Exame,IDCarta-->CartaDeConducao)

Reprovacao (<ins>IDReprovacao</ins>,Duracao, Motivo, Ordem, <ins>IDExaminando</ins>-->Examinando, <ins>IDExame</ins>-->Exame)
 
&#x26A0 **Disclaimer:** This project had originally two "create" and two "populate" files, with the difference being that one included the use of generative AI. To simplify, only oe of the versions was included in this repository.
