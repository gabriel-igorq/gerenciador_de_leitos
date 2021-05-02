BEGIN;

--INSERINDO ENDERECO
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59014560', '', 'Rua joao lindolfo', '782', 'Tirol' , 'Natal');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59151560', '', 'Rua Praia de Tibau', '72', 'Nova Parnamirim' , 'Parnamirim');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade)
	VALUES ('59023020', '', 'Rua Bernardo Vieira', '56', 'Lagoa Nova' , 'Natal');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59151250', '', 'Avenida Abel Cabral', '92', 'Nova Parnamirim' , 'Parnamirim');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59151460', '', 'Rua Praia de Cotovelo', '165', 'Nova Parnamirim' , 'Parnamirim');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59012050', '', 'Avenida Tavares de Lira', '56', 'Ribeira' , 'Natal');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59021256', '', 'Avenida Hermes da Fonseca', '66', 'Lagoa Nova' , 'Natal');
INSERT INTO public.endereco( cep, complemento, rua, numero, bairro, cidade) 
	VALUES ('59154356', '', 'Avenida Romualdo Galvão', '156', 'Tirol' , 'Natal');
	
--INSERINDO PESSOAS
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('70875454429', '59014560', 'Victor Hugo Freire Ramalho', 'M', 23 , 'vale1c@ufrn.edu.br','996887495');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('52201489752', '59151250', 'Victor Matheus Andrade', 'M', 29 , 'vale2c@ufrn.edu.br','996555295');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('16985214723', '59151250', 'Harley Santos Pereira', 'F', 25 , 'vale3c@ufrn.edu.br','991235295');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('23658974102', '59151250', 'Gabriel Cardoso Melita', 'M', 26 , 'vale4c@ufrn.edu.br','996888755');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('78458625410', '59012050', 'Valerio Hugo Vale ', 'M', 22 , 'vale5c@ufrn.edu.br','996885282');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('52469871236', '59012050', 'Gabriela Ramalho', 'F', 21 , 'vale6c@ufrn.edu.br','996889895');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('21453874529', '59151460', 'Hugo Freire', 'M', 19 , 'vale7c@ufrn.edu.br','996887458');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('52486574289', '59151460', 'Ramalho Albuquerque', 'M', 53 , 'vale8c@ufrn.edu.br','996885222');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('41782345587', '59021256', 'Marcia Jacyntha Nunes Rodrigues Lucena', 'F', 38 , 'vale9c@ufrn.edu.br','996885245');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('21458763254', '59021256', 'Clecia Alves Freire', 'M', 24 , 'vale110c@ufrn.edu.br','996885287');
INSERT INTO public.pessoa( cpf, endereco_cep, nome, sexo, idade, email, telefone) 
	VALUES ('54975230012', '59023020', 'Ricardo Janailton Pinto', 'M', 28 , 'vale11c@ufrn.edu.br','996885522');
	
--INSERINDO PACIENTES
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('70875454429', TRUE, TRUE, TRUE , 35.8,TRUE,FALSE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('52201489752', TRUE, TRUE, TRUE , 36.5,FALSE,TRUE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('16985214723', TRUE, TRUE, TRUE , 39.1,FALSE,TRUE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('23658974102', TRUE, TRUE, TRUE , 36.3,TRUE,TRUE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('78458625410', TRUE, TRUE, TRUE , 36.1,FALSE,TRUE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('52469871236', TRUE, TRUE, TRUE , 35.7,TRUE,TRUE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('21453874529', TRUE, TRUE, TRUE , 37.7,FALSE,FALSE,FALSE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('52486574289', TRUE, TRUE, TRUE , 37.1,TRUE,TRUE,FALSE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('41782345587', TRUE, TRUE, TRUE , 39.7,FALSE,TRUE,TRUE);
INSERT INTO public.paciente(pessoa_cpf, covid19, coriza, diarreia, temperatura, febre, dordegarganta, dificuldaderespiratoria) 
	VALUES ('54975230012', TRUE, TRUE, TRUE , 35.7,TRUE,FALSE,TRUE);
	
--INSERINDO UNIDADES DE SAUDE
INSERT INTO public.unidadesaude(nome, email, municipio, tipo_unidade, qtd_respiradores,qtd_respiradores_disponiveis) 
	VALUES ('Unidade Basica de Saude Sao Joao', 'ubssaojoao@gov.rn.br', 'Natal', 'MUNICIPAL' , 10,5);
INSERT INTO public.unidadesaude(nome, email, municipio, tipo_unidade, qtd_respiradores,qtd_respiradores_disponiveis) 
	VALUES ('Unidade Basica de Saude Sao Paulo', 'ubssaopaulo@gov.rn.br', 'Natal', 'MUNICIPAL' , 19,6);
INSERT INTO public.unidadesaude(nome, email, municipio, tipo_unidade, qtd_respiradores,qtd_respiradores_disponiveis) 
	VALUES ('Unidade Basica de Saude Sao Matheus', 'ubssaomatheus@gov.rn.br', 'Parnamirim', 'MUNICIPAL' , 12,4);
INSERT INTO public.unidadesaude(nome, email, municipio, tipo_unidade, qtd_respiradores,qtd_respiradores_disponiveis) 
	VALUES ('Unidade Basica de Saude Sao Judas', 'ubssaojudas@gov.rn.br', 'Natal', 'MUNICIPAL' , 15,9);
INSERT INTO public.unidadesaude(nome, email, municipio, tipo_unidade, qtd_respiradores,qtd_respiradores_disponiveis) 
	VALUES ('Unidade Basica de Saude Sao Lucas', 'ubssaolucas@gov.rn.br', 'Parnamirim', 'MUNICIPAL' , 11,7);
INSERT INTO public.unidadesaude(nome, email, municipio, tipo_unidade, qtd_respiradores,qtd_respiradores_disponiveis) 
	VALUES ('Unidade Basica de Saude Sao Luiz', 'ubssaoluiz@gov.rn.br', 'Natal', 'MUNICIPAL' , 14,6);
	
--INSERINDO LEITOS
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (1, 'INTENSIVO', 'OCUPADO', '' , '1A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (1, 'INTENSIVO', 'OCUPADO', '' , '2A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (1, 'SEMIINTENSIVO', 'LIVRE', '' , '3A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (2, 'INTENSIVO', 'OCUPADO', '' , '7A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (2, 'INTENSIVO', 'LIVRE', '' , '9A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (2, 'SEMIINTENSIVO', 'OCUPADO', '' , '4A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (3, 'INTENSIVO', 'LIVRE', '' , '5A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (3, 'SEMIINTENSIVO', 'OCUPADO', '' , '7A');
INSERT INTO public.leito(unidade_id, tipo, situacao, motivo_bloqueio, cod_referencia) 
	VALUES (3, 'INTENSIVO', 'LIVRE', '' , '10A');
	
--INSERINDO INTERNACAO
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (1, 'OCUPADO', 'Suspeita de covid19' , 'Estável e sem taxa de transmissao','2021-01-02','2021-01-12');
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (2, 'OCUPADO', 'Suspeita de covid19' , null,'2021-01-02',null);
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (3, 'OCUPADO', 'Suspeita de covid19' , 'Estável e sem taxa de transmissao','2021-01-03','2021-01-13');
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (4, 'OCUPADO', 'Suspeita de covid19' , null,'2021-01-05',null);
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (5, 'OCUPADO', 'Suspeita de covid19' , null,'2021-02-02',null);
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (6, 'OCUPADO', 'Suspeita de covid19' , null,'2021-03-12',null);
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (7, 'OCUPADO', 'Suspeita de covid19' , 'ÓBITO','2021-04-19','2021-04-25');
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (9, 'OCUPADO', 'Suspeita de covid19' , null,'2021-02-11',null);
INSERT INTO public.internacao(paciente_id, situacao, diagnostico, motivo_liberacao,data_entrada,data_liberacao) 
	VALUES (10, 'OCUPADO', 'Suspeita de covid19' , null,'2021-02-12',null);
	
--INSERINDO USUARIO
INSERT INTO public.usuario( login, pessoa_cpf, senha, ativo) 
	VALUES ('vale1c', '70875454429', 'f2123lapkqnoaismxp293md21lsk' , TRUE);

--RELACIONANDO USUARIO A UNIDADE DE SAUDE
INSERT INTO public.unidadesaude_usuario( usuario_login, unidade_id) 
	VALUES ('vale1c', 6);
INSERT INTO public.unidadesaude_usuario( usuario_login, unidade_id) 
	VALUES ('vale1c', 5);
INSERT INTO public.unidadesaude_usuario( usuario_login, unidade_id) 
	VALUES ('vale1c', 4);
INSERT INTO public.unidadesaude_usuario( usuario_login, unidade_id) 
	VALUES ('vale1c', 3);
INSERT INTO public.unidadesaude_usuario( usuario_login, unidade_id) 
	VALUES ('vale1c', 2);
INSERT INTO public.unidadesaude_usuario( usuario_login, unidade_id) 
	VALUES ('vale1c', 1);
	
--RELACIONANDO INTERNACAO COM OS LEITOS
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (1, 1);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (2,2);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (3,3);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (4,4);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (5,5);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (6,6);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (7,7);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (8,8);
INSERT INTO public.leito_internacao( leito_id, internacao_id) 
	VALUES (9,9);
	
COMMIT;
ROLLBACK;