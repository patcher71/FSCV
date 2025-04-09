# FSCV
This is a simple implementation of curve fitting for current vs time data obtained from fast scan cyclic voltammetry recordings in brain slices.
Two models are provided: a combined simple rise and decay function, and a 'restricted diffusion' (RD) model based on previous work (Hoffman et al. ACS Chem Neurosci. 2016 Jun 15;7(6):700-9. doi: 10.1021/acschemneuro.5b00277. Epub 2016 Mar 28. PMID: 27018734; PMCID: PMC4909544.). The only addition here is a second slower ('Ku2') term to help fit the tail of the response if needed.   

The program begins by having the user import single or multiple I vs. T files which will be averaged.  The user can then select the range of the curve to be fit.  RD model parameters can be adjusted and previewed to match the data.  Once these parameters are acceptable, the user accepts these values as the initial parameters for curve fitting.  Running the RD function will perform a least squares fit to find the solution. All data, fits and parameters can be saved to .txt files.  

**Caution: in this version, if the user selected parameters are not a close approximation to the curve, the algorithm may not converge on the "best fit" because it can get stuck in a local minimum. In other words, poor parameters may result in a poor fit.  Therefore, it is best to adjust the parameters to best match the curve, and then used the RD function to confirm that the fit is good.**  

Updates: **v6 has some basic signal analysis calculations such as T80 (decay by 80% from peak), rate of decay, peak amplitude, etc.
