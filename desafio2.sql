SELECT 
	COUNT(DISTINCT M.musica_id) AS cancoes,
    COUNT(DISTINCT ART.artistas_id) AS artistas, 
    COUNT(DISTINCT ALB.album_id) AS albuns 
FROM SpotifyClone.Musicas as M
INNER JOIN SpotifyClone.Artistas as ART 
ON M.artistas_id = ART.artistas_id
INNER JOIN SpotifyClone.Album as ALB
ON M.album_id = ALB.album_id;