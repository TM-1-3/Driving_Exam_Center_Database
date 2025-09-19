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

**UML Diagram:**

<img width="1274" height="800" alt="Captura de ecrã de 2025-09-17 11-27-35" src="https://github.com/user-attachments/assets/f1ecd6e8-78d3-4aac-bebf-234f0eaf0896" />

**Relational Schema:**

Escola (~IDEscola~, Nome, Morada, CodigoPostal, AlvaraDeFuncionamento)

Instrutor(IDInstrutor,Nome,DataDeNascimento,NIF,NumeroCartaoCidadao, CodigoPostal, Morada, LicencaDeInstrucao,IDEscola-->Escola,IDCarta-->CartadeConducao)

Proprietario (IDInstrutor-->Instrutor, IDEscola-->Escola, Proprietario ?)

Veiculo (IDVeiculo, Matricula, Marca, NumeroKmPercorridos,DataDeInspecao, Seguro, IDEscola-->Escola, IDInstrutor-->Instrutor,IDCategoria-->Categoria)

Categoria (IDCategoria, Designacao)

CategoriaCarta (IDCarta-->CartaDeConducao, IDCategoria-->Categoria)

CartaDeConducao (IDCarta, Numero, DataDeEmissao)

Percurso (IDPercurso, Nome, Perimetro, PontoDeTroca)

Examinador(IDExaminador,Nome,DataDeNascimento,NIF,CartaoCidadao,CodigoPostal, Morada, CredencialDeExaminador,IDCarta-->CartaDeConducao)

Examinando (IDExaminando, Nome, DataDeNascimento, NIF,NumeroCartaoCidadao, CodigoPostal, Morada, LicencaDeAprendizagem,IDEscola-->Escola, IDInstrutor-->Instrutor)

Exame (IDExame, Data, Hora, IDExaminando--> Examinando,IDExaminador-->Examinador, IDPercurso-->Percurso)

Aprovacao (IDAprovacao,Duracao, Avaliacao, Ordem, IDExaminando-->Examinando, IDExame-->Exame,IDCarta-->CartaDeConducao)

Reprovacao (IDReprovacao,Duracao, Motivo, Ordem, IDExaminando-->Examinando, IDExame-->Exame)
