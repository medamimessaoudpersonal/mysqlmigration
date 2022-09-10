def _s(ff):
    if ff=="None":
        ff="NULL"
    return ff

def update(tableToRead,tableToWrite,column,condition,rankColumn,rankCondidtion):
    file = open(f'dump/prod/{tableToRead}.csv','r')
    lines = file.readlines()
    s=""
    for line in lines[1:len(lines):]:
        ch=line[:len(line)-1:]
        chs=ch.split('",')
        ch=f'UPDATE {tableToWrite} SET {column} = {chs[rankColumn]}" WHERE {condition} = {chs[rankCondidtion]}";\r\n'.replace('"NULL"','NULL')
        s+=ch
    return s

def csvToSql(oldVector,newVector,table):
    if(table=='questionslibrary'):
        file = open(f'dump/prod/_questionslibrary.csv','r')
    else:
        file = open(f'dump/prod/{table}.csv','r')
    lines = file.readlines()
    if table=="regions":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="questionslibrary":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="tags":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="businesspagestats":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="business_videos":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_bus_pages":
        s=''
        a=f"{newVector}".replace("[","(").replace("]",")").replace("'","`")
        s+=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            ch=f'({chs[0]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[8]}",{chs[10]}",{chs[11]}",{chs[12]}",{chs[13]}",{chs[15]}",{chs[16]}",{chs[17]}",{chs[18]}",{chs[19]}",{chs[20]}",{chs[21]}",{chs[30]}",{chs[31]}",{chs[32]}",{chs[33]}),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        ch=f'({chs[0]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[8]}",{chs[10]}",{chs[11]}",{chs[12]}",{chs[13]}",{chs[15]}",{chs[16]}",{chs[17]}",{chs[18]}",{chs[19]}",{chs[20]}",{chs[21]}",{chs[30]}",{chs[31]}",{chs[32]}",{chs[33]});\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="candidaturestatechangelog":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="centraliseallnotificationscandidature":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="feedbackevaluation":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_job_experience":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            contract=chs[10].replace('0','7')
            ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[8]}",{chs[9]}",{contract}),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        contract=chs[10].replace('0','7')
        ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[8]}",{chs[9]}",{contract});\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="_job_offers":
        s=''
        s+=f"INSERT INTO {table}(`idEntry`, `idPage`, `custom_title`, `ref_inter`, `jobTitle`, `secteur`, `pays`, `region`, `typeContrat`, `exp`, `min`, `max`, `dep_nat`, `dep_int`, `Date_creation`, `status`, `created_by`, `text`, `disponibilite`, `Diffusion`, `visuel`, `Date_Fin`)\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[8]}",{chs[9]}",{chs[10]}",{chs[11]}",{chs[12]}",{chs[13]}",{chs[15]}",{chs[16]}",{chs[17]}",{chs[18]}",{chs[20]}",{chs[21]}",{chs[22]}",{chs[23]}"),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[8]}",{chs[9]}",{chs[10]}",{chs[11]}",{chs[12]}",{chs[13]}",{chs[15]}",{chs[16]}",{chs[17]}",{chs[18]}",{chs[20]}",{chs[21]}",{chs[22]}",{chs[23]}");\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="jobofferstats":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_lang_of_users":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="liste_formations":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_needed_advantages_for_a_job":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_needed_diplome_for_a_job":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            chs=ch.split(',')
            idjob=chs[1]
            if(idjob!='"0"'):
                s+=f"({chs[0]},{chs[1]},{chs[2]}),\r\n"
        ch=lines[len(lines)-1][:len(lines[len(lines)-1]):]
        chs=ch.split(',')
        idjob=chs[1]
        if(idjob!='"0"'):
            s+=f"({chs[0]},{chs[1]},{chs[2]});\r\n"
        else:
            s=s[:len(s)-3:]+';\r\n'
        return s
    if table=="_needed_langages_for_a_job":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            chs=ch.split(',')
            idjob=chs[1]
            if(idjob!='"0"'):
                s+=f"({chs[0]},{chs[1]},{chs[2]}),\r\n"
        ch=lines[len(lines)-1][:len(lines[len(lines)-1]):]
        chs=ch.split(',')
        idjob=chs[1]
        if(idjob!='"0"'):
            s+=f"({chs[0]},{chs[1]},{chs[2]});\r\n"
        else:
            s=s[:len(s)-3:]+';\r\n'
        return s
    if table=="_needed_skills_for_a_job":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=''
        s+=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            chs=ch.split(',')
            idjob=chs[1]
            if(idjob!='"0"'):
                s+=f"({chs[0]},{chs[1]},{chs[2]}),\r\n"
        ch=lines[len(lines)-1][:len(lines[len(lines)-1]):]
        chs=ch.split(',')
        idjob=chs[1]
        if(idjob!='"0"'):
            s+=f"({chs[0]},{chs[1]},{chs[2]});\r\n"
        else:
            s=s[:len(s)-3:]+';\r\n'
        return s
    if table=="nom_de_societe":
        s="\r\n"
        s+=f"INSERT INTO {table}(`id`, `name`, `logo`, `idcountry`, `pond`)\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[8]}),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[8]});\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="noms_de_metiers":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_photos_bus_cover":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="pitchvideometa":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="pitchvideos":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="pretentionssalariales":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_questionnaire_questions":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="questionnaires":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="redirectlog":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="reviews_answers":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_tags_of_users":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        s+="UPDATE _tags_of_users SET type = 'cvparsing' WHERE type = '-1';"
        return s
    if table=="_tasks_of_users":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            chs[2]=chs[2][:min(len(chs[2])-1,255):]+'"'
            ch=f'({chs[0]}",{chs[1]}",{chs[2]}),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        chs[2]=chs[2][:min(len(chs[2])-1,255):]+'"'
        ch=f'({chs[0]}",{chs[1]}",{chs[2]});\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="_team_photo_quotes":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="universites":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_user_candidature_job":
        s=f"INSERT INTO _user_candidature_job(`IdEntry`, `UserId`, `id_Job_Offer`, `date`, `state`, `lastEmailedForPitch`)\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[6]}),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        ch=f'({chs[0]}",{chs[1]}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[6]});\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="_user_certifications":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="user":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_user_details":
        s="\r\n"
        s+=f"INSERT INTO {table}(`UserId`, `situation`, `ExperienceID`, `UserPhone`, `UserEmail`, `UserCountryId`, `UserRegionId`, `TextAdress`, `Date_Naiss`, `verified`, `Nationalitee`, `lastEmailed`)\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            situation=f'{chs[1]}'.replace('2','3')
            ch=f'({chs[0]}",{situation}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[9]}",{chs[10]}",{chs[12]}",{chs[14]}"),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        situation=f'{chs[1]}'.replace('2','3')
        ch=f'({chs[0]}",{situation}",{chs[2]}",{chs[3]}",{chs[4]}",{chs[5]}",{chs[6]}",{chs[7]}",{chs[9]}",{chs[10]}",{chs[12]}",{chs[14]}");\r\n'.replace('"NULL"','NULL')
        s+=ch
        s+=f"\r\n#inserting resumes into {table}\r\n"
        s+=update("user_resumes",table,"cv_url","UserId",1,0)
        return s
    if table=="_user_formation":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_user_interests":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:]
            chs=ch.split('",')
            chs[1]=chs[1][:min(len(chs[1])-1,255):]
            ch=f'({chs[0]}",{chs[1]}",{chs[2]}),\r\n'.replace('"NULL"','NULL')
            s+=ch
        ch=f"{lines[len(lines)-1][:len(lines[len(lines)-1]):]}"
        chs=ch.split('",')
        chs[1]=chs[1][:min(len(chs[1]),255):]
        ch=f'({chs[0]}",{chs[1]}",{chs[2]});\r\n'.replace('"NULL"','NULL')
        s+=ch
        return s
    if table=="userreview":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="user_role_business":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s
    if table=="_usersummary":
        a=f"{oldVector}".replace("[","(").replace("]",")").replace("'","`")
        s=f"INSERT INTO {table}{a}\r\n"
        s+="VALUES\r\n"
        #for line in lines[1:len(lines):]:
        for line in lines[1:len(lines)-1:]:
            ch=line[:len(line)-1:].replace('"NULL"','NULL')
            s+=f"({ch}),\r\n"
        s+=f"({lines[len(lines)-1][:len(lines[len(lines)-1]):]});\r\n".replace('"NULL"','NULL')
        return s

def fullSql(listOldVectors,listNewVectors,tables):
    s=""
    for x in tables:
        s+=f"# inserting data into {x}\r\n"
        if(x=='questionslibrary'):
            s+=csvToSql(listOldVectors['_questionslibrary'],listNewVectors[x],x)
        elif(x=='userreview'):
            s+=csvToSql(["id","idBusiness","type","idUser","dateOf"],["id","idBusiness","type","idUser","dateOf"],"userreview")
        elif(x=='reviews_answers'):
            s+=csvToSql(["idEntry","idReview","idQuestion","Rating","dateOf","deleted"],["idEntry","idReview","idQuestion","Rating","dateOf","deleted"],"reviews_answers")
        else:
            s+=csvToSql(listOldVectors[x],listNewVectors[x],x)
    return s