SELECT
 -- Identifiant de la transaction
 t.transaction_id,
 -- Attributs de la dimension date
 d.date AS date_transaction,
 d.jour,
 d.numero_mois,
 d.trimestre,
 d.annee,
 -- Client
 t.client_id,
 c.segment_client,
 c.ville AS ville_client,
 c.region AS region_client,
 -- Produit
 t.produit_id,
 p.nom_produit,
 p.categorie_produit,
 p.sous_categorie,
 p.marque,
 -- Point de vente
 t.point_vente_id,
 pv.nom_point_vente,
 pv.type_point_vente,
 pv.ville AS ville_point_vente,
 pv.region AS region_point_vente,
 pv.canal,
 -- Type d'opération
 t.type_operation_id,
 o.type_operation,
 o.categorie_operation,
 o.impact_ca,
 -- Métriques
 t.quantite,
 t.montant_brut,
 t.remise,
 t.remboursement,
 t.montant_net,
 t.montant_encaisse,
 t.statut_transaction
FROM `simplon03.Novatel.vw_transactions_clean` AS t
LEFT JOIN `simplon03.Novatel.Client` AS c ON t.client_id
= c.client_id
LEFT JOIN `simplon03.Novatel.produits` AS p ON t.produit_id
= p.produit_id
LEFT JOIN `simplon03.Novatel.Points_de_vente` AS pv ON t.point_vente_id
= pv.point_vente_id
LEFT JOIN `simplon03.Novatel.date` AS d ON t.date_id
= d.date_id
LEFT JOIN `simplon03.Novatel.type_operation_propre` AS o ON
t.type_operation_id = o.type_operation_id