DB_HOST = "127.0.0.1"
DB_NAME = "projeto_BD"
DB_USER = "postgres"
DB_PASS = "admin"

import psycopg2
import psycopg2.extras

conn = psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)

# Verificação das consultas
with conn:
    with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        
        print("1. QUANTOS PACIENTES FORAM INFECTADOS COM COVID 19 EM PARNAMIRIM?")

        cur.execute("SELECT COUNT(*)  AS PacientesCovid19Parnamirim FROM public.paciente AS pac \
        LEFT JOIN public.pessoa AS pes ON pes.cpf = pac.pessoa_cpf \
        LEFT JOIN public.endereco AS ende ON ende.cep = pes.endereco_cep \
        WHERE pac.covid19 = TRUE AND ende.cidade = 'Parnamirim'")

        print(cur.fetchall())

        print("2. QUANTOS LEITOS LIVRES POSSUO NA CIDADE NATAL?")

        cur.execute("SELECT COUNT(*) AS LeitosLivresNatal FROM public.leito AS lei \
        LEFT JOIN public.unidadesaude AS uni ON uni.id = lei.unidade_id  \
        WHERE lei.situacao = 'LIVRE' AND uni.municipio = 'Natal'")

        print(cur.fetchall())

        print("3. QUANTOS PACIENTES VIERAM A ÓBITO COM COVID19 EM PARNAMIRIM?")

        cur.execute("SELECT COUNT(*) FROM public.internacao AS inte \
            LEFT JOIN public.paciente AS pac ON pac.id = inte.paciente_id \
            LEFT JOIN public.pessoa AS pes ON pes.cpf = pac.pessoa_cpf \
            LEFT JOIN public.endereco AS ende ON ende.cep = pes.endereco_cep \
            WHERE pac.covid19 = TRUE AND ende.cidade = 'Parnamirim' AND \
            inte.motivo_liberacao like '%BITO'")
        
        print(cur.fetchall())

        print("4. QUANTOS PACIENTES FORAM LIBERADOS APÓS SEREM INFECTADOS COM COVID19")

        cur.execute("SELECT COUNT(*) FROM public.internacao AS inte \
            LEFT JOIN public.paciente AS pac ON pac.id = inte.paciente_id \
            LEFT JOIN public.pessoa AS pes ON pes.cpf = pac.pessoa_cpf \
            LEFT JOIN public.endereco AS ende ON ende.cep = pes.endereco_cep \
            WHERE pac.covid19 = TRUE AND ende.cidade = 'Parnamirim' AND \
            inte.motivo_liberacao IS NOT NULL")
        
        print(cur.fetchall())

        print("5. LISTA DE BAIRRO QUE MAIS OCORRERAM CASOS DE COVID 19")

        cur.execute("SELECT ende.bairro, COUNT(ende.bairro) AS QuantidadeCasos \
            FROM public.internacao AS inte \
            LEFT JOIN public.paciente AS pac ON pac.id = inte.paciente_id \
            LEFT JOIN public.pessoa AS pes ON pes.cpf = pac.pessoa_cpf \
            LEFT JOIN public.endereco AS ende ON ende.cep = pes.endereco_cep \
            WHERE pac.covid19 = TRUE GROUP BY ende.bairro ORDER BY COUNT(ende.bairro) DESC")
        
        print(cur.fetchall())

        print("6. QUAIS OS NOMES E A QUANTIDADE DE RESPIRADORES DISPONÍVEIS DAS UNIDADES DE SAÚDE QUE \
             POSSUEM MAIS RESPIRADORES DISPONÍVEIS DO QUE AS UNIDADES DE PARNAMIRIM?")

        cur.execute("SELECT nome, qtd_respiradores_disponiveis \
            FROM unidadesaude \
            WHERE qtd_respiradores_disponiveis > ALL (SELECT qtd_respiradores_disponiveis \
	        FROM unidadesaude WHERE municipio = 'Parnamirim')")
        
        print(cur.fetchall())

        print("7. RECUPERAR NOMES DE PACIENTES QUE POSSUEM FEBRE E DIFICULDADE RESPIRATÓRIA")

        cur.execute("SELECT nome FROM pessoa AS p WHERE EXISTS (SELECT * FROM paciente AS pac \
	        WHERE p.cpf = pac.pessoa_cpf AND febre = TRUE AND dificuldaderespiratoria = TRUE)")
        
        print(cur.fetchall())

        print("8. RECUPERAR NOMES DAS PESSOAS QUE NÃO POSSUEM DIFICULDADE RESPIRATÓRIA")

        cur.execute("SELECT nome FROM pessoa AS p WHERE NOT EXISTS (SELECT * FROM paciente AS pac \
	        WHERE pac.pessoa_cpf = p.cpf AND dificuldaderespiratoria = TRUE)")
        
        print(cur.fetchall())

        print("9. RECUPERAR ID E NOMES DE UNIDADES DE SAÚDE QUE NÃO POSSUEM LEITOS CADASTRADOS")

        cur.execute("SELECT id, nome FROM unidadesaude AS unid WHERE id NOT IN ( SELECT unidade_id \
            FROM leito)")
        
        print(cur.fetchall())

        print("10. RECUPERAR NOMES DE PESSOAS CADASTRADAS QUE MORAM NO BAIRRO NOVA PARNAMIRIM")

        cur.execute("SELECT nome FROM pessoa WHERE endereco_cep IN \
        (SELECT cep FROM endereco WHERE bairro = 'Nova Parnamirim')")
        
        print(cur.fetchall())

        print("11. QUAL O NOME E O MUNICÍPIO DAS UNIDADES DE SAÚDE QUE LIBERARAM PACIENTES?")

        cur.execute("SELECT unid.nome, unid.municipio FROM unidadesaude as unid WHERE unid.id IN( \
	        SELECT DISTINCT unid.id FROM unidadesaude AS unid \
	        INNER JOIN leito AS l ON unid.id = l.unidade_id \
	        RIGHT JOIN leito_internacao AS lin ON lin.leito_id = l.id \
	        RIGHT JOIN internacao AS i ON i.id = lin.internacao_id \
	        WHERE (i.motivo_liberacao not like '%BITO'))")
        
        print(cur.fetchall())

        # Criando visões
        print("VISÂO PARA VERIFICAR PESSOAS COM COVID")

        #cur.execute("CREATE VIEW PessoasComCovid AS \
        #    SELECT pes.nome,pes.sexo,pes.idade, pes.cpf FROM public.paciente AS pac \
        #    LEFT JOIN public.pessoa AS pes ON pes.cpf = pac.pessoa_cpf WHERE pac.covid19=TRUE")

        cur.execute("SELECT * FROM PessoasComCovid WHERE sexo = 'M'")
        
        print(cur.fetchall())

        print("VISÂO PARA VERIFICAR LEITOS DO MUNICÍPIO DE NATAL")

        #cur.execute("CREATE VIEW LeitosCidadeNatal AS \
        #    SELECT uni.nome, uni.municipio, lei.cod_referencia, lei.tipo, lei.situacao \
        #    FROM  public.leito AS lei \
        #    LEFT JOIN public.unidadesaude AS uni ON uni.id = lei.unidade_id \
        #    WHERE uni.municipio = 'Natal'")

        cur.execute("SELECT * FROM LeitosCidadeNatal")
        
        print(cur.fetchall())

conn.close()