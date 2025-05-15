# Applied macroeconomic modelling (ENSAE 3A)

Les données sont appelées à l'aide du fichier call_dbnomics. 
Pour charger les données françaises, exécuter `myobs_FR`. 
Pour charger les données allemandes, exécuter `myobs_DE`.

Le code pour le traçage des graphes est dans `draw_tables`.

Pour l'estimation du modèle et la génération des figures du modèle France, le paramètre gamma étant estimé : exécuter `dynare unemployment_NK_FR_calib`. 
Pour l'estimation du modèle et la génération des figures du modèle Allemagnele paramètre gamma étant estimé : exécuter `dynare unemployment_NK_DE_calib`.
Pour l'estimation du modèle et la génération des figures du modèle France, le paramètre gamma étant fixé: exécuter `dynare unemployment_NK_FR_deltaNfixed`. 
Pour l'estimation du modèle et la génération des figures du modèle Allemagnele paramètre gamma étant fixé: exécuter `dynare unemployment_NK_DE_deltaNfixed`.  
