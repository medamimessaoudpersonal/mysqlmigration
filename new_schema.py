class NewSchema:
    
    #all tables
    allTables=""
    allTablesList=[]
    allTablesCreate={}
    allTablesColumns={}
    #refernce tables
    refTables="accounts,candidates_survey_question,jb_contrat,jb_exp,liste_type_diplomes,pays,ref_social_providers,rejectionfeedbacklist,secteur_acrivitees,"\
        "_avantages_pro,_disponibilite,_job_advert_state,_langues,_lang_niv,_user_types,email_pipe"
    refTablesList=[]
    refTablesCreate={}
    refTablesColumns={}
    #entry tables
    entryTables=""
    entryTablesList=[]
    entryTablesCreate={}
    entryTablesColumns={}
    
    def __init__(self):
        self.refTablesList=self.refTables.split(",")
        for x in self.refTablesList:
            self.refTablesCreate[x]=None
            self.refTablesColumns[x]=None

    def completeInit(self,at,creates,columns):
        self.allTables=at
        self.allTablesList=self.allTables.split(",")
        self.allTablesCreate=creates
        self.allTablesColumns=columns
        for x in self.allTablesList:
            if x in self.refTablesList:
                self.refTablesCreate[x]=creates[x]
                self.refTablesColumns[x]=columns[x]
            else:
                self.entryTables=self.entryTables+f"{x},"
                self.entryTablesCreate[x]=creates[x]
                self.entryTablesColumns[x]=columns[x]
        self.entryTables=self.entryTables[ :len(self.entryTables)-1: ]
        self.entryTablesList=self.entryTables.split(",")

    def printTableStructure(self,table):
        a=f"{self.allTablesColumns[table]}"
        a=a.replace("[","")
        a=a.replace("]","")
        a=a.replace(" ","")
        return a
    
    def printStringStructure(self,choice):
        a=""
        alist=[]
        if choice=="all":
            alist=self.allTablesList
        if choice=="entry":
            alist=self.entryTablesList
        if choice=="ref":
            alist=self.refTablesList
        for x in alist:
            a+=f"{x}:{self.printTableStructure(x)}\r\n"
        a=a[ :len(a)-2: ]
        return a

    def printCreateTables(self,choice):
        a=""
        alist=[]
        if choice=="all":
            alist=self.allTablesList
        if choice=="entry":
            alist=self.entryTablesList
        if choice=="ref":
            alist=self.refTablesList
        for x in alist:
            a+=f"# create {x}\r\n{self.allTablesCreate[x]};\r\n\r\n"
        a=a.replace("COLLATE=utf8_unicode_ci","COLLATE=utf8mb4_general_ci")
        a=a.replace("CHARSET=latin1","CHERSET=utf8mb4")
        a=a.replace("CHARSET=utf8","CHARSET=utf8mb4")
        a=a[ :len(a)-4: ]
        return a

