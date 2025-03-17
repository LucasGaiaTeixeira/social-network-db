
CREATE TABLE users (
  id SERIAL PRIMARY KEY, -- ID do usuário (chave primária)
  nome VARCHAR(50), -- Nome do usuário
  email VARCHAR(50) UNIQUE, -- Email único do usuário
  descricao VARCHAR(500) -- Descrição do usuário
);


CREATE TABLE posts (
  id_post SERIAL PRIMARY KEY, -- ID do post (chave primária)
  id_user INTEGER REFERENCES users(id), -- Relacionamento com o usuário (chave estrangeira)
  data_post TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data do post (valor padrão é o horário atual)
  conteudo VARCHAR(1000), -- Conteúdo do post
  curtidas INTEGER DEFAULT 0 -- Número de curtidas (valor inicial é 0)
);


CREATE TABLE friends (
  id_user1 INTEGER REFERENCES users(id), -- Relacionamento com o primeiro usuário (chave estrangeira)
  id_user2 INTEGER REFERENCES users(id), -- Relacionamento com o segundo usuário (chave estrangeira)
  data_amizade TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de amizade (valor padrão é o horário atual)
  PRIMARY KEY (id_user1, id_user2) -- Chave primária composta pelos dois IDs de usuários
);


CREATE TABLE comments (
  id_comment SERIAL PRIMARY KEY, -- ID do comentário (chave primária)
  id_post INTEGER REFERENCES posts(id_post), -- Relacionamento com o post (chave estrangeira)
  id_user INTEGER REFERENCES users(id), -- Relacionamento com o usuário (chave estrangeira)
  comentario VARCHAR(700), -- Conteúdo do comentário
  data_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data do comentário (valor padrão é o horário atual)
);


CREATE TABLE likes (
  id_user INTEGER REFERENCES users(id), -- Relacionamento com o usuário (chave estrangeira)
  id_post INTEGER REFERENCES posts(id_post), -- Relacionamento com o post (chave estrangeira)
  PRIMARY KEY (id_user, id_post) -- Chave primária composta pelos dois IDs (usuário e post)
);
