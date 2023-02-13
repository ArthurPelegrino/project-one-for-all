SELECT ART.nome AS artista,
A.nome_album AS album,
COUNT(S.artistas_id) AS seguidores
FROM SpotifyClone.Artistas AS ART
INNER JOIN SpotifyClone.Artistas_seguidos AS S
ON S.artistas_id = ART.artistas_id
INNER JOIN SpotifyClone.Album AS A
ON ART.artistas_id = A.artistas_id
GROUP BY ART.nome, A.nome_album
ORDER BY seguidores DESC, ART.nome, A.nome_album;