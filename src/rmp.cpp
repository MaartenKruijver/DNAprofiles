#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector Zrmpcpp(IntegerMatrix db, NumericMatrix f) {  
  // simple rmp function that is fast, but does not support theta or cmp
  // expects allele frequencies as a matrix
  // allele 5 at locus 3 is at f[5-1,3-1]
  // will crash when alleles are outside the bounds of f, so check in R!
  
  int nloci = db.cols()/2;
  int ndb = db.rows();
  int a,b;
  double fa,fb,c;
  
  NumericVector ret(ndb);
  ret.fill(1);

  for(int l=0;l<nloci;l++){
    for(int j=0;j<ndb;j++){
      a = db(j,2*l); b= db(j,2*l+1);
      fa = (a == NA_INTEGER ? 1. : f(a-1,l));
      fb = (b == NA_INTEGER ? 1. : f(b-1,l));
      
      c = (((a!=b)&&(a != NA_INTEGER)) ? 2. : 1.); // heterozygous -> *2
      ret(j) = ret(j) * fa * fb * c ; 
    }
  }
  
  return ret;
}