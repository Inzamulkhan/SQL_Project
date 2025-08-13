







create table constituencywise_detail(S_N int,
Candidate	varchar(100),	
Party	varchar(50),
EVM_Votes DOUBLE PRECISION,
Postal_Votes DOUBLE PRECISION,	
Total_Votes	DOUBLE PRECISION,
percentage_of_Votes	float,
Constituency_ID VARCHAR(20)
);
drop table constituencywise_detail;


ALTER TABLE constituencywise_detail
ALTER COLUMN Candidate TYPE varchar(100);
alter table constituencywise_detail
alter COLUMN party type varchar(100);


create TABLE constituencywise_results(
									S_No int,
									Parliament_Constituency	varchar(40),
									Constituency_Name	varchar(30),
									Winning_Candidate VARCHAR(60),
									Total_Votes	INT,
									Margin	INT,
									Constituency_ID	VARCHAR(20) PRIMARY KEY,
									Party_ID INT
									);
CREATE TABLE statewise_results
							(Constituency varchar(50),
							Const_No	int,
							Parliament_Constituency varchar(100) primary key,	
							Leading_Candidate	varchar(100),
							Trailing_Candidate	varchar(100),
							Margin	int,
							Status	varchar(50),
							State_ID varchar(10),
							State varchar(50)
							);

create table states
				(State_ID varchar(20) primary key,	
				State varchar(30)
				);
alter table states
alter COLUMN state type varchar(100);

create table Partywise_results(Party varchar(100),	
Won	int,
Party_ID int primary key
);

SELECT * FROM constituencywise_detail;
SELECT * FROM constituencywise_results;
SELECT * FROM partywise_results;
SELECT * FROM states;
SELECT * FROM statewise_results;




