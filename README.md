# Gerenciador de Leitos
Desenvolvimento de sistema para gerenciamento de leitos com base em projeto desenvolvido para a disciplina IMD0401 - Banco de Dados

## 1. Visão do Sistema
Tradicionalmente, a motivação para o uso de Tecnologias da Informação e Comunicação (TIC) no sistema de saúde é oferecer soluções promissoras para a entrega eficiente de todos os tipos de serviços médicos de saúde aos pacientes, como sistemas de registros eletrônicos, sistemas de telemedicina, dispositivos personalizados para diagnóstico e outros, que são denominados e-health. 
O surto de corona vírus está estressando o sistema de saúde de muitos países do mundo, revelando a necessidade de desenvolver e aumentar a capacidade de aumento para cuidados intensivos. Entretanto, medir, monitorar e contabilizar a disponibilidade de leitos em unidade de terapia intensiva (UTI) em uma cidade, estado ou país, em tempo real, é uma tarefa árdua para muitos governos. Pensando nisso, pensamos em um sistema de controle de leitos, onde o governo pode controlar quantas vagas estão disponíveis no combate ao covid; quantas pessoas estão infectadas; quantas foram curadas e quantos leitos estão ocupados.
Essa solução irá afetar a população como um todo, manejando-a de forma inteligente e melhor-ocupando os hospitais do estado.

## 2. Informações Armazenadas
O sistema deve armazenar os pacientes, que deve conter os principais dados relativos a este(data de nascimento, idade, nome, município) e está relacionado ao leito; a unidade de saúde, com os dados: quantidade de respiradores, quantidade de respiradores disponíveis, tipo de unidade de saúde, nome, contato, município; o usuário do sistema, que deve conter: login, senha, nome, telefone e possui relacionamento com a unidade de saúde; os leitos, que devem possuir as informações: situação, tipo de leito, código de referencia e possui relacionamento com a unidade de saúde; a internação, que deve conter informações: se possui covid19 ou não, diagnóstico e possui relacionamento com o leito, motivo da liberação, caso tenha sido liberado.

## 3. Modelo ER
O modelo possui entidades relacionadas ao contexto de gerenciamento de leitos, explicada em seguida:

- **Paciente** - Entidade relativa ao paciente que irá ser atendido nos leitos de saúde, possui um relacionamento com internação pois entende-se que irá ser internado e esta será uma entidade, que por sua vez tem relação com o leito. Possui também relação com pessoa, pois todo paciente é uma pessoa no mundo real, então contém informações como nome, sexo, cpf, etc. 

- **Internação** - A internação é uma entidade que representa a situação do paciente que contém informações como: se possui covid19; diagnóstico geral; situação (liberado, estado grave, etc) e caso seja liberado, o motivo de liberação, todos atributos simples.

Estas duas entidades por sua vez, possuem o relacionamento InternacaoPaciente, que será explicado em seguida:

- **InternacaoPaciente** - Relação que compõe internação ao paciente, esta, deve ter informações como data de liberação e data de entrada.

- **Endereco** - Entidade que representa um endereço de uma pessoa e que está relacionado com ela.

- **Moradia** - Relacionamento entre a pessoa e o endereço

- **Pessoa** - Entidade que representa as caracteristicas de uma pessoa física como nome, idade, sexo, cpf, email, etc. É importante identificar o CPF como um atributo determinante, quando os demais são atributos simples.

- **Usuário** - Entidade que representa o acesso ao sistema, uma pessoa pode ter ou não um usuário(ou seja, não necessariamente um paciente possui um usuário), mas todo usuário deve estar ligado a uma pessoa e possui informações relevantes ao sistema como login, - atributo determinante - ,senha e se está ativo ou não. Este, por sua vez, pode pertencer a uma unidade de saúde ou não pois podem haver usuários que são apenas administradores gerais.

- **Unidade de Saúde** - Representada por unidadeSaude, possui informações internas como nome, quantidade de respiradores, quantidade de respiradores disponíveis e o tipo da unidade. Esta, deve obrigatoriamente ter leitos vinculados.

- **Leito** - Representa o lugar ao qual os pacientes são internados e contém informações como situação deste(se está ocupado, livre, etc); tipo de uti; código de referência no hospital e o motivo do bloqueio(caso a situação esteja bloqueada). Deve ser ligado a uma unidade de saúde e possui um identificador separado como atributo determinante, não podemos usar o código de referência como determinante pois podem ter várias unidade de saúde que usem o mesmo código de referência interno(1A, 1B).

- **LeitoUnidadeSaude** - Relacionamento que liga o leito a unidade de saúde.

![Modelo ER](/images/ModeloER.jpeg)

## 4. Mapeamento ER-Relacional
A realização do mapeamento do modelo ER para o modelo relacional foi realizado de acordo com as diretrizes estabelecidas na literatura:

- **Entidades Fortes** - Para cada entidade forte é criada uma relação no modelo relacional, incluindo todos os atributos simples. Um atributo chave da entidade é escolhido como chave primária. 
- **Entidades Fracas** -  Para cada entidade fraca é criada uma relação no modelo relacional, incluindo todos os atributos simples e um atributo como chave estrangeira(a chave da entidade forte associada à entidade fraca). A chave primária é a combinação da chave estrangeira com uma chave parcial da entidade fraca.
- **Relacionamento 1:1** - Nesse tipo de relacionamento são identificadas as relações S e T que correspondem aos tipos de entidades participantes no relacionamento. Incluir como chave estrangeira em S a chave primária de T. Se houver uma entidade com participação total envolvida no relacionamento, escolhê-lo para o papel de S será a melhor opção. Incluir os atributos simples.
- **Relacionamento 1:N** - Nesse tipo de relacionamento foram identificadas as relações S e T que correspondem aos tipos de entidades participantes no relacionamento. A relação S representa a entidade que participa do relacionamento uma vez. Incluir como chave estrangeira em S a chave primária de T. Se houver uma entidade com participação total envolvida no relacionamento, escolhê-lo para o papel de S será a melhor opção. Incluir os atributos simples necessários
- **Relacionamento N:M** - Para cada relação desse tipo uma nova relação é criada para representar o relacionamento, incluindo como chaves estrangeira as chaves primárias das entidades participantes. A chave primária da nova relação é a combinação das chaves estrangeiras. Incluir os atributos simples necessários.
- **Generalização/especialização** - Para a especialização cada entidade é considerada uma relação, de modo que cada entidade especializada inclua uma chave estrangeira para entidade genérica.

O desenvolvimento do mapeamento se iniciou a partir do relacionamento entre as entidades Pessoa e Endereço. Cada pessoa ou não possui ou está associada a um endereço, entretanto, um endereço pode estar associado a mais de uma pessoa, como por exemplo no caso de familiares. Tratando-se de uma relação 1:N, foi criada uma relação para cada entidade e como Pessoa só participa uma vez no relacionamento foi incluída em sua relação uma chave estrangeira referente ao Endereço.

Analisando-se a especialização de Pessoa em Usuário e Paciente, conforme explicado acima, foram criadas relações para cada uma das entidades. Como Pessoa é a entidade genérica, a sua chave primária(cpf) foi adicionada como chave estrangeira em cada uma das relações especializadas.
Conforme o modelo ER, um Usuário pode estar associado a nenhuma ou a muitas unidades de saúde, enquanto uma UnidadeSaude pode ter vários usuários. Desse modo, como se constitui uma relação N:M, foi necessária a criação de uma tabela adicional chamada UnidadeSaudeUsuario que contém como chaves estrangeiras cada uma das chaves primárias das entidades envolvidas.

Por sua vez, uma UnidadeSaude pode conter vários leitos, enquanto um Leito está associado apenas a uma unidade de sáude, constituindo uma relação 1:N. Como o leito só participa uma vez no relacionamento, em sua relação foi criada uma chave estrangeira referente a qual unidade de saúde ele pertence.

Em uma unidade de saúde pode haver uma grande rotatividade de pacientes nos leitos. Desse modo, definiu-se no modelo que um Leito pode ser associado a várias internações e uma Internação ter sido associado a mais de um leito em momentos distintos. Por ser um relacionamento N:M, foi criada uma relação LeitoInternacao contendo as chaves estrangeiras de cada uma das entidades envolvidas.
Finalizando o mapeamento há o relacionamento entre Paciente e Internação. Um paciente pode chegar a se internar mais de uma vez, entretanto, cada internação estará associada a um único paciente. Sendo um relacionamento 1:N e internação a entidade que participa apenas uma vez, foi adicionada uma chave estrangeira na relação de Internação, referente a chave primária do Paciente.

![Modelo Relacional](/images/relacional.png)

## 5. Normalização
O modelo relacional proposto na seção anterior foi analisado para verificação das regras formais. De imediato constata-se que todas as tabelas estão na 1ª Forma Normal(1FN) pois  nenhuma das relações possui tabelas aninhadas. Como as tabelas possuem apenas uma chave primária e não possuem dependência funcional entre elas, constatou-se que elas também estão na 2FN e 3FN.

