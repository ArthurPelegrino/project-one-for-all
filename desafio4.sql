SELECT U.nome AS usuario,
    IF(MAX(YEAR(R.data_reproducao)) < 2021, 'Usuário inativo', 'Usuário ativo') AS status_usuario
FROM SpotifyClone.Usuarios AS U
INNER JOIN SpotifyClone.Reproducoes AS R
    ON U.usuarios_id = R.usuarios_id
GROUP BY U.nome
ORDER BY U.nome;