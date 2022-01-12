SELECT
	c.cancoes AS cancao,
	COUNT(h.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS h ON c.cancoes_id = h.cancoes_id
GROUP BY c.cancoes
ORDER BY reproducoes DESC, cancoes
LIMIT 2;