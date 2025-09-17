PRAGMA foreign_keys=ON;

DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria(
    IDCategoria INTEGER NOT NULL,
    Designacao VARCHAR(3) NOT NULL DEFAULT('B') CHECK(Designacao IN ('A','A1','A2','AM','B','B1','C','C1','D','D1','BE','C1E','CE','D1E','DE','T')),
    PRIMARY KEY(IDCategoria)
);

DROP TABLE IF EXISTS CartaDeConducao;

CREATE TABLE CartaDeConducao(
    IDCarta INTEGER NOT NULL, 
    Numero INTEGER NOT NULL CHECK(Numero>=100000000 && Numero<=999999999),
    DataDeEmissao DATE NOT NULL,
    PRIMARY KEY(IDCarta)
);

DROP TABLE IF EXISTS CategoriaCarta;

CREATE TABLE CategoriaCarta(
    IDCarta INTEGER,
    IDCategoria INTEGER,
    PRIMARY KEY(IDCarta,IDCategoria),
    FOREIGN KEY(IDCarta) REFERENCES CartaDeConducao(IDCarta) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDCategoria) REFERENCES Categoria(IDCategoria) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Escola;

CREATE TABLE Escola(
    IDEscola INTEGER NOT NULL,
    Nome TEXT NOT NULL,
    Morada TEXT NOT NULL,
    CodigoPostal TEXT NOT NULL CHECK(LENGTH(CodigoPostal)=8 AND SUBSTR(CodigoPostal,1,4) GLOB '[0-9][0-9][0-9][0,9]' AND SUBSTR(CodigoPostal,5,1) GLOB '-' AND SUBSTR(CodigoPostal,6,3) GLOB '[0-9][0-9][0-9]'),
    AlvaraDeFuncionamento TEXT NOT NULL,
    PRIMARY KEY(IDEscola)
);

DROP TABLE IF EXISTS Instrutor;

CREATE TABLE Instrutor(
    IDInstrutor INTEGER NOT NULL,
    IDEscola INTEGER,
    IDCarta INTEGER,
    Nome TEXT NOT NULL,
    DatadeNascimento DATE NOT NULL CHECK(DatadeNascimento<=('now','-21 years')),
    NIF INTEGER NOT NULL CHECK(NIF>=100000000 AND NIF<=299999999),
    CartaoDeCidadao INTEGER NOT NULL CHECK(CartaoDeCidadao>=10000000 AND CartaoDeCidadao<=99999999),
    CodigoPostal TEXT NOT NULL CHECK(LENGTH(CodigoPostal)=8 AND SUBSTR(CodigoPostal,1,4) GLOB '[0-9][0-9][0-9][0,9]' AND SUBSTR(CodigoPostal,5,1) = '-' AND SUBSTR(CodigoPostal,6,3) GLOB '[0-9][0-9][0-9]'),
    Morada TEXT NOT NULL,
    LicencaDeInstrucao TEXT NOT NULL,
    PRIMARY KEY(IDInstrutor),
    FOREIGN KEY(IDEscola) REFERENCES Escola(IDEscola) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDCarta) REFERENCES CartaDeConducao(IDCarta) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Examinando;

CREATE TABLE Examinando(
    IDExaminando INTEGER NOT NULL,
    IDInstrutor INTEGER,
    IDEscola INTEGER,
    Nome TEXT NOT NULL,
    DatadeNascimento DATE NOT NULL CHECK(DatadeNascimento<=('now','-18 years')),
    NIF INTEGER NOT NULL CHECK(NIF>=100000000 AND NIF<=299999999),
    CartaoDeCidadao INTEGER NOT NULL CHECK(CartaoDeCidadao>=10000000 AND CartaoDeCidadao<=99999999),
    CodigoPostal TEXT NOT NULL CHECK(LENGTH(CodigoPostal)=8 AND SUBSTR(CodigoPostal,1,4) GLOB '[0-9][0-9][0-9][0,9]' AND SUBSTR(CodigoPostal,5,1) = '-' AND SUBSTR(CodigoPostal,6,3) GLOB '[0-9][0-9][0-9]'),
    Morada TEXT NOT NULL,
    LicencaDeAprendizagem TEXT NOT NULL,
    PRIMARY KEY(IDExaminando),
    FOREIGN KEY(IDInstrutor) REFERENCES Instrutor(IDInstrutor) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDEscola) REFERENCES Escola(IDEscola) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Examinador;

CREATE TABLE Examinador(
    IDExaminador INTEGER NOT NULL,
    IDCarta INTEGER,
    Nome TEXT NOT NULL,
    DatadeNascimento DATE NOT NULL CHECK(DatadeNascimento<=('now','-25 years')),
    NIF INTEGER NOT NULL CHECK(NIF>=100000000 AND NIF<=299999999),
    CartaoDeCidadao INTEGER NOT NULL CHECK(CartaoDeCidadao>=10000000 AND CartaoDeCidadao<=99999999),
    CodigoPostal TEXT NOT NULL CHECK(LENGTH(CodigoPostal)=8 AND SUBSTR(CodigoPostal,1,4) GLOB '[0-9][0-9][0-9][0,9]' AND SUBSTR(CodigoPostal,5,1) = '-' AND SUBSTR(CodigoPostal,6,3) GLOB '[0-9][0-9][0-9]'),
    Morada TEXT NOT NULL,
    CredencialdeExaminador TEXT NOT NULL,
    PRIMARY KEY(IDExaminador),
    FOREIGN KEY(IDCarta) REFERENCES CartaDeConducao(IDCarta) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Proprietario;

CREATE TABLE Proprietario(
    IDEscola INTEGER,
    IDInstrutor INTEGER,
    Proprietario BOOLEAN,
    PRIMARY KEY(IDEscola,IDInstrutor),
    FOREIGN KEY(IDEscola) REFERENCES Escola(IDEscola) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDInstrutor) REFERENCES Instrutor(IDInstrutor) ON DELETE SET NULL ON UPDATE CASCADE
);


DROP TABLE IF EXISTS Veiculo;

CREATE TABLE Veiculo(
    IDVeiculo INTEGER NOT NULL,
    Matricula TEXT NOT NULL CHECK(LENGTH(Matricula)=6 AND ((SUBSTR(Matricula, 1, 2) GLOB '[A-Z][A-Z]' AND SUBSTR(Matricula, 3, 2) GLOB '[0-9][0-9]' AND SUBSTR(Matricula, 5, 2) GLOB '[A-Z][A-Z]') OR (SUBSTR(Matricula, 1, 2) GLOB '[0-9][0-9]' AND SUBSTR(Matricula, 3, 2) GLOB '[A-Z][A-Z]' AND SUBSTR(Matricula, 5, 2) GLOB '[0-9][0-9]') OR (SUBSTR(Matricula, 1, 2) GLOB '[A-Z][A-Z]' AND SUBSTR(Matricula, 3, 2) GLOB '[A-Z][A-Z]' AND SUBSTR(Matricula, 5, 2) GLOB '[0-9][0-9]') OR (SUBSTR(Matricula, 1, 2) GLOB '[0-9][0-9]' AND SUBSTR(Matricula, 3, 2) GLOB '[0-9][0-9]' AND SUBSTR(Matricula, 5, 2) GLOB '[A-Z][A-Z]'))),
    Marca VARCHAR(50) NOT NULL,
    NKMPercorridos INTEGER NOT NULL CHECK(NKMPercorridos>0),
    DataDeInspecao DATE NOT NULL CHECK(DataDeInspecao>=DATE('now','-1 years')),
    Seguro TEXT NOT NULL,
    IDInstrutor INTEGER,
    IDCategoria INTEGER,
    IDEscola INTEGER,
    PRIMARY KEY(IDVeiculo),
    FOREIGN KEY(IDInstrutor) REFERENCES Instrutor(IDInstrutor) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDCategoria) REFERENCES Categoria(IDCategoria) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDEscola) REFERENCES Escola(IDEscola) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Percurso;

CREATE TABLE Percurso(
    IDPercurso INTEGER NOT NULL,
    Nome TEXT NOT NULL,
    Perimetro INTEGER NOT NULL CHECK(Perimetro>0),
    PontoDeTroca TEXT NOT NULL,
    PRIMARY KEY(IDPercurso)
);


DROP TABLE IF EXISTS Exame;

CREATE TABLE Exame(
    IDExame INTEGER NOT NULL,
    IDPercurso INTEGER,
    IDExaminador INTEGER,
    Data DATE NOT NULL CHECK (strftime('%w', Data) BETWEEN '1' AND '5'),
    Hora TIME NOT NULL CHECK (Hora BETWEEN '11:00:00' AND '14:00:00'),
    PRIMARY KEY(IDExame),
    FOREIGN KEY(IDPercurso) REFERENCES Percurso(IDPercurso) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDExaminador) REFERENCES Examinador(IDExaminador) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Aprovacao;

CREATE TABLE Aprovacao(
    IDAprovacao INTEGER NOT NULL,
    IDExaminando INTEGER,
    IDExame INTEGER,
    IDCarta INTEGER,
    Duracao INTEGER NOT NULL CHECK(Duracao>0 AND Duracao<=40),
    Ordem TEXT NOT NULL,
    Avaliacao INTEGER NOT NULL CHECK(Avaliacao>=0 AND Avaliacao<=10),
    PRIMARY KEY(IDAprovacao),
    FOREIGN KEY(IDExaminando) REFERENCES Examinando(IDExaminando) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDExame) REFERENCES Exame(IDExame) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDCarta) REFERENCES CartaDeConducao(IDCarta) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Reprovacao;

CREATE TABLE Reprovacao(
    IDReprovacao INTEGER NOT NULL,
    IDExaminando INTEGER,
    IDExame INTEGER,
    Duracao INTEGER NOT NULL CHECK(Duracao>0 AND Duracao<=40),
    Ordem TEXT NOT NULL,
    Motivo TEXT NOT NULL,
    PRIMARY KEY(IDReprovacao),
    FOREIGN KEY(IDExaminando) REFERENCES Examinando(IDExaminando) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(IDExame) REFERENCES Exame(IDExame) ON DELETE SET NULL ON UPDATE CASCADE
);
