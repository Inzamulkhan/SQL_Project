-- Total seat 
select count(parliament_constituency)
from constituencywise_results


--what are the total number of seat available for election in each STATE
create table top5_seat_states as
(select s.state as States_name ,
count(cr.parliament_constituency) as total_seats
from constituencywise_results as cr
INNER join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
inner join states as s 
on s.state_id = sr.state_id
group by 1 
order by total_seats desc
limit 5);

select * from top5_seat_states;




-- Total seat won by NDA Alliance
select 
    sum(CASE 
            when party IN (
                'Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
               'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'Nationalist Congress Party - NCP',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'AJSU Party - AJSUP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM'
            ) 
            then won
            else 0
        END) as NDA_Total_seat_won
from partywise_results;



--Seat won by NDA alliances parties
select party as party_name,
won as seat_won
from partywise_results
where party in  (
                'Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'Nationalist Congress Party - NCP',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'AJSU Party - AJSUP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM'
            ) 
			order by seat_won desc;

-- Total seat won by india alliance
select sum(CASE
			when party in (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP', 
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Jharkhand Mukti Morcha - JMM',
			'Jammu & Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
			) then won
			else 0
			end) as total_seat_won_india_alliance
			from partywise_results;
			select * from partywise_results;

-- seat won by india allinace parties

select party as party_name,
won as seat_won
from partywise_results
WHERE party in (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP', 
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Jharkhand Mukti Morcha - JMM',
			'Jammu & Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
			)
			order by seat_won desc;


-- add new column filed in table partywise_result to get the party alliance as nda and india and other
alter table partywise_results
add party_alliance varchar(50);

update partywise_results
set party_alliance = 'I.N.D.I.A'
where party in  (
			'Indian National Congress - INC',
			'Aam Aadmi Party - AAAP', 
			'All India Trinamool Congress - AITC',
			'Bharat Adivasi Party - BHRTADVSIP',
			'Communist Party of India  (Marxist) - CPI(M)',
			'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
			'Communist Party of India - CPI',
			'Dravida Munnetra Kazhagam - DMK',
			'Indian Union Muslim League - IUML',
			'Jharkhand Mukti Morcha - JMM',
			'Jammu & Kashmir National Conference - JKN',
			'Kerala Congress - KEC',
			'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			'Rashtriya Janata Dal - RJD',
			'Rashtriya Loktantrik Party - RLTP',
			'Revolutionary Socialist Party - RSP',
			'Samajwadi Party - SP',
			'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			'Viduthalai Chiruthaigal Katchi - VCK'
			);


update partywise_results
set party_alliance = 'NDA'
where party in (
                'Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'Nationalist Congress Party - NCP',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'AJSU Party - AJSUP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Rashtriya Lok Dal - RLD',
                'Sikkim Krantikari Morcha - SKM'
            ) ;



update partywise_results
set party_alliance = 'Other'
where party_alliance is null;

-- Winning candidate's name, their Party name, total votes,
--and the margin of victory for a specific state and constiuency name;

SELECT cr.winning_candidate,
		pr.party,
		pr.won as Party_total_seat_won,
		pr.party_alliance,
		cr.total_votes,
		cr.margin,
		s.state,
		cr.constituency_name,
		sr.status
		from constituencywise_results as cr
		inner join partywise_results as pr
		on cr.party_id = pr.party_id
		inner join statewise_results as sr
		on cr.parliament_constituency = sr.parliament_constituency
		inner join states as s
		on sr.state_id= s.state_id
		where constituency_name IN('HOWRAH' ,'CUTTACK','BALASORE','BARDHAMAN-DURGAPUR')
		ORDER BY 7;


-- WHAT IS THE DISTRIBUTION  OF EVM VOTES VERSUES POSTAL VOTES FOR CANDIDATES  IN A SPECIFIC CONSTITUENCY
SELECT cd.evm_votes,
cd.postal_votes,
cd.total_votes,
cd.candidate,
pr.party,
pr.party_alliance,
cr.constituency_name
from constituencywise_results as cr
join constituencywise_detail as cd
on cr.constituency_id = cd.constituency_id
join partywise_results as pr
on cr.party_id = pr.party_id
where constituency_name = 'DHUBRI'


-- which party won the most seat in a states, and how many seat did each party win?
select pr.party,
pr.party_alliance,
pr.won,
count(cr.constituency_id) as seat_won_states
from constituencywise_results as cr
join partywise_results as pr
on cr.party_id = pr.party_id
join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
join states as s
on s.state_id = sr.state_id
where s.state = 'Karnataka'
group by 1,2,3
order by 4 desc;

		
select * from states;


-- what is the total number seat won by party alliaance (NDA and india and other ) in each state for the india election 2024
select 
s.state,
sum(case when pr.party_alliance = 'NDA' then 1 else 0 END) as NDA_seat_won,
sum(case when pr.party_alliance = 'I.N.D.I.A' then 1 else 0 end) as India_seat_won,
sum(case when pr.party_alliance = 'Other' then 1 else 0 end) as other_seat_won
from constituencywise_results as cr
join partywise_results as pr
on cr.party_id = pr.party_id
join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
join states as s
on s.state_id = sr.state_id
group by 1
order by India_seat_won desc;



-- Which candidate received the highest number of EVM Votes in each consituency (top 10)
select
cr.constituency_name,
cd.constituency_id,
cd.candidate,
cd.evm_votes
from constituencywise_detail as cd
join constituencywise_results as cr
on cd.constituency_id = cr.constituency_id 
where cd.evm_votes = (select max(cd1.evm_votes)
						from constituencywise_detail as cd1
						where cd1.constituency_id = cd.constituency_id )
						order by 4 desc;
						

SELECT *
FROM (
    SELECT
        cr.constituency_name,
        cd.constituency_id,
        cd.candidate,
		cd.party,
		s.state,
        cd.evm_votes,
        ROW_NUMBER() OVER (PARTITION BY cd.constituency_id ORDER BY cd.evm_votes DESC) AS rank
    FROM constituencywise_detail AS cd
    JOIN constituencywise_results AS cr
     ON cd.constituency_id = cr.constituency_id
	 JOIN statewise_results as sr
	 on cr.parliament_constituency=sr.parliament_constituency
	 join states as s
	 on sr.state_id = s.state_id
) sub
WHERE rank = 1
ORDER BY evm_votes DESC;


-- which candidate won and which candidate was the runer-up in each constituency of state for the 2024 election?
with 
	rankedCandidates
					as
						(
						select 
						cd.constituency_id,
						cd.candidate,
						cd.party,
						cd.evm_votes,
						cd.postal_votes,
						cd.evm_votes + cd.postal_votes as Total_votes,
						cr.margin,
						row_number() over(partition by	cd.constituency_id
								order by cd.evm_votes + cd.postal_votes desc) as voterank
					FROM 	
						constituencywise_detail as cd
					JOIN 
						constituencywise_results as cr
					on 	
						cd.constituency_id = cr.constituency_id
					join 
						statewise_results as sr
					on 
						cr.parliament_constituency = sr.parliament_constituency
							join 
								states as s
									on 
										sr.state_id = s.state_id
											where 
												s.state='Maharashtra')
		select
			cr.constituency_name,
			max(case when rc.voterank = 1 then rc.candidate end) as Winning_Candidate,
			MAX(CASE WHEN rc.voterank = 1 THEN rc.total_votes END) AS winning_votes,
			max(case when rc.voterank = 2 then rc.candidate end) as runnerup_candidate,
			max(case when rc.voterank = 2 then rc.total_votes end) as runnerup_votes,
			max(case when rc.voterank = 1 then rc.margin end) as margin,
			max(case when rc.voterank = 3 then rc.candidate end) as third_runnerup_candidate,
			pr.party,
			pr.party_alliance
		from 	
			rankedCandidates as rc
		join 
			constituencywise_results as cr
		on 
			rc.constituency_id = cr.constituency_id
		join 
			constituencywise_detail as cd
		ON  
			cd.constituency_id = cr.constituency_id
		join 
			partywise_results as pr
		on 
			cr.party_id = pr.party_id
		group by cr.constituency_name,pr.party,
			pr.party_alliance
		order by 3 desc;



-- for the state of maharashtra, what are the total number of seat , total number of candidates, total number of 
-- parties ,total votes(including evm and postal), and break down the evm and postal votes?

select count(distinct cd.constituency_id) as total_seat,
count (distinct cd.candidate) as total_candidates,
count (distinct cd.party) as total_parties,
sum(cd.evm_votes) as Evm_votes,
sum(cd.postal_votes) as Postal_votes,
sum(cd.evm_votes + cd.postal_votes) as total_votes
from constituencywise_detail as cd
join constituencywise_results as cr
on cd.constituency_id = cr.constituency_id
join statewise_results as sr
on cr.parliament_constituency = sr.parliament_constituency
join states as s
on sr.state_id = s.state_id
where s.state = 'Maharashtra';



SELECT
    COUNT(DISTINCT cd.constituency_id) AS total_seats,
    COUNT(DISTINCT cd.candidate) AS total_candidates,
    COUNT(DISTINCT cd.party) AS total_parties,
    SUM(cd.evm_votes + cd.postal_votes) AS total_votes,
    SUM(cd.evm_votes) AS total_evm_votes,
    SUM(cd.postal_votes) AS total_postal_votes
FROM constituencywise_detail cd
JOIN constituencywise_results cr
    ON cd.constituency_id = cr.constituency_id
JOIN statewise_results sr
    ON cr.parliament_constituency = sr.parliament_constituency
JOIN states s
    ON sr.state_id = s.state_id
WHERE s.state = 'Maharashtra';









