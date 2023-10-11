-- creating new database
--create database nashville;

-- using nashville
use nashville;

-- Getting a glance at the data
select * 
from nashville.dbo.nashville_housing;


-- total data in the table
select count(*)
from nashville_housing;


-- change date in table
--select SaleDate, convert(Date,SaleDate) 
--from nashville_housing;

-- Years of data at hand
select MAX(YearBuilt) - MIN(YearBuilt) as Years_of_data_at_hand 
from nashville_housing;




-- Cleaning the data
select * 
from nashville_housing
where PropertyAddress is null;

select a.ParcelID,a.PropertyAddress,b.ParcelID, b.PropertyAddress, iSNULL(a.PropertyAddress, b.PropertyAddress)
from nashville_housing a 
join nashville_housing b 
on a.ParcelID = b.ParcelID
and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null;

UPDATE a --use alias when using update with joins
set PropertyAddress = iSNULL(a.PropertyAddress, b.PropertyAddress)
from nashville_housing a 
join nashville_housing b 
on a.ParcelID = b.ParcelID
and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null;


-- Property Address Column
Select substring(PropertyAddress, 1, charindex(',',PropertyAddress)-1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, len(PropertyAddress)) as City
from nashville_housing;

alter table nashville_housing
add Property_Address nvarchar(255);

alter table nashville_housing
add Property_City nvarchar(255);

update nashville_housing
set Property_Address = substring(PropertyAddress, 1, charindex(',',PropertyAddress)-1)

update nashville_housing
set Property_City = substring(PropertyAddress,charindex(',',PropertyAddress)+ 1, len(PropertyAddress))


--select Property_Address, Property_City 
--from nashville_housing;


-- Owners Address Column
select count(*) 
from nashville_housing
where OwnerAddress is null;


select SUBSTRING(OwnerAddress, 1,CHARINDEX(',',OwnerAddress)-1) as Address,
SUBSTRING(OwnerAddress, CHARINDEX(',',OwnerAddress)+1,len(SUBSTRING(OwnerAddress, 1,CHARINDEX(',',OwnerAddress)-1))) as City
--SUBSTRING(OwnerAddress,len(SUBSTRING(OwnerAddress, CHARINDEX(',',OwnerAddress)+1,len(OwnerAddress))) + 1,len(OwnerAddress)) as State
from nashville_housing;


select 
parsename(replace(OwnerAddress,',','.'),3) as Address,
parsename(replace(OwnerAddress,',','.'),2) as City,
parsename(replace(OwnerAddress,',','.'),1) as State
from nashville_housing;


alter table nashville_housing
add Owner_Address nvarchar(255);

alter table nashville_housing
add Owner_City nvarchar(255);

alter table nashville_housing
add Owner_State nvarchar(255);


update nashville_housing
set Owner_Address = PARSENAME(replace(OwnerAddress,',','.'),3);

update nashville_housing
set Owner_City = PARSENAME(replace(OwnerAddress,',','.'),2);

update nashville_housing
set Owner_State = PARSENAME(replace(OwnerAddress,',','.'),1);



-- Sold as Vacant Column
select count(SoldAsVacant), SoldAsVacant
from nashville_housing
group by SoldAsVacant;


update nashville_housing
set SoldAsVacant = Convert(varchar(100),SoldAsVacant);

UPDATE nashville_housing
SET SoldAsVacant = CASE
    WHEN SoldAsVacant = 1 THEN 1   -- Update to 1 (true) if currently 1
    WHEN SoldAsVacant = 0 THEN 0   -- Update to 0 (false) if currently 0
    ELSE SoldAsVacant
END;

UPDATE nashville_housing
SET SoldAsVacant = CASE
    WHEN SoldAsVacant = '1' THEN 'Yes'
    WHEN SoldAsVacant = '0' THEN 'No'
    END;


-- Not a standard practice to delete the duplicates ... however this is how you can do it

with ROW_CTE as (
select *, 
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 order by
				 UniqueID)  row_num
from nashville_housing;