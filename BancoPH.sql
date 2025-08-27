create database tccinf;
use tccinf;


CREATE TABLE jogos_destaque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    posicao INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    imagem_principal VARCHAR(255) NOT NULL,
    imagem_lateral VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco VARCHAR(50) NOT NULL,
    botao_texto VARCHAR(50) NOT NULL
);



CREATE TABLE if not exists usuario (
  id_user INT NOT NULL auto_increment  ,
  nome VARCHAR(16) NOT NULL,
  email VARCHAR(255) NULL,
  senha VARCHAR(255) NOT NULL,
  tipo VARCHAR(9) NULL,
  idade INT NULL,
  foto VARCHAR(300),
  banner VARCHAR(300),
  cpf INT NULL,
  PRIMARY KEY (id_user));


CREATE TABLE IF NOT EXISTS compra (
  id_compra INT NOT NULL,
  dataa TIME NULL,
  historico INT NULL,
  id_user INT NOT NULL,
  total FLOAT NULL,
  PRIMARY KEY (id_compra),
    FOREIGN KEY (id_user)
    REFERENCES usuario(id_user)
);




-- ESSE É DA BIBLIOTECA-- 
 

CREATE TABLE if not exists jogo(
  id_jogo INT NOT NULL auto_increment,
  id_user int not null,
  url_img varchar(255) not null,
  Nome VARCHAR(45) NULL,
  descricao VARCHAR(500) NULL,
  data_lanc DATE NULL,
  valor DOUBLE NULL,
  valorold DOUBLE NULL,
  genero VARCHAR(15) NULL,
  descricao_longa TEXT,
  url_logo VARCHAR(255),
  PRIMARY KEY (id_jogo),
    FOREIGN KEY (id_user)
    REFERENCES usuario (id_user) );
    
   DELIMITER //
CREATE TRIGGER before_insert_jogo
BEFORE INSERT ON jogo
FOR EACH ROW
BEGIN
    SET NEW.data_lanc = CURRENT_DATE;
END; //

DELIMITER ;

CREATE TABLE produtos (
  id_jogo INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  data_lanc DATE NOT NULL,
  valor DECIMAL(10, 2) NOT NULL,
  genero VARCHAR(20) NOT NULL,
  imagem VARCHAR(255) NOT NULL,  -- Nova coluna para armazenar o caminho da imagem
  PRIMARY KEY (id_jogo)
);

CREATE TABLE cart (
    id_cart INT NOT NULL AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    data_adicionado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_cart),
    FOREIGN KEY (id_user) REFERENCES usuario(id_user),
    FOREIGN KEY (id_produto) REFERENCES jogo(id_jogo)
);

CREATE TABLE biblioteca (
    id_biblioteca INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_jogo INT,
    data_adicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES usuario(id_user),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo)
);







CREATE TABLE IF NOT EXISTS compra_itens (
  id_compra INT NOT NULL auto_increment,
  id_jogo INT NOT NULL,
    FOREIGN KEY (id_compra )
    REFERENCES compra (id_compra),
    FOREIGN KEY (id_jogo )
    REFERENCES jogo(id_jogo)
    );
    
 



CREATE TABLE IF NOT EXISTS post (
  descricao INT NOT NULL,
  nome VARCHAR(45) NULL,
  tipo INT NULL,
  likes INT NULL,
  dataa TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_post INT NOT NULL auto_increment,
  id_user INT NOT NULL,
  PRIMARY KEY (id_post),
    FOREIGN KEY (id_user)
    REFERENCES usuario (id_user)
    );

CREATE TABLE favoritos (
    id_favorito INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_jogo INT NOT NULL,
    data_adicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES usuario(id_user),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo),
    UNIQUE KEY unique_favorite (id_user, id_jogo)
);

CREATE TABLE IF NOT EXISTS chat (
    id_chat INT NOT NULL AUTO_INCREMENT,
    id_jogo INT NOT NULL,
    id_user INT NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_chat),
    FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo),
    FOREIGN KEY (id_user) REFERENCES usuario (id_user)
);


-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comentário (
  titulo INT NOT NULL,
  descricao VARCHAR(45) NULL,
  dataa TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  id_user INT NOT NULL,
  id_post INT NOT NULL,
    FOREIGN KEY (id_user)
    REFERENCES usuario (id_user),
    FOREIGN KEY (id_post)
    REFERENCES post (id_post)
);


INSERT INTO jogos_destaque (posicao, titulo, imagem_principal, imagem_lateral, descricao, preco, botao_texto) VALUES
(1, 'Ghost of Tsushima', 'https://pop.proddigital.com.br/wp-content/uploads/sites/8/2021/08/ghost-of-tsushima.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWNy8fuSgUL0lt1Of9Pze3yuHMH_Or8YmOmA&s', 'Ghost of Tsushima é um jogo de ação onde você é Jin Sakai, um samurai que luta contra a invasão mongol no Japão feudal, com combate fluido e mundo aberto.', 'R$ 249,90', 'Comprar Agora'),
(2, 'Batman Arkham Knight', 'https://tudogeek.com.br/wp-content/uploads/2015/06/Batman-Arkham-Knight-Game-HD-Wallpaper-1080p.jpg', 'https://image.api.playstation.com/cdn/UP1018/CUSA01764_00/daExAVIqaWz8NNeqTaFW2IcweYzqt4d8.png', 'Batman: Arkham Knight é um jogo de ação onde você é o Batman, enfrentando vilões em Gotham com combate fluido e o Batmóvel.', 'R$ 159,90', 'Comprar Agora'),
(3, 'Ori and the Blind Forest', 'https://assets.nintendo.com/image/upload/q_auto/f_auto/ncom/software/switch/70010000018710/89e1f45e5012962fcdbc47b297dbb99472d04fdae7c60213bce6fb44713d2068', 'https://store-images.s-microsoft.com/image/apps.4128.71930896676716842.b6740fa4-0359-4ca8-9e17-5d4e45c2d497.ffa292b1-579d-4a08-99ef-308ab7791f79', 'Ori and the Blind Forest é um jogo de plataforma e aventura, com belos gráficos e uma história emocionante, onde você controla Ori em uma jornada para salvar sua floresta.', 'R$ 69,90', 'Comprar Agora'),
(4, 'EA Sports FC 25', 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000074799/ab3989c5c208683e007deb3327a1ce70a8fa6cb38b06cfb8c2c80d563b19cfc7', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg3bsKfdYKORfvXfxnP8qmv8dRhMhAJ4ImJQ&s', 'EA Sports FC 25 é um jogo de futebol que traz jogabilidade realista, modos variados e equipes licensiadas, oferecendo uma experiência imersiva no mundo do futebol.', 'R$ 249,90', 'Comprar Agora'),
(5, 'Hollow Knight', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEivqO7LZ9TJbyXjiLhVjrmU5twSEFCOvC497ePegZfRWjliUUQrXY2PoF8IX6mHpBnnwrvOeso9K8Wx_j1nvEyyZThbglNd5TDEeBcPAAOmlmyvZg5d7Mh61_N-SGf7AfTDl5ORVEet8svF/s1600/hollow-knight-voidheart.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjsDQDH184s94zjVLP7jO6K7dhpA5FcslDxg&s', 'Hollow Knight é um jogo de ação e exploração em 2D, onde você controla um cavaleiro em uma jornada por um vasto e misterioso mundo subterrâneo cheio de desafios e inimigos.', 'R$ 49,90', 'Comprar Agora');





 INSERT INTO jogo (id_user, url_img, Nome, descricao, valor, valorold, genero, descricao_longa, url_logo) VALUES
(1, 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000079782/2d6f46a6d1415d0db09560b5dfde731d7f7fe9a202de8f471f9e118ae674dc7d', 'Medieval Legends', 'Uma épica jornada em um reino medieval repleto de magia e conflitos.', 59.99, 69.99, 'RPG', 'Explore um vasto mundo medieval, faça escolhas cruciais e enfrente criaturas míticas em uma narrativa rica e envolvente.', 'https://cdn-icons-png.flaticon.com/512/4205/4205737.png'),
(1, 'https://i.scdn.co/image/ab67616d0000b2732465f342f5099a6c26ea76cd', 'Cyberpunk Rebel', 'Um jogo de ação em um futuro distópico onde tecnologia e sobrevivência se encontram.', 44.99, 54.99, 'Ação', 'Navegue por uma megalópole futurista, hackeie sistemas, personalizar seu personagem e lute contra corporações corruptas.', 'https://www.svgrepo.com/show/121171/rebel-flag.svg'),
(1, 'https://store-images.s-microsoft.com/image/apps.51883.13510798886401705.fe8b9f8c-3aee-46e8-84f9-779d2dba4cb4.cf6bcd0d-1e30-4485-b491-0670660e5d65?mode=scale&q=90&h=400&w=800&background=%23464646', 'Rural Harmony', 'Construa e gerencie sua fazenda, faça amizades e explore uma comunidade acolhedora.', 24.99, 34.99, 'Simulação', 'Restaure a fazenda herdada de seu avô, cultive plantações, crie animais, explore cavernas e construa relacionamentos.', 'https://cdn-icons-png.flaticon.com/512/2909/2909937.png'),
(1, 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000037336/27b7c212e9900ebbf3fba4c6cb0d0d137e7d0be05f86ab5a954bb7d161e7fb64', 'Cosmic Explorers', 'Uma simulação de exploração espacial onde você comanda sua própria nave.', 34.99, 44.99, 'Simulação', 'Gerencie recursos, explore planetas desconhecidos, enfrente desafios interestelares e descubra segredos cósmicos.', 'https://preview.redd.it/1ox6y6hvi15z.png?auto=webp&s=5b6fce284cf8cf30b232ce101689d792f3939c4d'),
(1, 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000017136/58ff94c4934232a14fd6f3ee93730cd04c32dc248bae5514b582f2bc635a0d65', 'Urban Tactics', 'Um jogo estratégico de combate urbano com táticas de guerra moderna.', 39.99, 49.99, 'Estratégia', 'Planeje operações militares complexas, gerencie recursos, treine tropas e lidere missões em cenários urbanos realistas.', 'https://cdn2.steamgriddb.com/icon/421740375847b6249d9383615831c23b.png'),
(1, 'https://i.ytimg.com/vi/JGhIXLO3ul8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBMhupkE5LIOawaC8ZqUZ6l94wy2A', 'Monster Academy', 'Um RPG onde você treina e batalha com criaturas mágicas em uma escola fantástica.', 29.99, 39.99, 'RPG', 'Desenvolva seus monstros, aprenda magias, explore a academia e participe de torneios mágicos.', 'https://cdn2.steamgriddb.com/logo/94391e36d8a88f11d871e8dca5f642f7.png'),
(1, 'https://gameplayscassi.com.br/wp-content/smush-webp/2023/01/Raft.jpg.webp', 'Survival Island', 'Um jogo de sobrevivência em uma ilha tropical cheia de desafios.', 19.99, 29.99, 'Sobrevivência', 'Colete recursos, construa abrigos, fabrique ferramentas e sobreviva contra elementos naturais e criaturas perigosas.', 'https://seeklogo.com/images/R/raft-logo-835F67070F-seeklogo.com.png'),
(1, 'https://image.api.playstation.com/vulcan/ap/rnd/202301/2315/AV5D2dPmPZL9CT3IdveGCGJZ.jpg', 'Indie Revolution', 'Um jogo musical onde você cria e gerencia sua própria banda indie.', 14.99, 24.99, 'Simulação', 'Componha músicas, gerencie sua banda, faça turnês e conquiste a cena musical independente.', 'https://icons.iconarchive.com/icons/3xhumed/mega-games-pack-40/256/Hitman-Blood-Money-9-icon.png'),
(1, 'https://www.cafemaisgeek.com/wp-content/uploads/2021/03/valheim-game-cover.jpg', 'Viking Chronicles', 'Uma aventura de sobrevivência e exploração no mundo dos vikings.', 27.99, 37.99, 'Sobrevivência', 'Construa navios, explore territórios desconhecidos, enfrente criaturas mitológicas e honre os deuses nórdicos.', 'https://static.wikia.nocookie.net/valheim/images/4/4c/Logo_valheim.png/revision/latest?cb=20200819084630'),
(1, 'https://img.goodfon.com/wallpaper/big/3/7f/kiberpank-cyberpunk-2077-videoigra-cyberpunk-cd-projekt-red.webp', 'Cyber Detective', 'Um jogo de investigação em um mundo cyberpunk onde você resolve mistérios tecnológicos.', 32.99, 42.99, 'Aventura', 'Use tecnologia de ponta, hackeia sistemas, interroga suspeitos e desvende conspirações em uma cidade futurista.', 'https://i.redd.it/5zjc1f50aqpc1.png');
INSERT INTO jogo (id_user, url_img, Nome, descricao, valor, url_logo, descricao_longa, genero) VALUES 
(1, 'https://pop.proddigital.com.br/wp-content/uploads/sites/8/2021/08/ghost-of-tsushima.jpg', 'Ghost of Tsushima', 'Ghost of Tsushima é um jogo de ação onde você é Jin Sakai, um samurai que luta contra a invasão mongol no Japão feudal, com combate fluido e mundo aberto.', 249.90, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWNy8fuSgUL0lt1Of9Pze3yuHMH_Or8YmOmA&s', 'Explore o Japão feudal como Jin Sakai, um samurai determinado a defender sua terra natal contra a invasão mongol. Enfrente inimigos em combates épicos, explore uma paisagem deslumbrante e mergulhe em uma história de honra, sacrifício e redenção.', 'Ação'),
(1, 'https://tudogeek.com.br/wp-content/uploads/2015/06/Batman-Arkham-Knight-Game-HD-Wallpaper-1080p.jpg', 'Batman Arkham Knight', 'Batman: Arkham Knight é um jogo de ação onde você é o Batman, enfrentando vilões em Gotham com combate fluido e o Batmóvel.', 159.90, 'https://image.api.playstation.com/cdn/UP1018/CUSA01764_00/daExAVIqaWz8NNeqTaFW2IcweYzqt4d8.png', 'Mergulhe no papel do Cavaleiro das Trevas em Gotham City. Enfrente os maiores inimigos do Batman, utilize suas habilidades de combate e o icônico Batmóvel para proteger a cidade contra o caos.', 'Ação'),
(1, 'https://assets.nintendo.com/image/upload/q_auto/f_auto/ncom/software/switch/70010000018710/89e1f45e5012962fcdbc47b297dbb99472d04fdae7c60213bce6fb44713d2068', 'Ori and the Blind Forest', 'Ori and the Blind Forest é um jogo de plataforma e aventura, com belos gráficos e uma história emocionante, onde você controla Ori em uma jornada para salvar sua floresta.', 69.90, 'https://store-images.s-microsoft.com/image/apps.4128.71930896676716842.b6740fa4-0359-4ca8-9e17-5d4e45c2d497.ffa292b1-579d-4a08-99ef-308ab7791f79', 'Uma jornada emocionante de plataforma e aventura. Como Ori, um espírito da floresta, você enfrentará desafios emocionantes, descobrirá segredos antigos e lutará para salvar sua amada floresta de uma terrível destruição.', 'Plataforma'),
(1, 'https://assets.nintendo.com/image/upload/c_fill,w_1200/q_auto:best/f_auto/dpr_2.0/ncom/software/switch/70010000074799/ab3989c5c208683e007deb3327a1ce70a8fa6cb38b06cfb8c2c80d563b19cfc7', 'EA Sports FC 25', 'EA Sports FC 25 é um jogo de futebol que traz jogabilidade realista, modos variados e equipes licensiadas, oferecendo uma experiência imersiva no mundo do futebol.', 249.90, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg3bsKfdYKORfvXfxnP8qmv8dRhMhAJ4ImJQ&s', 'A mais nova edição do simulador de futebol, agora sob o nome EA Sports FC. Desfrute de jogabilidade ultra-realista, modos de jogo abrangentes, times e jogadores oficiais, e uma experiência de futebol sem precedentes.', 'Esporte'),
(1, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEivqO7LZ9TJbyXjiLhVjrmU5twSEFCOvC497ePegZfRWjliUUQrXY2PoF8IX6mHpBnnwrvOeso9K8Wx_j1nvEyyZThbglNd5TDEeBcPAAOmlmyvZg5d7Mh61_N-SGf7AfTDl5ORVEet8svF/s1600/hollow-knight-voidheart.jpg', 'Hollow Knight', 'Hollow Knight é um jogo de ação e exploração em 2D, onde você controla um cavaleiro em uma jornada por um vasto e misterioso mundo subterrâneo cheio de desafios e inimigos.', 49.90, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjsDQDH184s94zjVLP7jO6K7dhpA5FcslDxg&s', 'Uma aventura metroidvania em um mundo subterrâneo intrincado e misterioso. Como um pequeno cavaleiro, explore passagens labirínticas, enfrente inimigos desafiadores e desvende os segredos de um reino em ruínas.', 'Ação');
