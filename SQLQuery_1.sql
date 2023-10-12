-- check if Mailing address line columns are all empty

SELECT  *
  FROM [Texas_Data].[dbo].[ltcosmos]
  Where MAILING_ADDRESS_LINE1 is not NULL 
  or  MAILING_ADDRESS_LINE2 is not NULL 

  ALTER TABLE [Texas_Data].[dbo].[ltcosmos]
  DROP COLUMN MAILING_ADDRESS_LINE1



-- dropping mailing address line columns
  
  ALTER TABLE [Texas_Data].[dbo].[ltcosmos]
  DROP COLUMN MAILING_ADDRESS_LINE2

-- check if other columns are all empty

  SELECT  *
  FROM [Texas_Data].[dbo].[ltcosmos]
  where MAILING_ADDRESS_CITY_STATE_ZIP   is not null 
  or 
  PHONE_NUMBER   is not null
  or
   BUSINESS_ADDRESS_LINE1  is not null 
  or 
  BUSINESS_ADDRESS_LINE2   is not null 
  or 
  BUSINESS_CITY_STATE_ZIP   is not null


--dropping all null columns

Alter TABLE [Texas_Data].[dbo].[ltcosmos]
Drop COLUMN
MAILING_ADDRESS_CITY_STATE_ZIP , PHONE_NUMBER  ,BUSINESS_ADDRESS_LINE1 , BUSINESS_ADDRESS_LINE2 , BUSINESS_CITY_STATE_ZIP  


Alter TABLE [Texas_Data].[dbo].[ltcosmos]
Drop COLUMN
BUSINESS_ZIP ,BUSINESS_PHONE


SELECT  *
  FROM [Texas_Data].[dbo].[ltcosmos]
  Where CONTINUING_EDUCATION_FLAG != 'Y' AND CONTINUING_EDUCATION_FLAG != 'N'


--   CHECK IF ALL COLUMNS OF NAME AND BUSINESS_NAME ARE THE SAME

SELECT  *
  FROM [Texas_Data].[dbo].[ltcosmos]
  WHERE NAME != BUSINESS_NAME

--   BOTH COLUMNS ARE THE SAME SO DROP 1

ALTER TABLE [Texas_Data].[dbo].[ltcosmos]
DROP COLUMN NAME


-- CHECK IF ALL LICENSE NUMBERS ARE EITHER 6 OR 7 DIGITS

 SELECT  *
  FROM [Texas_Data].[dbo].[ltcosmos]
  WHERE LEN(LICENSE_NUMBER) != 6 AND LEN(LICENSE_NUMBER) != 7


--   CHECK IF COUNTY AND BUSINESS COUNTY COLUMNS ARE THE SAME
SELECT  *
  FROM [Texas_Data].[dbo].[ltcosmos]
  WHERE COUNTY != BUSINESS_COUNTY

--   BOTH COLUMNS ARE THE SAME SO DROP 1

  ALTER TABLE [Texas_Data].[dbo].[ltcosmos]
  DROP COLUMN COUNTY




-- extract the years from the LICENSE_EXPIRATION_DATE
ALTER TABLE [Texas_Data].[dbo].[ltcosmos]
ADD Expiration_YEAR VARCHAR(50);
 
UPDATE [Texas_Data].[dbo].[ltcosmos]
SET Expiration_YEAR = YEAR(LICENSE_EXPIRATION_DATE);


-- Hurray clean data!!!!!!!!!!!!!!!!!!!!!!!!!!!!!