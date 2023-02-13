 DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Artistas (
  artistas_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL
  )
  
ENGINE = InnoDB;


CREATE TABLE SpotifyClone.Planos(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
	plano VARCHAR(45) NOT NULL,
	valor_plano DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.Usuarios (
  usuarios_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  idade INT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.Planos (plano_id)
    )
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Artistas_seguidos (
  artistas_id INT NOT NULL,
  usuarios_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (artistas_id, usuarios_id),
    FOREIGN KEY (artistas_id)
    REFERENCES SpotifyClone.Artistas (artistas_id),
    FOREIGN KEY (usuarios_id)
    REFERENCES SpotifyClone.Usuarios (usuarios_id))
ENGINE = InnoDB;

CREATE TABLE  SpotifyClone.Album (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(200) NOT NULL,
  artistas_id INT NOT NULL,
  ano_lancamento YEAR NOT NULL,
    FOREIGN KEY (artistas_id)
    REFERENCES SpotifyClone.Artistas (artistas_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Musicas (
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(200) NOT NULL, 
  duracao_segundos INT NULL,
  album_id INT NOT NULL,
  artistas_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.Album (album_id),
    FOREIGN KEY (artistas_id) REFERENCES SpotifyClone.Artistas (artistas_id))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Reproducoes(
  musica_id INT NOT NULL,
  usuarios_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(usuarios_id, musica_id),
  FOREIGN KEY (usuarios_id) REFERENCES SpotifyClone.Usuarios (usuarios_id),
  FOREIGN KEY (musica_id) REFERENCES SpotifyClone.Musicas (musica_id)  
 ) engine = InnoDB;

INSERT INTO SpotifyClone.Planos (plano, valor_plano)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);


  INSERT INTO SpotifyClone.Artistas (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.Usuarios (nome, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');
    

  INSERT INTO SpotifyClone.Album (nome_album, ano_lancamento, artistas_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2000, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.Musicas (nome_musica, duracao_segundos, album_id, artistas_id) 
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369 ,1 , 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ('The Bard’s Song', 244, 7, 5),
    ('Feeling Good', 100, 8, 6);
    
  INSERT INTO SpotifyClone.Artistas_seguidos(usuarios_id, artistas_id)
  VALUES
    (1, 1),
    (1, 2),
    (1,3),
    (2,1),
    (2,3),
    (3,2),
    (4,4),
    (5,5),
    (5,6),
    (6,6),
    (6,1),
    (7,6),
    (9,3),
    (10,2);
 
  INSERT INTO SpotifyClone.Reproducoes(usuarios_id, musica_id, data_reproducao)  
  VALUES
	(1,8,'2022-02-28 10:45:55'),
    (1,2,'2020-05-02 05:30:35'),
    (1,10,'2020-03-06 11:22:33'),
    (2,10,'2022-08-05 08:05:17'),
    (2,7,'2020-01-02 07:40:33'),
    (3,10,'2020-11-13 16:55:13'),
    (3,2,'2020-12-05 18:38:30'),
    (4,8,'2021-08-15 17:10:10'),
    (5,8,'2022-01-09 01:44:33'),
    (5,5,'2020-08-06 15:23:43'),
    (6,7,'2017-01-24 00:31:17'),
    (6,1,'2017-10-12 12:35:20'),
    (7,4,'2011-12-15 22:30:49'),
    (8,4,'2012-03-17 14:56:41'),
    (9,9,'2022-02-24 21:14:22'),
    (10,3,'2015-12-13 08:30:22');
    
    SELECT * FROM SpotifyClone.Reproducoes
