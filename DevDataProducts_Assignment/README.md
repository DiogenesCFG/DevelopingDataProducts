# Optimizing common utility functions

In every intermediate microeconomics course, at some point students learn to maximize utility functions which depende of 
their consumption of some given goods (say, `X` and `Y`), subject to a budget constraint (say, their expenditure which is
their consumption of each good times its price) must equal their income.

Some common utility functions are the Cobb-Douglas, the Quasilinear, and the CES functions. This shiny application plots 
these utility functions, and lets the users manipulate the parameters of the model (Prices, Income, or some preference 
parameters from the function). The shiny app shows for each set of parameters, the budget constraint in red, the point of optimal 
consumption with the label for the amount of X and Y, and a blue line representing the utility curve that pases through the 
optimal consumption basket.

## Cobb Douglas Utility Function

The Cobb Douglas utility function is a very common function, and presents some nice behaving results. Mainly, the consumption 
of each good is always positive, the Marshalian demand functions are independent (the consumption of X does not depend on the 
price of Y) and the ratio of consumption X/Y is kept constant with movements of the income.

The idea in the Cobb Douglas problem is to maximize 

![$X ^ {\alpha} Y ^ {1- \alpha}$](https://render.githubusercontent.com/render/math?math=%24X%20%5E%20%7B%5Calpha%7D%20Y%20%5E%20%7B1-%20%5Calpha%7D%24)

Subject to 

![$P_xX + P_yY = I$](https://render.githubusercontent.com/render/math?math=%24P_xX%20%2B%20P_yY%20%3D%20I%24)

Here, alpha is a preference parameter between 0 and 1 wich weights how much the consumer prefers each good, relative to the other.
In the app, users can use the left side panel to control the parameters alpha, price of X, price of Y, and Income. 
User can notice that if the income increases, the ratio X/Y stays the same. They can also notice that if the price of Y changes, 
consumption of X remains constant and viceversa. Finaly, they can notice that increasing alpha means increasing preference for X, 
and so in the optimal consumption basket, consumption of X increases, and viceversa. Give it a try!

## Quasilinear Utility Function

The Quasilinear Utility function is also relatively common, for it shows also some interesting properties. The function is of the form:

![$U(X, Y) = X + Y^{\alpha}$](https://render.githubusercontent.com/render/math?math=%24U(X%2C%20Y)%20%3D%20X%20%2B%20Y%5E%7B%5Calpha%7D%24)

Where X is the linear good, and the Y is the non linear good (hence, quasilinear function). In our app example, we multiplied Y times 
12 only so effects were more visible in the plot.

Users can manipulate the relative importance of the non linear good (alpha), as well as the prices of X and Y, and Income.

What's important of the quasilinear function is that the non linear good's consuption is always positive. When the income is low, the 
consumer spends all its money on the non linear good, and increases its consumption as Income increases, but only up to a certain point.
Past that, even if the income increases, the consumption of the non linear good remains constant. Give it a try, set prices of X and Y equal 
to 1, alpha equal to 0.5, and increase the price. Notice that the consumption of Y remains constant, but consumption of X increases.

## CES Function

The Constant Estalcity of Substitution is a very common function in economics. It's main property is that the elasticity of substitution 
is constant (no brainer there). It's mainly used as a production function, and the constant elasticity of substitution means that the 
changes in ratio between production inputs is constant when prices of these inputs change. However, it can be used too as an utility 
function of the form:

![$U(X, Y) = \[\alpha X^{-\rho} + (1 - \alpha) Y^{-\rho} \] ^ {\frac{-1}{\rho}}$](https://render.githubusercontent.com/render/math?math=%24U(X%2C%20Y)%20%3D%20%5B%5Calpha%20X%5E%7B-%5Crho%7D%20%2B%20(1%20-%20%5Calpha)%20Y%5E%7B-%5Crho%7D%20%5D%20%5E%20%7B%5Cfrac%7B-1%7D%7B%5Crho%7D%7D%24)

where

![$\rho > -1, \rho \neq 0$](https://render.githubusercontent.com/render/math?math=%24%5Crho%20%3E%20-1%2C%20%5Crho%20%5Cneq%200%24)

Just as a record, as rho converges to zero, the CES function converges to a Cobb Douglas, but note that rho cannot equal zero, as our exponent
becomes indefinite (as rho aproaches zero, the exponent aproaces infinity). 

Rho is just a parameter that stands for the elasticiti of substitituion (sigma), which is equal to:

![$\sigma = \frac{1}{1+\rho}$](https://render.githubusercontent.com/render/math?math=%24%5Csigma%20%3D%20%5Cfrac%7B1%7D%7B1%2B%5Crho%7D%24)

Note that when rho equals `-1`, the elasticity of substitition goes all the way to infinity, meaning the goods are perfect substitutes.
Also, as rho grows towards invinity, the elasticity of substitution goes to zero, meaning the goods are almost perfect complements.

In the app you can control in the side panel once again alpha, which is a weight parameter towards one good or the other, you can control also 
the prices, the income, and rho. Give it a try, and see how when rho equals `-1`, the function resembles one of perfect substitutes, whilst 
when rho goes towards 100, the function resembles a perfect complements utility function (or Leontieff).

