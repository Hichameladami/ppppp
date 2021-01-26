#include <Rcpp.h>
using namespace Rcpp;
#include <bits/stdc++.h>
#include <iostream>
#include <vector>
#include <limits>
#include <array>

using namespace std;

// [[Rcpp::export]]
/*void*/ float nearest_neighbor_cpp(NumericMatrix matrice_couts,int ville_depart)
{
  int N=matrice_couts.nrow();
  int Trajet[N+1];/* Trajet du voyageur */
  Trajet[0]=ville_depart;
  float Cout_total=0;
  int v=ville_depart,i,j,min_index;

  NumericMatrix C(N,N); /* Copie de la matrice des couts */
  for (i=0;i<N;i++)
  {
    for (j=0;j<N;j++)
    {
      C(i,j)=matrice_couts(i,j);
    }
  }

  /* Determination du trajet du voyageur et le cout associ? */

  /*Rprintf("%d-->",Trajet[0]);*/
  for (i=1;i<N;i++)
  {
    for (j=0;j<N;j++)
    {
      C(j,v)=std::numeric_limits<float>::infinity();/* une fois une ville est visit?e la colonne associ?e est remplac?e par +00*/
    }

    min_index=0; /* l'indice de la ville la plus proche de v */
    for (j=0; j<N; j++)
    {
      if(C(v,j)<C(v,min_index)) min_index=j;
    }

    v=min_index;
    Trajet[i]=v;
    /*Rprintf("%d-->",Trajet[i]);*/
    Cout_total+= matrice_couts(Trajet[i-1],Trajet[i]);

  }
  Trajet[N]=ville_depart;
  /*Rprintf("%d\n",Trajet[N]);*/
  Cout_total+= matrice_couts(Trajet[N-1],ville_depart);
  /*Rprintf("le cout_total est: %f",Cout_total);*/
  return Cout_total;
}
