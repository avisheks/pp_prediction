SET mapreduce.job.acl-view-job=*;
SET mapreduce.job.acl-modify-job=*;
SET mapred.job.queue.name=curveball_small;
SET mapred.reduce.tasks=100;


SET hivevar:IN_PATH=/Users/avishek2/pet_projects/kaggle_data/avazu_ctr_challenge/data;
SET hivevar:DB_NAME=kaggle;
SET hivevar:DB_PATH=/tmp/avishek2/${DB_NAME};



-------------------------------------------------------------------------------
--
-- Create Database
--
-----------------------------------------------------------------------------
DROP DATABASE IF EXISTS ${DB_NAME} CASCADE;
CREATE DATABASE IF NOT EXISTS ${DB_NAME}
LOCATION '${DB_PATH}';
USE ${DB_NAME};



-----------------------------------------------------------------------------
--
-- Create Table for training data
--
-----------------------------------------------------------------------------
SET hivevar:TB_NAME=avazu_train;
DROP TABLE ${DB_NAME}.${TB_NAME};
CREATE EXTERNAL TABLE ${DB_NAME}.${TB_NAME}
(
    ad_id 	            string,
    click            	int,
    hourstamp        	int,
    C1               	string,
    banner_pos 		    string,
    site_id 	        string,
    site_domain 	    string,
    site_category    	string,
    app_id    	        string,
    app_domain    	    string,
    app_category    	string,
    device_id    	    string,
    device_ip    	    string,
    device_model    	string,
    device_type    	    string,
    device_conn_type    string,
    C14                 string,
    C15                 string,
    C16                 string,
    C17                 string,
    C18                 string,
    C19                 string,
    C20                 string,
    C21                 string
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '${IN_PATH}/train'
TBLPROPERTIES ("skip.header.line.count"="1");
-------------------------------------------------------------------------------
---- Add partitions
-------------------------------------------------------------------------------
--MSCK REPAIR TABLE ${TB_NAME};



-----------------------------------------------------------------------------
--
-- Create Table for training data
--
-----------------------------------------------------------------------------
SET hivevar:TB_NAME=avazu_test;
DROP TABLE ${DB_NAME}.${TB_NAME};
CREATE EXTERNAL TABLE ${DB_NAME}.${TB_NAME}
(
    ad_id 	            string,
    hourstamp        	int,
    C1               	string,
    banner_pos 		    string,
    site_id 	        string,
    site_domain 	    string,
    site_category    	string,
    app_id    	        string,
    app_domain    	    string,
    app_category    	string,
    device_id    	    string,
    device_ip    	    string,
    device_model    	string,
    device_type    	    string,
    device_conn_type    string,
    C14                 string,
    C15                 string,
    C16                 string,
    C17                 string,
    C18                 string,
    C19                 string,
    C20                 string,
    C21                 string
)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '${IN_PATH}/test'
TBLPROPERTIES ("skip.header.line.count"="1");
-------------------------------------------------------------------------------
---- Add partitions
-------------------------------------------------------------------------------
--MSCK REPAIR TABLE ${TB_NAME};