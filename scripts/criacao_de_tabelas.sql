CREATE TABLE endereco (
        cep VARCHAR(8) NOT NULL,
        complemento VARCHAR(70),
        rua VARCHAR(30),
        numero INTEGER,
        bairro VARCHAR(30),
        cidade VARCHAR(30),
        PRIMARY KEY (cep)
);

CREATE TABLE pessoa (
        cpf VARCHAR(11) NOT NULL,
        endereco_cep VARCHAR(8) NOT NULL, --FK
        nome VARCHAR(50),
        sexo CHAR(1),
        idade INTEGER,
        email VARCHAR(50),        
        telefone VARCHAR(15),
        PRIMARY KEY (cpf)
);

CREATE TABLE paciente (
        id SERIAL NOT NULL,
        pessoa_cpf VARCHAR(11) NOT NULL, --FK
        covid19 BOOLEAN,
        coriza BOOLEAN,
        diarreia BOOLEAN,
        temperatura NUMERIC(3,1),
        febre BOOLEAN,
        dorDeGarganta BOOLEAN,
        dificuldadeRespiratoria BOOLEAN,
        PRIMARY KEY (id)
);

CREATE TABLE usuario (
        login VARCHAR(15) NOT NULL,
        pessoa_cpf VARCHAR(11), --FK
        senha VARCHAR(30),
        ativo BOOLEAN,
        PRIMARY KEY (login)
);

CREATE TABLE unidadeSaude_usuario (
        usuario_login VARCHAR(15) NOT NULL, --FK
        unidade_id INTEGER NOT NULL, --FK
        PRIMARY KEY (usuario_login, unidade_id)
);

CREATE TABLE unidadeSaude (
        id SERIAL NOT NULL,
        nome VARCHAR(50),
        email VARCHAR(50), 
        municipio VARCHAR(30),
        tipo_unidade VARCHAR(30),
        qtd_respiradores INTEGER,
        qtd_respiradores_disponiveis INTEGER,
        PRIMARY KEY (id)
);

CREATE TABLE leito (
        id SERIAL NOT NULL,
        unidade_id SERIAL NOT NULL, --FK
        tipo VARCHAR(30), 
        situacao VARCHAR(30),
        motivo_bloqueio VARCHAR(100),
        cod_referencia VARCHAR(20),
        PRIMARY KEY (id)
);

CREATE TABLE leito_internacao (
        leito_id INTEGER NOT NULL, --FK
        internacao_id INTEGER NOT NULL, --FK
        PRIMARY KEY (leito_id, internacao_id)
);

CREATE TABLE internacao (
        id SERIAL NOT NULL,
        paciente_id SERIAL NOT NULL, --FK
        situacao VARCHAR(30),
        diagnostico VARCHAR(30),
        motivo_liberacao VARCHAR(100),
        data_entrada DATE,
        data_liberacao DATE,
        PRIMARY KEY (id)
);


ALTER TABLE pessoa ADD CONSTRAINT pessoa_endereco_fk FOREIGN KEY (endereco_cep) REFERENCES endereco(cep);
ALTER TABLE paciente ADD CONSTRAINT paciente_pessoa_fk FOREIGN KEY (pessoa_cpf) REFERENCES pessoa(cpf);
ALTER TABLE usuario ADD CONSTRAINT usuario_pessoa_fk FOREIGN KEY (pessoa_cpf) REFERENCES pessoa(cpf);
ALTER TABLE unidadeSaude_usuario ADD CONSTRAINT usuario_login_fk FOREIGN KEY (usuario_login) REFERENCES usuario(login);
ALTER TABLE unidadeSaude_usuario ADD CONSTRAINT unidadeSaude_id_fk FOREIGN KEY (unidade_id) REFERENCES unidadeSaude(id);
ALTER TABLE leito ADD CONSTRAINT leito_unidadeSaude_fk FOREIGN KEY (unidade_id) REFERENCES unidadeSaude(id);
ALTER TABLE leito_internacao ADD CONSTRAINT leito_id_fk FOREIGN KEY (leito_id) REFERENCES leito(id);
ALTER TABLE leito_internacao ADD CONSTRAINT internacao_id_fk FOREIGN KEY (internacao_id) REFERENCES internacao(id);
ALTER TABLE internacao ADD CONSTRAINT internacao_paciente_fk FOREIGN KEY (paciente_id) REFERENCES paciente(id);