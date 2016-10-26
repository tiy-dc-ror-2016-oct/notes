SELECT time_entries.duration, clients.name
FROM time_entries
LEFT JOIN projects
ON time_entries.project_id =  projects.id
LEFT JOIN clients
ON projects.client_id =  clients.id
WHERE  time_entries.created_at in (
	SELECT max(time_entries.created_at)
	FROM time_entries
	LEFT JOIN projects
	ON time_entries.project_id =  projects.id
	GROUP BY projects.client_id
)
