SELECT
    a.artista,
    al.album,
    COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artista AS sa
INNER JOIN SpotifyClone.artistas AS a ON a.artista_id = sa.artista_id
INNER JOIN SpotifyClone.albuns AS al ON al.artista_id = a.artista_id
GROUP BY al.album_id
ORDER BY seguidores DESC, a.artista, al.album;