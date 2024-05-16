create table diabetes_predication;
use diabetes_predication;

select * from dia_predict ;

Q1); select patient_id,avg(bmi) from dia_predict group by patient_id;

Q2); select EmployeeName,blood_glucose_level from dia_predict order by blood_glucose_level desc;

Q3); select count(*) from dia_predict where heart_disease='1' and diabetes='1';

Q4); select count(patient_id) from dia_predict	where heart_disease='1';

Q5); SELECT
    CASE 
        WHEN smoking_history IN ('never', 'no info') THEN 'Non-smoker'
        WHEN smoking_history IN ('ever', 'former') THEN 'Former smoker'
        WHEN smoking_history IN ('no current', 'format') THEN 'Unknown'
        WHEN smoking_history = 'current' THEN 'Current smoker'
        ELSE 'Other'
    END AS smoking_status,
    COUNT(*) AS patients
FROM
    dia_predict
GROUP BY
    CASE 
        WHEN smoking_history IN ('never', 'no info') THEN 'Non-smoker'
        WHEN smoking_history IN ('ever', 'former') THEN 'Former smoker'
        WHEN smoking_history IN ('no current', 'format') THEN 'Unknown'
        WHEN smoking_history = 'current' THEN 'Current smoker'
        ELSE 'Other'
    END;
    
Q6); select patient_id,bmi from dia_predict where bmi > (select avg(bmi) from dia_predict);

Q7); SELECT EmployeeName,HbA1c_level
FROM dia_predict
WHERE HbA1c_level = (
    SELECT MAX(HbA1c_level)
    FROM dia_predict
)
OR HbA1c_level = (
    SELECT MIN(HbA1c_level)
    FROM dia_predict
) ;


Q8); SELECT
    Patient_id,
    Gender,
    Blood_glucose_level,
    RANK() OVER (PARTITION BY Gender ORDER BY Blood_glucose_level) AS glucose_level_rank
FROM
    dia_predict;
    
Q9); insert into dia_predict (EmployeeName,Patient_id,gender,DateOfBirth,hypertension,heart_disease,smoking_history,bmi,HbA1c_level,blood_glucose_level,diabetes)
values("Elon Musk","PT10000","Male","12/15/1999",1,0,"never",25.14,6.2,135,1);

Q10); delete from dia_predict where heart_disease = 1 ;

Q11);
 SELECT Patient_id
FROM dia_predict	
WHERE hypertension = 1 
except
SELECT Patient_id
FROM dia_predict
WHERE diabetes = 1;

Q12); ALTER TABLE dia_predict
ADD CONSTRAINT Patient_id UNIQUE (patient_id) ;
