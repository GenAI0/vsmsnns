# Define the class for variable selection methods
setClass(
  "VariableSelectionMethods",
  slots = list(
    # Filter methods parameters
    LW = "numeric",   # Loading weights
    RC = "numeric",   # Regression coefficients
    JT = "numeric",   # Jackknife testing
    VIP = "numeric",  # Variable importance in projection
    SR = "numeric",   # Selectivity ratio
    sMC = "numeric",  # Significance multiple correlation
    mRMR = "numeric", # Min. redundancy max. relevance
    
    # Wrapper methods parameters
    GA = "numeric",   # Genetic algorithm 
    MCUVE = "numeric",# Monte-Carlo elimination
    SPA = "numeric",  # Sub-window permutation
    IPW = "numeric",  # Iterative predictor weighting 
    BVE = "numeric",  # Backward variable elimination
    REP = "numeric",  # Regularized elimination
    T2 = "numeric",   # Hotelling T2 based selection
    
    # Embedded methods parameters
    ST = "numeric",   # Soft-thresholding
    TRUNC = "numeric",# Truncation 
    WVC = "numeric"   # Weighted variable contribution 
  )
)

variable_selection_methods <- function(LW, RC, JT, VIP, SR, sMC, mRMR,
                                       GA, MCUVE, SPA, IPW, BVE, REP, T2, 
                                       ST, TRUNC, WVC) {
  new("VariableSelectionMethods",
      LW = LW, RC = RC, JT = JT, VIP = VIP, SR = SR, sMC = sMC, mRMR = mRMR,
      GA = GA, MCUVE = MCUVE, SPA = SPA, IPW = IPW, BVE = BVE, REP = REP, T2 = T2,
      ST = ST, TRUNC = TRUNC, WVC = WVC)
}

selection_method <- variable_selection_methods(
  LW = 0.05, RC = 0.17, JT = 0.15, VIP = 0.90, SR = 0.32, sMC = 25.2, mRMR = 0.75,
  GA = 8.39, MCUVE = 2.01, SPA = 0.33, IPW = 0.01, BVE = 1.12, REP = 1.15, T2 = 0.10,
  ST = 0.54, TRUNC = 0.90, WVC = 0.17
)

print(selection_method)

