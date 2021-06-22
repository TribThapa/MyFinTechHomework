-- Join and query the tables to get all data on the agents.
SELECT MAX(agents.agent_id), agents.first_name, agents.last_name
FROM agents
LEFT JOIN agent_region_junction ON agent_region_junction.agent_id=agents.agent_id
LEFT JOIN regions ON regions.region_id=agent_region_junction.region_id
GROUP BY agents.first_name, agents.last_name 
ORDER BY MAX;

-- Create a DataFrame with Region Count per Agent ID.
SELECT agents.agent_id AS agent_id, COUNT(agent_region_junction.agent_id) AS agent_region_count 
FROM agents
LEFT JOIN agent_region_junction ON agent_region_junction.agent_id=agents.agent_id
GROUP BY agents.agent_id
ORDER BY agents.agent_id;

-- Create a DataFrame with Region Count per Agent Name.
SELECT CONCAT(agents.first_name, ' ', agents.last_name) AS agent_name, COUNT(agent_region_junction.agent_id) AS agent_region_count 
FROM agents
LEFT JOIN agent_region_junction ON agent_region_junction.agent_id=agents.agent_id
GROUP BY agent_name 
ORDER BY agent_name;

-- Create a DataFrame with Agent Count per Region Name.
SELECT regions.region_name AS region_name, COUNT(agents.agent_id) AS agent_id 
FROM agents
LEFT JOIN agent_region_junction ON agent_region_junction.agent_id=agents.agent_id
LEFT JOIN regions ON regions.region_id=agent_region_junction.region_id
GROUP BY regions.region_name;
