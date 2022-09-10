class OldSchema:
    
    #all tables
    allTables=""
    allTablesList=[]
    allTablesCreate={}
    allTablesColumns={}
    #refernce tables
    refTables="_avantages_pro,_bus_managment,_bus_managment_log,_bus_vivier_candidature,_bus_vivier_folder,_collab_evaluate_user_1,_collab_evaluate_user_2,"\
    "_collab_evaluate_user_3,_collab_external_comment,_collab_external_invitation,_collab_external_suggestion,_comments,_conf_pref,_crawled_jobs,_disponibilite,"\
    "_evaluation_grid_1,_evaluation_grid_2,_evaluation_grid_3,_evaluators_suggestion,_interview_schedule,_job_advert_state,_lang_niv,_langues,_needed_emails_for_a_job,"\
    "_questionnaire_segmentexperience,_ref_docs,_rh_emails,_tags_of_jobs,_user_photos,_user_types,_video_diff_qestion_map,accounts,admpass,"\
    "app_chat_conversations,appparams,bonsdecommandes,boostedjoboffers,bot_conversations,bus_logo,candidates_survey_question,collabs_joining_interview,contact_of_business,"\
    "diff_interview_schedule,emails_preferences,etabl_formation_associated_tags,etablissement_formation,extra_docs_needed_for_application,formation_session_has_tags,"\
    "inter_categories,inviteemailforapplication,jb_contrat,jb_exp,jobfair_businesses,jobfair_interviewinvitation,jobfair_room_map,linkedin_sourcing,linkedingvivierskills,"\
    "liste_type_diplomes,livemeeting_email_invitations,livemeeting_rooms,logjobclicks,need_skill_for_quiz,notifications,offer_assign_collab,optionsselling,orderpromo,pays,"\
    "quiz_answer,quiz_answer_logs,quiz_collab_rating,quiz_details,quiz_invitation,quiz_levels,quiz_question,quiz_question_logs,quiz_questions_images,quiz_results,quiz_types,"\
    "quiz_user_answer,rejectionfeedbacklist,secteur_acrivitees,sessions_etabliss_formation,singlecommandeitem,skill_roots,skyperooms,targeting,tbl_questionnaire,"\
    "tel_interview_schedule,user_bus_affinity,user_creds,user_follow_business,user_invit_business,user_like_job,user_poste_affinity,user_resumes,user_save_job,userpreferdcountries,"\
    "users_jobs_score,videodifffsingelquestionvideos,userreview,reviews_answers"
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

