SELECT 
	U.nome AS usuario,
    COUNT(R.usuarios_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(M.duracao_segundos) / 60, 2) AS total_minutos
    FROM SpotifyClone.Usuarios AS U
    INNER JOIN SpotifyClone.Reproducoes AS R
    ON U.usuarios_id = R.usuarios_id
    INNER JOIN SpotifyClone.Musicas AS M
    ON M.musica_id = R.musica_id
    GROUP BY U.nome, R.usuarios_id
    ORDER BY U.nome