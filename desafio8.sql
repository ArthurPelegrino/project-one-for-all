SELECT ART.nome AS artista,
A.nome_album AS album
FROM SpotifyClone.Artistas AS ART
INNER JOIN SpotifyClone.Album AS A
ON ART.artistas_id = A.artistas_id
WHERE ART.artistas_id = 3;