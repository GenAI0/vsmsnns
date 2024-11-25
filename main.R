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
    GA = "numeric",   # Genetic algorithm with PLS
    MCUVE = "numeric",# Monte-Carlo elimination with PLS
    SPA = "numeric",  # Sub-window permutation in PLS
    IPW = "numeric",  # Iterative predictor weighting PLS
    BVE = "numeric",  # Backward variable elimination in PLS
    REP = "numeric",  # Regularized elimination in PLS
    T2 = "numeric",   # Hotelling T2 based selection in PLS
    
    # Embedded methods parameters
    ST = "numeric",   # Soft-thresholding PLS
    TRUNC = "numeric",# Truncation PLS
    WVC = "numeric"   # Weighted variable contribution in PLS
  )
)

# Initialize the object with the given parameters
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

# Data for the ANOVA table
data <- data.frame(
  Source = c(
    "p", "n", "q", "pos", "gamma", "PLSMethod",
    "p:pos", "p:gamma", "n:q", "n:pos", "n:gamma", "q:gamma",
    "p:PLSMethod", "gamma:PLSMethod", "p:gamma:PLSMethod", "Residuals"
  ),
  Sum_Sq = c(
    0.002, 86.987, 2.934, 3.224, 144.743, 18.785,
    0.588, 0.652, 0.691, 1.193, 46.926, 5.851,
    4.835, 8.136, 4.419, 280.809
  ),
  Df = c(
    1, 1, 1, 1, 1, 14,
    1, 1, 1, 1, 1, 1,
    14, 14, 14, 4732
  ),
  F_value = c(
    0.0302, 1465.8391, 49.4375, 54.3282, 2439.1073, 22.6107,
    9.9117, 10.9786, 11.6409, 20.0977, 790.7716, 98.6028,
    5.8199, 9.7926, 5.3195, NA
  ),
  Pr_greater_F = c(
    0.8620110, "< 2.2e-16", "2.340e-12", "1.992e-13", "< 2.2e-16", "< 2.2e-16",
    "0.0016525", "0.0009286", "0.0006506", "7.532e-06", "< 2.2e-16", "< 2.2e-16",
    "1.937e-11", "< 2.2e-16", "3.629e-10", NA
  )
)

# Display the table
print(data)

