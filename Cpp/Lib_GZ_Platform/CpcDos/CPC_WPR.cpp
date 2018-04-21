/*
	******************* ENTETE *******************
	
             ===== ========================== =====
    ============= ******** Wrapper ********* =============
 ================  Cpcdos OSx & CPinti Core  ================
    ============= ************************** =============
            ===== ========================== =====

			Auteur Sebastien FAVIER
	  Contributeur Vous!
	
	  Copyright (c) microsf01
	  http://cpcdos.fr.nf/
	  
 Condition :
	Ce fichier réservé uniquement aux adhérants du developpement C/C++ 
	du noyau. Pour toutes questions : sebastien.ordinateur@hotmail.fr

 Description :
	Header/Wrapper du noyau Cpcdos & CPinti Core pour la programmation 
	C/C++ de modules externe. Ceci va permettre aux adhérants de créer 
	des fonctions native pour cpcdos. Il s'agit d'un header qui 
	contient la liste des fonctions de Cpcdos dont le developpeur aura 
	besoin pour developper ses fonction afin qu'il soit nativement  
	dependant des fonctions du noyau sans passer par le CpcdosC+.
	
		Creation le 25 avril 2016
							
		Mise a jour le 29 Septembre 2016

*/

#include "CPC_WPR.h"
#include "stdio.h"

#ifndef InCpcDosCore
	
	//CpcDos Instance & Object
	CpcdosOSx_CPintiCore CpcDosHolder;
	CpcdosOSx_CPintiCore* CpcDos = &CpcDosHolder;
	
	
	FUNC_cpc_Creer_Contexte 				cpc_Creer_Contexte 				= 0;
	FUNC_cpc_Obtenir_Zone_Contexte 			cpc_Obtenir_Zone_Contexte 		= 0;
	FUNC_cpc_Blitter 						cpc_Blitter 					= 0;
	FUNC_cpc_CCP_Exec_Commande 				cpc_CCP_Exec_Commande			= 0;
	FUNC_cpc_CCP_Exec_Thread_cpc 			cpc_CCP_Exec_Thread_cpc 		= 0;
	FUNC_cpc_Exec_en_cours 					cpc_Exec_en_cours 				= 0;
	FUNC_cpc_cpinti_debug_cpinticore 		cpc_cpinti_debug_cpinticore 	= 0;
	FUNC_cpc_cpinti_Fichier_Existe 			cpc_cpinti_Fichier_Existe 		= 0;
	FUNC_cpc_cpinti_Taille_Fichier 			cpc_cpinti_Taille_Fichier 		= 0;
	FUNC_cpc_cpinti_Lire_Fichier_complet 	cpc_cpinti_Lire_Fichier_complet = 0;
	FUNC_cpc_cpinti_sleep_us 				cpc_cpinti_sleep_us 			= 0;
	FUNC_cpc_cpinti_sleep_ms 				cpc_cpinti_sleep_ms 			= 0;
	FUNC_cpc_cpinti_sleep_sec				cpc_cpinti_sleep_sec 			= 0;
	FUNC_cpc_cpinti_Obtenir_Temps_ms 		cpc_cpinti_Obtenir_Temps_ms 	= 0;
	
	FuncTable CpcDosFuncTable[] = {
		
		{"cpc_Creer_Contexte", 				(PFUNC_)&cpc_Creer_Contexte },
		{"cpc_Obtenir_Zone_Contexte", 		(PFUNC_)&cpc_Obtenir_Zone_Contexte },
		{"cpc_Blitter", 					(PFUNC_)&cpc_Blitter },
		{"cpc_CCP_Exec_Commande", 			(PFUNC_)&cpc_CCP_Exec_Commande },
		{"cpc_CCP_Exec_Thread_cpc", 		(PFUNC_)&cpc_CCP_Exec_Thread_cpc },
		{"cpc_cpinti_debug_cpinticore", 	(PFUNC_)&cpc_cpinti_debug_cpinticore },
		{"cpc_Exec_en_cours", 				(PFUNC_)&cpc_Exec_en_cours },
		{"cpc_cpinti_Fichier_Existe", 		(PFUNC_)&cpc_cpinti_Fichier_Existe },
		{"cpc_cpinti_Taille_Fichier", 		(PFUNC_)&cpc_cpinti_Taille_Fichier },
		{"cpc_cpinti_Lire_Fichier_complet", (PFUNC_)&cpc_cpinti_Lire_Fichier_complet },
		{"cpc_cpinti_sleep_us", 			(PFUNC_)&cpc_cpinti_sleep_us },
		{"cpc_cpinti_sleep_ms", 			(PFUNC_)&cpc_cpinti_sleep_ms },
		{"cpc_cpinti_sleep_sec", 			(PFUNC_)&cpc_cpinti_sleep_sec },
		{"cpc_cpinti_Obtenir_Temps_ms", 	(PFUNC_)&cpc_cpinti_Obtenir_Temps_ms },
		
	};


	#ifdef GZ_tOverplace
		#include <string.h>
		#include "Lib_GZ/GZ.h"
		namespace Lib_GZ{extern gzPtrFuncRBoolPAny dValidateIniOverpace;}
		gzBool bValidateIniOverpace(void* _sOverPlace){
			
		printf("\nValidate : %s\n", (char*)_sOverPlace);

			if(bOnCpcDos){
				
				if(strcmp( (char*)_sOverPlace , "Lib_GZ_Windows") == 0){
						printf("\n-- Disable : %s\n", (char*)_sOverPlace);
					return false;
				}
				
			}else{ //OnWindows
				if(strcmp( (char*)_sOverPlace , "Lib_GZ_CpcDos") == 0){
						printf("\n-- Disable : %s\n", (char*)_sOverPlace);
					return false;
				}
			}
			return true;
		}
	#endif
	
	
	int nCpcVerMajor = 0;
	int nCpcVerMinor = 0;
	void cpc_Set_Version(int _nCpcVerMajor, int _nCpcVerMinor)
	{
		nCpcVerMajor = _nCpcVerMajor;
		nCpcVerMinor = _nCpcVerMinor;
	}

	#undef NELEMS
	#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

	bool fIniCpcDosFunctions()
	{
		#ifdef GZ_tOverplace
			 Lib_GZ::dValidateIniOverpace = &bValidateIniOverpace;
		#endif

		if(nCpcVerMajor > 0){ //We are on CpcDos
			for(unsigned int i = 0; i < NELEMS(CpcDosFuncTable); i++ ){
				*CpcDosFuncTable[i].dFunc =  (FUNC_) GetProcAddress(0, (char*)CpcDosFuncTable[i].sFuncName);		
			}
		}

			
		if(nCpcVerMajor > 0){ //We are on CpcDos
			return true;
		}
		return false;
	}
	bool bOnCpcDos = fIniCpcDosFunctions();

#endif





