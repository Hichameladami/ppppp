nearest_neighbor_R=function(matrice_couts,ville_depart)
{
  C=matrice_couts # matrice des couts : ville de depart en ligne et ville d'arriv?e en colonne
  V=ville_depart # initialisation ville de d?part
  Trajet=c(V) # vecteur enregistrera le trajet du voyageur
  Cout_total=0

  # Determination du trajet du voyageur et le cout associ?

  for (i in 2:nrow(C))
  {
    C[,V]=1/0
    V=which.min(C[V,])
    Trajet=c(Trajet,V)
    Cout_total= Cout_total + matrice_couts[Trajet[i-1],Trajet[i]]
  }

  Trajet=c(Trajet,ville_depart)

  Cout_total = Cout_total + matrice_couts[Trajet[nrow(C)],ville_depart]

  # Retourner les resultats
  return_list=list(Trajet,Cout_total)
  names(return_list)=c("Trajet","Cout")
  return(return_list)
}
