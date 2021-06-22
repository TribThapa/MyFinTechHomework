DROP TABLE IF EXISTS agents CASCADE;
DROP TABLE IF EXISTS regions CASCADE;
DROP TABLE IF EXISTS agent_region_junction;

-- CREATE TABLE AGENTS
CREATE TABLE agents(agent_id INT PRIMARY KEY,
					first_name VARCHAR(50),
					last_name VARCHAR(50));
					
COPY agents 
FROM'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\06-Stu_Data_Relationships\Resources\agents.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM agents;

-- CREATE TABLE regions
CREATE TABLE regions(region_id INT PRIMARY KEY,
					 region_name VARCHAR(50));
					 
COPY regions 
FROM'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\06-Stu_Data_Relationships\Resources\regions.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM regions;

-- CREATE TABLE agent_region_junction
CREATE TABLE agent_region_junction(agent_id INT,
								   region_id INT,
								   FOREIGN KEY(agent_id) REFERENCES agents(agent_id),
								   FOREIGN KEY(region_id) REFERENCES regions(region_id),
								   CONSTRAINT CompKey_agent_region PRIMARY KEY (agent_id, region_id));
								   
COPY agent_region_junction 
FROM'C:\Users\TribThapa\Desktop\Thapa\ResearchFellow\Courses\FinTech_Bootcamp_MonashUni2021\monu-mel-virt-fin-pt-05-2021-u-c\Activities\Week 7\3\06-Stu_Data_Relationships\Resources\agent_region_junction.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM agent_region_junction;





