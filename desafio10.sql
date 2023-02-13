SELECT M.nome_musica AS nome,
	COUNT(M.nome_musica) AS reproducoes
    FROM SpotifyClone.Reproducoes AS R
    INNER JOIN SpotifyClone.Usuarios AS U
    ON R.usuarios_id = U.usuarios_id
    INNER JOIN SpotifyClone.Musicas AS M
    ON R.musica_id = M.musica_id
    WHERE U.plano_id IN (1, 4)
    GROUP BY M.nome_musica
    ORDER BY M.nome_musica;