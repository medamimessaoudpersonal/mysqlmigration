# importing required libraries
from subprocess import check_output
import sys
import mysql.connector
from new_schema import NewSchema
from old_schema import OldSchema
from csvToSql import *
from datetime import datetime
from datetime import date

##################################################################################
##                                  CONSTANTS                                   ##
##################################################################################
#localhost
localHost="localhost"
localUser="root"
localPassword="toor"
localDb="fabskill"

#db to be created for the new version
devHost="fabskill-v2-cluster.cluster-ro-cl7av2d0ban8.eu-west-3.rds.amazonaws.com"
devUser="fabskill"
devPassword="Aneti1407!"
devDb1="fabskill"
devDb2="fabskillprod"

#db of the current prod
prodHost="main-db-fabskill-fabevent.mysql.database.azure.com"
prodUser="fabskill@main-db-fabskill-fabevent"
prodPassword="fabat2.0.1.7tn!#$"
prodDb="fabskill"

##################################################################################
##                                   Driver                                     ##
##################################################################################
def connectServer(h,u,p,r=False):
    dbs=mysql.connector.connect(host=h,user=u,passwd=p,raw=r)
    return dbs 

def disconnectServer(dbs):
    dbs.close()

def extractRefTables():
    command=""
    a=check_output(command,shell=True).decode()
    print(a)

def selectDb(dbs,db):
    cursorObject=dbs.cursor()
    command=f"use {db}"
    print(command)
    cursorObject.execute(command)

def createNewDb(dbs,db):
    cursorObject=dbs.cursor()
    command=f"CREATE DATABASE IF NOT EXISTS {db} DEFAULT CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_general_ci'"
    print(command)
    cursorObject.execute(command)

def showTables(dbs,db,schema=None):
    tables=""
    creates={}
    columns={}
    aff=None
    if(schema=="new"):
        aff=NewSchema()
    else:
        aff=OldSchema()
    selectDb(dbs,db)
    cursorObject=dbs.cursor()
    cursorObject.execute("show tables")
    result = cursorObject.fetchall()
    for x in result:
       tables=tables+f"{x[0]},"
       cursorObject.execute(f"show create table {x[0]}")
       result2=cursorObject.fetchall()
       creates[result2[0][0]]=result2[0][1]
       cursorObject.execute(f"SHOW COLUMNS FROM {db}.{x[0]}")
       result3=cursorObject.fetchall()
       az=list()
       for y in range(len(result3)):
           az.append(result3[y][0])
       columns[x[0]]=az
    tables=tables[ :len(tables)-1: ]
    aff.completeInit(tables,creates,columns)
    return aff

def selectAllFromTable(dbs,db,table,limit=None,offset=None):
    if limit==None:
        limit=1000000
    if offset==None:
        offset=0
    s=""
    selectDb(dbs,db)
    cursorObject=dbs.cursor()
    sql=f"SELECT * FROM {table} LIMIT {limit} OFFSET {offset}"
    cursorObject.execute(sql)
    result = cursorObject.fetchall()
    for x in result:
        a=[]
        for y in range(len(x)):
            if isinstance(x[y],datetime):
                a.append(x[y].strftime("%Y-%m-%d %H:%M:%S"))
            elif isinstance(x[y],date):
                a.append(x[y].strftime("%Y-%m-%d"))
            else:
                a.append(f"{x[y]}".replace("'","`").replace('"','`'))
        s+=f"{a}".replace("[","").replace("]","").replace("'",'"').replace('None','NULL').replace(", ",",").replace("`","'")+"\r\n"
    return s

def selectSql(dbs,db,table,sql):
    s=""
    selectDb(dbs,db)
    cursorObject=dbs.cursor()
    cursorObject.execute(sql)
    result = cursorObject.fetchall()
    for x in result:
        a=[]
        for y in range(len(x)):
            if isinstance(x[y],datetime):
                a.append(x[y].strftime("%Y-%m-%d %H:%M:%S"))
            elif isinstance(x[y],date):
                a.append(x[y].strftime("%Y-%m-%d"))
            else:
                a.append(f"{x[y]}".replace("'","`").replace('"','`'))
        s+=f"{a}".replace("[","").replace("]","").replace("'",'"').replace('None','NULL').replace(", ",",").replace("`","'")+"\r\n"
    return s


##################################################################################
##                        Command-line interface                                ##
##################################################################################
try:
    a=sys.argv[1]
    print('argument passed')
except:
    print('No choice passed')
    exit()

if(sys.argv[1]=="createDb"):
    print("entring createDb")
    ldbs=connectServer(localHost,localUser,localPassword)
    createNewDb(ldbs,localDb)
    ldbs.close()
    exit()

if(sys.argv[1]=="createSchema"):
    print("entring createSchema")

    dbs=connectServer(devHost,devUser,devPassword)
    aff=showTables(dbs,devDb1,"new")
    resp=check_output(f"rm -rf dump/dev/*",shell=True).decode()
    
    schema=aff.printStringStructure("all")
    f = open("dump/dev/schema.txt", "a")
    f.write(schema)
    f.close()
    
    #sql=aff.printCreateTables("entry")
    #f = open("dump/dev/entryTables.sql", "a")
    #f.write(sql)
    #f.close()

    print(f"dumping database from {devHost}")
    resp=check_output(f"mysqldump --no-data --column-statistics=0 -u {devUser} -p -h {devHost} {devDb1} {aff.entryTables.replace(',',' ')} > dump/dev/entryTables.sql",shell=True).decode()

    print(f"dumping database from {devHost}")
    resp=check_output(f"mysqldump --column-statistics=0 -u {devUser} -p -h {devHost} {devDb1} {aff.refTables.replace(',',' ')} > dump/dev/refTables.sql",shell=True).decode()

    dbs.close()

    #resp=check_output(f"sed 's/\sDEFINER=`[^`]*`@`[^`]*`//g' -i dump/dev/refTables.sql",shell=True).decode()
    #print(resp)
    
    dbs.close()

    print(f"importing reference table to {localHost}")
    resp=check_output(f"mysql -u {localUser} -p -h {localHost}  {localDb} < dump/dev/refTables.sql",shell=True).decode()

    print(f"importing entry schemas to {localHost}")
    resp=check_output(f"mysql -u {localUser} -p -h {localHost}  {localDb} < dump/dev/entryTables.sql",shell=True).decode()

    print(f"apply changes to schemas to {localHost}")
    resp=check_output(f"mysql -u {localUser} -p -h {localHost}  {localDb} < changesToSchema.sql",shell=True).decode()

    print(f"generate schema db {localHost}")
    
    exit()

if(sys.argv[1]=="dumpProd"):
    print("entring dumpProd")
    dbs=connectServer(prodHost,prodUser,prodPassword)
    aff=showTables(dbs,prodDb,"old")
    dbs.close();
    resp=check_output(f"rm -rf dump/prod/*",shell=True).decode()
    
    #print schema
    schema=aff.printStringStructure("entry")
    f = open("dump/prod/schemaProd.txt", "a")
    f.write(schema)
    f.close()

    dbs=connectServer(prodHost,prodUser,prodPassword)
    for x in aff.entryTablesList:
        csv=selectAllFromTable(dbs,prodDb,x)
        f = open(f"dump/prod/{x}.csv", "a")
        header=f"{aff.allTablesColumns[x]}".replace("[","").replace("]","").replace(", ",",").replace("'",'"')+"\r\n"
        f.write(header)
        f.write(csv[:len(csv)-2:])
        f.close()
    dbs.close()

    #copy cvs of users
    sql="select user_resumes.UserId,user_resumes.absUrl,user_resumes.dateOf FROM user_resumes LEFT JOIN (SELECT UserId, MAX(dateOf) as latestcv from `user_resumes` GROUP BY UserId) tt ON user_resumes.UserId=tt.UserId AND tt.latestcv=user_resumes.dateOf WHERE tt.latestcv=user_resumes.dateOf ORDER by user_resumes.UserId"
    dbs=connectServer(prodHost,prodUser,prodPassword)
    csv=selectSql(dbs,prodDb,'user_resumes',sql)
    f = open(f"dump/prod/user_resumes.csv", "a")
    header=f'"UserId","absUrl","dateOf"\r\n'
    f.write(header)
    f.write(csv[:len(csv)-2:])
    f.close()
    dbs.close()

    #copy userreview
    sql="SELECT * FROM `userreview` WHERE (idBusiness in (SELECT _bus_pages.idEntry FROM _bus_pages) OR idBusiness=0) AND idUser IN (SELECT user.UserId FROM user)"
    dbs=connectServer(prodHost,prodUser,prodPassword)
    csv=selectSql(dbs,prodDb,'userreview',sql)
    f = open(f"dump/prod/userreview.csv", "a")
    header=f'"id","idBusiness","type","idUser","dateOf"\r\n'
    f.write(header)
    f.write(csv[:len(csv)-2:])
    f.close()
    dbs.close()

    #copy cvs of reviews_answers
    sql="SELECT * FROM `reviews_answers` WHERE idReview IN (SELECT userreview.id FROM `userreview` WHERE (userreview.idBusiness in (SELECT _bus_pages.idEntry FROM _bus_pages) or userreview.idBusiness=0) AND userreview.idUser IN (SELECT user.UserId FROM user))"
    dbs=connectServer(prodHost,prodUser,prodPassword)
    csv=selectSql(dbs,prodDb,'reviews_answers',sql)
    f = open(f"dump/prod/reviews_answers.csv", "a")
    header=f'"idEntry","idReview","idQuestion","Rating","dateOf","deleted"\r\n'
    f.write(header)
    f.write(csv[:len(csv)-2:])
    f.close()
    dbs.close()
    
    exit()

if(sys.argv[1]=="importData"):
    print("entring importData")
    dbs=connectServer(prodHost,prodUser,prodPassword)
    old=showTables(dbs,prodDb,"old")
    dbs.close()

    ldbs=connectServer(localHost,localUser,localPassword)
    new=showTables(ldbs,localDb,"new")
    ldbs.close()

    resp=check_output("rm -rf insertData.sql",shell=True).decode()
    
    #sql=csvToSql(old.entryTablesColumns['user'],new.entryTablesColumns['user'],'user')
    ordredlist=['regions','tags','user','_user_details','noms_de_metiers','liste_formations','nom_de_societe','universites','_bus_pages','_job_offers',
    '_lang_of_users','_job_experience','_needed_advantages_for_a_job','_needed_diplome_for_a_job','_needed_langages_for_a_job','_needed_skills_for_a_job',
    '_photos_bus_cover','_tags_of_users','_team_photo_quotes','_user_candidature_job','_user_interests','_user_certifications','_usersummary',
    '_user_formation','_tasks_of_users','business_videos','businesspagestats','candidaturestatechangelog','centraliseallnotificationscandidature',
    'feedbackevaluation','jobofferstats','pitchvideometa','pitchvideos','pretentionssalariales','redirectlog','user_role_business',
    'questionslibrary','questionnaires','_questionnaire_questions','userreview','reviews_answers']
    numberTables=len(ordredlist)
    print("number of tables to be imported: "+f'{numberTables}')
    sql=fullSql(old.entryTablesColumns,new.entryTablesColumns,ordredlist)
    
    f = open(f"insertData.sql", "a")
    f.write(sql)
    dbs.close()

    print(f"inseting data into {localHost}")
    command=f"mysql -u {localUser} -p -h {localHost} {localDb} < ./insertData.sql"
    #resp=check_output(command,shell=True).decode()
    print(command)

if(sys.argv[1]=="intersection"):
    print("entring intersection")
    dbs=connectServer(prodHost,prodUser,prodPassword)
    old=showTables(dbs,prodDb,"old")
    dbs.close();
    resp=check_output(f"rm -rf dump/prod/schemaProd.txt",shell=True).decode()
    
    #print schema
    schema=old.printStringStructure("all")
    f = open("dump/prod/schemaProd.txt", "a")
    f.write(schema)
    f.close()

    dbs=connectServer(devHost,devUser,devPassword)
    new=showTables(dbs,devDb1,"new")
    dbs.close();
    resp=check_output(f"rm -rf dump/dev/entryTables.txt",shell=True).decode()

    schema=new.printStringStructure("entry")
    f = open("dump/dev/entryTables.txt", "a")
    f.write(schema)
    f.close()

    s=""
    for x in old.allTablesList:
        if x.lower() not in new.entryTablesList:
            s+=f"{x},"
    print(s)
    exit()