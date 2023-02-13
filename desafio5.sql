SELECT M.nome_musica AS cancao,
COUNT(R.musica_id) as reproducoes
FROM SpotifyClone.Musicas AS M
INNER JOIN SpotifyClone.Reproducoes AS R
ON M.musica_id = R.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;