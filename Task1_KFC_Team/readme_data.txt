## Rationale & Data Matters

The data table contains cross-sectional (xsec) data in a tidy approach.

The KFC (Kata, Fanni, Cosmin) Team decided to gather pizza data within metropolitan Budapest.
This refined the location and allowed the team to include the "district" variable referring to the district within which the pizza restaurant is located.

The pizza places, prices and other elements were gathered within the span of a few days between October 8th and October 11th 2020.
Thus, this short time span for data gathering warrants the belief that prices have not fluctuated in those few days, making this data table a tidy cross-sectional (xsec) table.

## Nomenclature

The variable names were chosen to be short and written in lowercase with underscore separators between words to be easy to type for later manipulation.
The XLS table called "KFC-team_pizza-variables" provides a longer description of every variable so that the actual variable names can be kept concise.

## Variables

The "address" is a qualitative string variable which defines the specific location of the restaurant within Budapest starting with the house number.

Yet another qualitative string variable, "restaurant", refers to the publicly listed name of the pizza restaurant and thus might contain redundant values such as "Budapest" or "Restaurant".

The "price_pizza" and "price_swater" variables are both quantitative integer as they represent the price in Hungarian Forints for a plain Margherita pizza and for a 0.5 liter sparkling water.
The prices of these two items were gathered without any discounts, service charges, markups or any other elements. They should reflect the prices either found on-site in the local menu or online through a food delivery site respectively.

The "delivery" variable is an indicator binary variable which shows whether the prices gathered for the two items were from the on-site location through the local menu or from the online medium (delivery sites).
The possible values for the "delivery" variable are "Yes" for delivery site prices and "No" for on-site prices.
The rationale for including the delivery variable was to acknowledge that there might be differences in the actual price for the same product whether it is eaten on-site or ordered at home.

The "size_pizza" variable is quantitative integer representing the size of the margherita pizza in centimeters.
In cases of multiple sizes of pizza offered, the product closest to the benchmark value of 30cm (standard practice in the pizza industry) was chosen.

"cust_rating" refers to the Google rating of the restaurant. This variable is quantitative interval, with possible values ranging from 1,0 until 5,0.

The "dist_CEU" variable is a quantitative integer variable which represents the distance as measured in minutes walking from the CEU building (Nador 15 entrance) until the address of the designated pizza restaurant.
The calculation of minutes was done through Google Maps walking directions and the shortest route (in minutes) was chosen.

The "accept_card" column is a binary variable which indicates whether the restaurant accepts payment by card or not.
This variable is of interest for the on-site restaurants, as some are cash-only.

Lastly, "delivery_site" is a qualitative nominal variable which indicates which delivery website (Netpincer or Wolt) was used in the case of gathering online pizza data.
For the on-site entries, the input for this variable is "NA" which stands for "Not Applicable", thus representing a null value.
