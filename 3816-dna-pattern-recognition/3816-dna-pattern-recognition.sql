# Write your MySQL query statement below
select *, 
Case when dna_sequence like 'ATG%' THEN 1 ELSE 0 END as has_start,
Case when dna_sequence like '%TAA' or dna_sequence like '%TAG' or dna_sequence like '%TGA' THEN 1 ELSE 0 END as has_stop,
Case when dna_sequence like '%ATAT%' THEN 1 ELSE 0 END as has_atat,
Case when dna_sequence like '%GGG%' THEN 1 ELSE 0 END as has_ggg
from samples