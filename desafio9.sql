SELECT COUNT(usuarios_id) AS quantidade_musicas_no_historico 
FROM SpotifyClone.Reproducoes
WHERE usuarios_id = 1
GROUP BY usuarios_id;