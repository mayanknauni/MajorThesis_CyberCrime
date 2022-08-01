* Encoding: UTF-8.

/*Upload Data
    
GET DATA
  /TYPE=XLSX
  /FILE='C:\Users\nauni\Documents\CyberCrime Thesis\Experiment '+
    'Results\19-Jun\Experiment_Latest\responses-export.xlsx'
  /SHEET=name 'responses-export'
  /CELLRANGE=FULL
  /READNAMES=ON
  /DATATYPEMIN PERCENTAGE=95.0
  /HIDDEN IGNORE=YES.
EXECUTE.
DATASET NAME DataSet1 WINDOW=FRONT.

/* Santize the raw data 

* Recode the string variable Age .
RECODE Age ("18-25 Yrs"=1) ("25 - 35 Yrs"=2) ("35 - 50 Yrs"=3) ("50 & above"=4)  INTO Age_num .
VARIABLE LABELS Age_num "Age (numeric)" .
FORMATS Age_num (F1.0) .
ADD VALUE LABELS Age_num
    1 "18-25 Yrs"
    2 "25 - 35 Yrs"
    3 "35 - 50 Yrs"
    4 "50 & above" .
EXECUTE.

* Recode the string variable Gender .
RECODE Gender ("Female"=1) ("Male"=2) ("Prefer not to answer"=3) INTO Gender_num .
VARIABLE LABELS Gender_num " Gender (numeric)" .
FORMATS Gender_num (F1.0) .
ADD VALUE LABELS Gender_num
    1 "Female"
    2 "Male" 
    3 "Prefer not to answer" .
EXECUTE.

* Recode the string variable Country .
RECODE Country ('Singapore'=1) ('India'=2) (ELSE=3) INTO Country_num.
VARIABLE LABELS  Country_Num 'Country (numeric)'.
FORMATS Country_Num (F1.0) .
ADD VALUE LABELS Country_Num
    1 "Singapore"
    2 "India" 
    3 "RoW" .
EXECUTE.

* Recode the string variable Education .
RECODE Education ('Graduate'=1) ('Post Graduate'=2) ('Diploma'=3) ('Doctorate '=2) ('Prefer not '+
    'to answer'=4) INTO Education_num.
FORMATS Education_num (F1.0) .
VARIABLE LABELS  Education_num 'Education (numeric)'.
ADD VALUE LABELS Education_Num
    1 "Graduate"
    2 "Post Graduate & Above" 
    3 "Diploma"
    4 "Prefer not to answer" .
EXECUTE.

* Recode the string variable Heard  Fraud .
RECODE HeardShoppingFraud (1=1) (0=0)  INTO HeardShoppingFraud_num.
FORMATS HeardShoppingFraud_num (F1.0) .
VARIABLE LABELS  HeardShoppingFraud_num 'HeardShoppingFraud (numeric)'.
ADD VALUE LABELS HeardShoppingFraud_num
    1 "Yes"
    0 "No" .
EXECUTE.

* Recode the string variable VictimOfFraud .
RECODE VictimOfFraud (1=1) (0=0)  INTO VictimOfFraud_num.
FORMATS VictimOfFraud_num (F1.0) .
VARIABLE LABELS  VictimOfFraud_num 'VictimOfFraud (numeric)'.
ADD VALUE LABELS VictimOfFraud_num
    1 "Yes"
    0 "No" .
EXECUTE.

* Recode the string variable SharedExperience .
RECODE SharedExperience (1=1) (ELSE=2) INTO SharedExperience_num.
VARIABLE LABELS  SharedExperience_num 'SharedExperience (numeric)'.
FORMATS SharedExperience_num (F1.0) .
ADD VALUE LABELS SharedExperience_num
    1 "Yes"
    2 "No" .
EXECUTE.


/* RECODING RESPONSE VALUES /*
    
* PreQ1

RECODE PreQ1First ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4)  INTO PreQ1First_num.
VARIABLE LABELS  PreQ1First_num 'PreQ1First (numeric)'.
FORMATS PreQ1First_num (F1.0) .
ADD VALUE LABELS PreQ1First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure" .
EXECUTE.

RECODE PreQ1Final ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4) (ELSE=0) INTO PreQ1Final_num.
VARIABLE LABELS  PreQ1Final_num 'PreQ1Final (numeric)'.
FORMATS PreQ1Final_num (F1.0) .
ADD VALUE LABELS PreQ1Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PreQ1DealInfo ("Back to the question"=1) ("Need more Info"=2) (ELSE=0)  INTO PreQ1DealInfo_num.
EXECUTE.
VARIABLE LABELS  PreQ1DealInfo_num 'PreQ1DealInfo (numeric)'.
FORMATS PreQ1DealInfo_num (F1.0) .
ADD VALUE LABELS PreQ1DealInfo_num
    1 "Back to the question"
    2 "Need more Info"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ1DealSeller ("Back to the question"=1)  (ELSE=0)  INTO PreQ1DealSeller_num.
EXECUTE.
VARIABLE LABELS  PreQ1DealSeller_num 'PreQ1DealSeller (numeric)'.
FORMATS PreQ1DealSeller_num (F1.0) .
ADD VALUE LABELS PreQ1DealSeller_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ1OfferPrice ("Offer price too good to be true"=1)  (ELSE=0)  INTO PreQ1OfferPrice_num.
EXECUTE.
VARIABLE LABELS  PreQ1OfferPrice_num 'PreQ1OfferPrice (numeric)'.
FORMATS PreQ1OfferPrice_num (F1.0) .
ADD VALUE LABELS PreQ1OfferPrice_num
    1 "Offer price too good to be true"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ1DubiousSeller ("Dubious Seller Contact Information"=1)  (ELSE=0)  INTO PreQ1DubiousSeller_num.
EXECUTE.
VARIABLE LABELS  PreQ1DubiousSeller_num 'PreQ1DealSeller (numeric)'.
FORMATS PreQ1DubiousSeller_num (F1.0) .
ADD VALUE LABELS PreQ1DubiousSeller_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ1InadequateInfo ("Inadequate information for product"=1)  (ELSE=0)  INTO PreQ1InadequateInfo_num.
EXECUTE.
VARIABLE LABELS  PreQ1InadequateInfo_num 'PreQ1InadequateInfo (numeric)'.
FORMATS PreQ1InadequateInfo_num (F1.0) .
ADD VALUE LABELS PreQ1InadequateInfo_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ1AbsenceofReview ("Absence of seller or product review"=1)  (ELSE=0)  INTO PreQ1AbsenceofReview_num.
EXECUTE.
VARIABLE LABELS  PreQ1AbsenceofReview_num 'PreQ1AbsenceofReview (numeric)'.
FORMATS PreQ1AbsenceofReview_num (F1.0) .
ADD VALUE LABELS PreQ1AbsenceofReview_num
    1 "Absence of seller or product review"
    0 "NotSelected" .
EXECUTE.

* PreQ2

RECODE PreQ2First ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4)  INTO PreQ2First_num.
VARIABLE LABELS  PreQ2First_num 'PreQ2First (numeric)'.
FORMATS PreQ2First_num (F1.0) .
ADD VALUE LABELS PreQ2First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure" .
EXECUTE.

RECODE PreQ2Final ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4) (ELSE=0) INTO PreQ2Final_num.
VARIABLE LABELS  PreQ2Final_num 'PreQ2Final (numeric)'.
FORMATS PreQ2Final_num (F1.0) .
ADD VALUE LABELS PreQ2Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PreQ2DealInfo ("Back to the question"=1) ("Need more Info"=2) (ELSE=0)  INTO PreQ2DealInfo_num.
EXECUTE.
VARIABLE LABELS  PreQ2DealInfo_num 'PreQ2DealInfo (numeric)'.
FORMATS PreQ2DealInfo_num (F1.0) .
ADD VALUE LABELS PreQ2DealInfo_num
    1 "Back to the question"
    2 "Need more Info"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ2DealSeller ("Back to the question"=1)  (ELSE=0)  INTO PreQ2DealSeller_num.
EXECUTE.
VARIABLE LABELS  PreQ2DealSeller_num 'PreQ2DealSeller (numeric)'.
FORMATS PreQ2DealSeller_num (F1.0) .
ADD VALUE LABELS PreQ2DealSeller_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ2OfferPrice ("Offer price too good to be true"=1)  (ELSE=0)  INTO PreQ2OfferPrice_num.
EXECUTE.
VARIABLE LABELS  PreQ2OfferPrice_num 'PreQ2OfferPrice (numeric)'.
FORMATS PreQ2OfferPrice_num (F1.0) .
ADD VALUE LABELS PreQ2OfferPrice_num
    1 "Offer price too good to be true"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ2DubiousSeller ("Dubious Seller Contact Information"=1)  (ELSE=0)  INTO PreQ2DubiousSeller_num.
EXECUTE.
VARIABLE LABELS  PreQ2DubiousSeller_num 'PreQ2DealSeller (numeric)'.
FORMATS PreQ2DubiousSeller_num (F1.0) .
ADD VALUE LABELS PreQ2DubiousSeller_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ2InadequateInfo ("Inadequate information for product"=1)  (ELSE=0)  INTO PreQ2InadequateInfo_num.
EXECUTE.
VARIABLE LABELS  PreQ2InadequateInfo_num 'PreQ2InadequateInfo (numeric)'.
FORMATS PreQ2InadequateInfo_num (F1.0) .
ADD VALUE LABELS PreQ2InadequateInfo_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ2AbsenceofReview ("Seller or product review"=1)  (ELSE=0)  INTO PreQ2AbsenceofReview_num.
EXECUTE.
VARIABLE LABELS  PreQ2AbsenceofReview_num 'PreQ2AbsenceofReview (numeric)'.
FORMATS PreQ2AbsenceofReview_num (F1.0) .
ADD VALUE LABELS PreQ2AbsenceofReview_num
    1 "Absence of seller or product review"
    0 "NotSelected" .
EXECUTE.

* PreQ3

RECODE PreQ3First ("Fraud"=1) ("Legitimate"=2) ("More Info"=3) ("Not Sure"=4)  INTO PreQ3First_num.
VARIABLE LABELS  PreQ3First_num 'PreQ3First (numeric)'.
FORMATS PreQ3First_num (F1.0) .
ADD VALUE LABELS PreQ3First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure" .
EXECUTE.


RECODE PreQ3Final ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4) (ELSE=0) INTO PreQ3Final_num.
VARIABLE LABELS  PreQ3Final_num 'PreQ3Final (numeric)'.
FORMATS PreQ3Final_num (F1.0) .
ADD VALUE LABELS PreQ3Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PreQ3Chat ("Back to the question"=1) (ELSE=0)  INTO PreQ3Chat_num.
EXECUTE.
VARIABLE LABELS  PreQ3Chat_num 'PreQ3Chat (numeric)'.
FORMATS PreQ3Chat_num (F1.0) .
ADD VALUE LABELS PreQ3Chat_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ3OfferPrice ("Offer price too good to be true"=1)  (ELSE=0)  INTO PreQ3OfferPrice_num.
EXECUTE.
VARIABLE LABELS  PreQ3OfferPrice_num 'PreQ3OfferPrice (numeric)'.
FORMATS PreQ3OfferPrice_num (F1.0) .
ADD VALUE LABELS PreQ3OfferPrice_num
    1 "Offer price too good to be true"
    0 "NotSelected" .
EXECUTE.

RECODE PreQ3DubiousSeller ("Dubious Seller Contact Information"=1)  (ELSE=0)  INTO PreQ3DubiousSeller_num.
EXECUTE.
VARIABLE LABELS  PreQ3DubiousSeller_num 'PreQ3DealSeller (numeric)'.
FORMATS PreQ3DubiousSeller_num (F1.0) .
ADD VALUE LABELS PreQ3DubiousSeller_num
    1 "Dubious Seller Contact Information"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ3ExternalPayment ("Seller is asking for external payment"=1)  (ELSE=0)  INTO PreQ3ExternalPayment_num.
EXECUTE.
VARIABLE LABELS  PreQ3ExternalPayment_num 'PreQ3ExternalPayment (numeric)'.
FORMATS PreQ3ExternalPayment_num (F1.0) .
ADD VALUE LABELS PreQ3ExternalPayment_num
    1 "Seller is asking for external payment"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ3AbsenceofReview ("Seller or product review"=1)  (ELSE=0)  INTO PreQ3AbsenceofReview_num.
EXECUTE.
VARIABLE LABELS  PreQ3AbsenceofReview_num 'PreQ3AbsenceofReview (numeric)'.
FORMATS PreQ3AbsenceofReview_num (F1.0) .
ADD VALUE LABELS PreQ3AbsenceofReview_num
    1 "Seller or product review"
    0 "NotVisted" .
EXECUTE.



*Pre Q4

RECODE PreQ4First ("Fraud"=1) ("Legitimate"=2) ("Need More Info"=3) ("Not Sure"=4)  INTO PreQ4First_num.
VARIABLE LABELS  PreQ4First_num 'PreQ4First (numeric)'.
FORMATS PreQ4First_num (F1.0) .
ADD VALUE LABELS PreQ4First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need More Info"
    4 "Not Sure" .
EXECUTE.


RECODE PreQ4Final ("Fraud"=1) ("Legitimate"=2) ("Need More Info"=3) ("Not Sure"=4) (ELSE=0) INTO PreQ4Final_num.
VARIABLE LABELS  PreQ4Final_num 'PreQ4Final (numeric)'.
FORMATS PreQ4Final_num (F1.0) .
ADD VALUE LABELS PreQ4Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PreQ4DealInfo ("Back to the question"=1) ("Need more Info"=2) (ELSE=0)  INTO PreQ4DealInfo_num.
EXECUTE.
VARIABLE LABELS  PreQ4DealInfo_num 'PreQ4DealInfo (numeric)'.
FORMATS PreQ4DealInfo_num (F1.0) .
ADD VALUE LABELS PreQ4DealInfo_num
    1 "Back to the question"
    2 "Need more Info"
    0 "NotVisted" .
EXECUTE.

RECODE PreQ4DealSeller ("Back to the question"=1)  (ELSE=0)  INTO PreQ4DealSeller_num.
EXECUTE.
VARIABLE LABELS  PreQ4DealSeller_num 'PreQ4DealSeller (numeric)'.
FORMATS PreQ4DealSeller_num (F1.0) .
ADD VALUE LABELS PreQ4DealSeller_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.




* POST Q1
 
 RECODE PostQ1First ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4)  INTO PostQ1First_num.
VARIABLE LABELS  PostQ1First_num 'PostQ1First (numeric)'.
FORMATS PostQ1First_num (F1.0) .
ADD VALUE LABELS PostQ1First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure" .
EXECUTE.

RECODE PostQ1Final ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4) (ELSE=0) INTO PostQ1Final_num.
VARIABLE LABELS  PostQ1Final_num 'PostQ1Final (numeric)'.
FORMATS PostQ1Final_num (F1.0) .
ADD VALUE LABELS PostQ1Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PostQ1DealInfo ("Back to the question"=1) ("Need more Info"=2) (ELSE=0)  INTO PostQ1DealInfo_num.
EXECUTE.
VARIABLE LABELS  PostQ1DealInfo_num 'PostQ1DealInfo (numeric)'.
FORMATS PostQ1DealInfo_num (F1.0) .
ADD VALUE LABELS PostQ1DealInfo_num
    1 "Back to the question"
    2 "Need more Info"
    0 "NotVisted" .
EXECUTE.

RECODE PostQ1DealSeller ("Back to the question"=1)  (ELSE=0)  INTO PostQ1DealSeller_num.
EXECUTE.
VARIABLE LABELS  PostQ1DealSeller_num 'PostQ1DealSeller (numeric)'.
FORMATS PostQ1DealSeller_num (F1.0) .
ADD VALUE LABELS PostQ1DealSeller_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.   


* POST Q2
    
RECODE PostQ2First ("Fraud"=1) ("Legitimate"=2) ("Need more info"=3) ("Not Sure"=4)  INTO PostQ2First_num.
VARIABLE LABELS  PostQ2First_num 'PostQ2First (numeric)'.
FORMATS PostQ2First_num (F1.0) .
ADD VALUE LABELS PostQ2First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure" .
EXECUTE.


RECODE PostQ2Final ("Fraud"=1) ("Legitimate"=2) ("Need more info"=3) ("Not Sure"=4) (ELSE=0) INTO PostQ2Final_num.
VARIABLE LABELS  PostQ2Final_num 'PostQ2Final (numeric)'.
FORMATS PostQ2Final_num (F1.0) .
ADD VALUE LABELS PostQ2Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PostQ2DealInfo ("Back to the question"=1) ("Need more Info"=2) (ELSE=0)  INTO PostQ2DealInfo_num.
EXECUTE.
VARIABLE LABELS  PostQ2DealInfo_num 'PostQ2DealInfo (numeric)'.
FORMATS PostQ2DealInfo_num (F1.0) .
ADD VALUE LABELS PostQ2DealInfo_num
    1 "Back to the question"
    2 "Need more Info"
    0 "NotVisted" .
EXECUTE.

RECODE PostQ2DealSeller ("Back to the question"=1)  (ELSE=0)  INTO PostQ2DealSeller_num.
EXECUTE.
VARIABLE LABELS  PostQ2DealSeller_num 'PostQ2DealSeller (numeric)'.
FORMATS PostQ2DealSeller_num (F1.0) .
ADD VALUE LABELS PostQ2DealSeller_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.

RECODE PostQ2OfferPrice ("Offer price too good to be true"=1)  (ELSE=0)  INTO PostQ2OfferPrice_num.
EXECUTE.
VARIABLE LABELS  PostQ2OfferPrice_num 'PostQ2OfferPrice (numeric)'.
FORMATS PostQ2OfferPrice_num (F1.0) .
ADD VALUE LABELS PostQ2OfferPrice_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ2DubiousSeller ("Dubious Seller Contact Information"=1)  (ELSE=0)  INTO PostQ2DubiousSeller_num.
EXECUTE.
VARIABLE LABELS  PostQ2DubiousSeller_num 'PostQ2DealSeller (numeric)'.
FORMATS PostQ2DubiousSeller_num (F1.0) .
ADD VALUE LABELS PostQ2DubiousSeller_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ2InadequateInfo ("Inadequate information for product"=1)  (ELSE=0)  INTO PostQ2InadequateInfo_num.
EXECUTE.
VARIABLE LABELS  PostQ2InadequateInfo_num 'PostQ2InadequateInfo (numeric)'.
FORMATS PostQ2InadequateInfo_num (F1.0) .
ADD VALUE LABELS PostQ2InadequateInfo_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ2AbsenceofReview ("Seller or product review"=1)  (ELSE=0)  INTO PostQ2AbsenceofReview_num.
EXECUTE.
VARIABLE LABELS  PostQ2AbsenceofReview_num 'PostQ2AbsenceofReview (numeric)'.
FORMATS PostQ2AbsenceofReview_num (F1.0) .
ADD VALUE LABELS PostQ2AbsenceofReview_num
    1 "Seller or product review"
    0 "NotSelected" .
EXECUTE.

* POST Q3

RECODE PostQ3First ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4)  INTO PostQ3First_num.
VARIABLE LABELS  PostQ3First_num 'PostQ3First (numeric)'.
FORMATS PostQ3First_num (F1.0) .
ADD VALUE LABELS PostQ3First_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure" .
EXECUTE.


RECODE PostQ3Final ("Fraud"=1) ("Legitimate"=2) ("Need more Info"=3) ("Not Sure"=4) (ELSE=0) INTO PostQ3Final_num.
VARIABLE LABELS  PostQ3Final_num 'PostQ3Final (numeric)'.
FORMATS PostQ3Final_num (F1.0) .
ADD VALUE LABELS PostQ3Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PostQ3DealInfo ("Back to the question"=1) ("Need more Info"=2) (ELSE=0)  INTO PostQ3DealInfo_num.
EXECUTE.
VARIABLE LABELS  PostQ3DealInfo_num 'PostQ3DealInfo (numeric)'.
FORMATS PostQ3DealInfo_num (F1.0) .
ADD VALUE LABELS PostQ3DealInfo_num
    1 "Back to the question"
    2 "Need more Info"
    0 "NotVisted" .
EXECUTE.

RECODE PostQ3DealSeller ("Back to the question"=1)  (ELSE=0)  INTO PostQ3DealSeller_num.
EXECUTE.
VARIABLE LABELS  PostQ3DealSeller_num 'PostQ3DealSeller (numeric)'.
FORMATS PostQ3DealSeller_num (F1.0) .
ADD VALUE LABELS PostQ3DealSeller_num
    1 "Back to the question"
    0 "NotVisted" .
EXECUTE.

RECODE PostQ3OfferPrice ("Offer price too good to be true"=1)  (ELSE=0)  INTO PostQ3OfferPrice_num.
EXECUTE.
VARIABLE LABELS  PostQ3OfferPrice_num 'PostQ3OfferPrice (numeric)'.
FORMATS PostQ3OfferPrice_num (F1.0) .
ADD VALUE LABELS PostQ3OfferPrice_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ3DubiousSeller ("Dubious Seller Contact Information"=1)  (ELSE=0)  INTO PostQ3DubiousSeller_num.
EXECUTE.
VARIABLE LABELS  PostQ3DubiousSeller_num 'PostQ3DealSeller (numeric)'.
FORMATS PostQ3DubiousSeller_num (F1.0) .
ADD VALUE LABELS PostQ3DubiousSeller_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ3InadequateInfo ("Inadequate information for product"=1)  (ELSE=0)  INTO PostQ3InadequateInfo_num.
EXECUTE.
VARIABLE LABELS  PostQ3InadequateInfo_num 'PostQ3InadequateInfo (numeric)'.
FORMATS PostQ3InadequateInfo_num (F1.0) .
ADD VALUE LABELS PostQ3InadequateInfo_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ3AbsenceofReview ("Seller or product review"=1)  (ELSE=0)  INTO PostQ3AbsenceofReview_num.
EXECUTE.
VARIABLE LABELS  PostQ3AbsenceofReview_num 'PostQ3AbsenceofReview (numeric)'.
FORMATS PostQ3AbsenceofReview_num (F1.0) .
ADD VALUE LABELS PostQ3AbsenceofReview_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

* POST Q4

RECODE PostQ4Final ("Fraud"=1) ("Legitimate"=2) ("Need more info"=3) ("Not Sure"=4) (ELSE=0) INTO PostQ4Final_num.
VARIABLE LABELS  PostQ4Final_num 'PostQ4Final (numeric)'.
FORMATS PostQ4Final_num (F1.0) .
ADD VALUE LABELS PostQ4Final_num
    1 "Fraud"
    2 "Legitimate"
    3 "Need more Info"
    4 "Not Sure"
    0 "AnsweredAlready" .
EXECUTE.

RECODE PostQ4OfferPrice ("Offer price too good to be true"=1)  (ELSE=0)  INTO PostQ4OfferPrice_num.
EXECUTE.
VARIABLE LABELS  PostQ4OfferPrice_num 'PostQ4OfferPrice (numeric)'.
FORMATS PostQ4OfferPrice_num (F1.0) .
ADD VALUE LABELS PostQ4OfferPrice_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ4DubiousSeller ("Dubious Seller Contact Information"=1)  (ELSE=0)  INTO PostQ4DubiousSeller_num.
EXECUTE.
VARIABLE LABELS  PostQ4DubiousSeller_num 'PostQ4DealSeller (numeric)'.
FORMATS PostQ4DubiousSeller_num (F1.0) .
ADD VALUE LABELS PostQ4DubiousSeller_num
    1 "Dubious Seller Contact Information"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ4InadequateInfo ("Inadequate information for product"=1)  (ELSE=0)  INTO PostQ4InadequateInfo_num.
EXECUTE.
VARIABLE LABELS  PostQ4InadequateInfo_num 'PostQ4InadequateInfo (numeric)'.
FORMATS PostQ4InadequateInfo_num (F1.0) .
ADD VALUE LABELS PostQ4InadequateInfo_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

RECODE PostQ4ExternalPayment ("Seller is asking for external payment"=1)  (ELSE=0)  INTO PostQ4ExternalPayment_num.
EXECUTE.
VARIABLE LABELS  PostQ4ExternalPayment_num 'PostQ4ExternalPayment (numeric)'.
FORMATS PostQ4ExternalPayment_num (F1.0) .
ADD VALUE LABELS PostQ4ExternalPayment_num
    1 "Inadequate information for product"
    0 "NotSelected" .
EXECUTE.

* Encoding: UTF-8.

/* PRE TRAINING SCORING /*

/* Q1  add first and final to all variables/*   

RECODE PreQ1First_num (1=1) (ELSE=0) INTO PreQ1A1.
VARIABLE LABELS  PreQ1A1 'PreQ1A1 First '.
EXECUTE.


RECODE PreQ1Final_num (1=1) (ELSE=0) INTO PreQ1A2.
VARIABLE LABELS  PreQ1A2 'Pre Q1A2 Final '.
EXECUTE.

RECODE PreQ1OfferPrice_num (1=1) (ELSE=0) INTO PreQ1A3.
VARIABLE LABELS  PreQ1A3 'PreQ1A3 Price'.
EXECUTE.

RECODE PreQ1InadequateInfo_num (1=1) (ELSE=0) INTO PreQ1A4.
VARIABLE LABELS  PreQ1A4 'PreQ1A4 Info'.
EXECUTE.

RECODE PreQ1AbsenceofReview_num (1=1) (ELSE=0) INTO PreQ1A5.
VARIABLE LABELS  PreQ1A5 'PreQ1A5 Review'.
EXECUTE.


COMPUTE PreQ1Total=PreQ1A1 + PreQ1A2 + PreQ1A3 + PreQ1A4 + PreQ1A5.
EXECUTE.

/* Q2 /* 

RECODE PreQ2First_num (1=1) (ELSE=0) INTO PreQ2A1.
VARIABLE LABELS  PreQ2A1 'PreQ2A1'.
EXECUTE.


RECODE PreQ2Final_num (1=1) (ELSE=0) INTO PreQ2A2.
VARIABLE LABELS  PreQ2A2 'PreQ2A2'.
EXECUTE.

RECODE PreQ2OfferPrice_num (1=1) (ELSE=0) INTO PreQ2A3.
VARIABLE LABELS  PreQ2A3 'PreQ2A3'.
EXECUTE.

RECODE PreQ2AbsenceofReview_num (1=1) (ELSE=0) INTO PreQ2A5.
VARIABLE LABELS  PreQ2A5 'PreQ2A5'.
EXECUTE.

COMPUTE PreQ2Total=PreQ2A1 + PreQ2A2 + PreQ2A3 + PreQ2A5.
EXECUTE.


/* Q3 /* 

RECODE PreQ3First_num (1=1) (ELSE=0) INTO PreQ3A1.
VARIABLE LABELS  PreQ3A1 'PreQ3A1'.
EXECUTE.

RECODE PreQ3Final_num (1=1) (ELSE=0) INTO PreQ3A2.
VARIABLE LABELS  PreQ3A2 'PreQ3A2'.
EXECUTE.

RECODE PreQ3ExternalPayment_num (1=1) (ELSE=0) INTO PreQ3A3.
VARIABLE LABELS  PreQ3A3 'PreQ3A3'.
EXECUTE.

COMPUTE PreQ3Total=PreQ3A1 + PreQ3A2 + PreQ3A3.
EXECUTE.

/* Q4 /* 

RECODE PreQ4First_num (2=1) (ELSE=0) INTO PreQ4A1.
VARIABLE LABELS  PreQ4A1 'PreQ4A1'.
EXECUTE.

RECODE PreQ4Final_num (2=1) (ELSE=0) INTO PreQ4A2.
VARIABLE LABELS  PreQ4A2 'PreQ4A2'.
EXECUTE.

COMPUTE PreQ4Total=PreQ4A1 + PreQ4A2.
EXECUTE.

/* Total Score Pre-test /* 
COMPUTE PreTrainingScore=PreQ1Total+PreQ2Total + PreQ3Total + PreQ4Total.
FORMATS PreTrainingScore (F1.0) .
EXECUTE.    


/* POST TRAINING SCORING /*
    
/* Q1 /* 

RECODE PostQ1First_num (2=1) (ELSE=0) INTO PostQ1A1.
VARIABLE LABELS  PostQ1A1 'PostQ1A1'.
EXECUTE.

RECODE PostQ1Final_num (2=1) (ELSE=0) INTO PostQ1A2.
VARIABLE LABELS  PostQ1A2 'PostQ1A2'.
EXECUTE.

COMPUTE PostQ1Total=PostQ1A1 + PostQ1A2.
EXECUTE.

/* Q2 /* 

RECODE PostQ2First_num (1=1) (ELSE=0) INTO PostQ2A1.
VARIABLE LABELS  PostQ2A1 'PostQ2A1'.
EXECUTE.

RECODE PostQ2Final_num (1=1) (ELSE=0) INTO PostQ2A2.
VARIABLE LABELS  PostQ2A2 'PostQ2A2'.
EXECUTE.

RECODE PostQ2OfferPrice_num (1=1) (ELSE=0) INTO PostQ2A3.
VARIABLE LABELS  PostQ2A3 'PostQ2A3'.
EXECUTE.

RECODE PostQ2AbsenceofReview_num (1=1) (ELSE=0) INTO PostQ2A5.
VARIABLE LABELS  PostQ2A5 'PostQ2A5'.
EXECUTE.

RECODE PostQ2DubiousSeller_num (1=1) (ELSE=0) INTO PostQ2A6.
VARIABLE LABELS  PostQ2A6 'PostQ2A6'.
EXECUTE.

COMPUTE PostQ2Total=PostQ2A1 + PostQ2A2 + PostQ2A3 + PostQ2A5 + PostQ2A6.
EXECUTE.


/* Q3 /* 

RECODE PostQ3First_num (1=1) (ELSE=0) INTO PostQ3A1.
VARIABLE LABELS  PostQ3A1 'PostQ3A1'.
EXECUTE.

RECODE PostQ3Final_num (1=1) (ELSE=0) INTO PostQ3A2.
VARIABLE LABELS  PostQ3A2 'PostQ3A2'.
EXECUTE.

RECODE PostQ3OfferPrice_num (1=1) (ELSE=0) INTO PostQ3A3.
VARIABLE LABELS  PostQ3A3 'PostQ3A3'.
EXECUTE.

RECODE PostQ3AbsenceofReview_num (1=1) (ELSE=0) INTO PostQ3A4.
VARIABLE LABELS  PostQ3A4 'PostQ3A4'.
EXECUTE.

RECODE PostQ3DubiousSeller_num (1=1) (ELSE=0) INTO PostQ3A5.
VARIABLE LABELS  PostQ3A5 'PostQ3A5'.
EXECUTE.

COMPUTE PostQ3Total=PostQ3A1 + PostQ3A2 + PostQ3A3 + PostQ3A4 + PostQ3A5.
EXECUTE.

/* Q4 /* 

RECODE PostQ4Final_num (1=1) (ELSE=0) INTO PostQ4A2.
VARIABLE LABELS  PostQ4A2 'PostQ4A2'.
EXECUTE.

RECODE PostQ4ExternalPayment_num (1=1) (ELSE=0) INTO PostQ4A3.
VARIABLE LABELS  PostQ4A3 'PostQ4A3'.
EXECUTE.

COMPUTE PostQ4Total= PostQ4A2 + PostQ4A3.
EXECUTE.

/* Total Score Post-test /* 
COMPUTE PostTrainingScore=PostQ1Total+PostQ2Total + PostQ3Total + PostQ4Total.
FORMATS PostTrainingScore (F1.0) .
EXECUTE.    


/* Time Taken 

COMPUTE  time_for_completion=(SubmitDateUTC - StartDateUTC) / 60.
VARIABLE LABELS  time_for_completion "Time For Completing Survey".
VARIABLE LEVEL  time_for_completion (SCALE).
FORMATS  time_for_completion (F8.2).
VARIABLE WIDTH  time_for_completion(8).
EXECUTE.

/* Score

COMPUTE PostMinusPre=PostTrainingScore - PreTrainingScore.
FORMATS PostMinusPre (F1.0) .
EXECUTE.


/* Analysis 
    
* Encoding: UTF-8.


MISSING VALUES Gender_num SharedExperience_num ( 3 ).
EXECUTE.
MISSING VALUES Education_num ( 4 ).
EXECUTE. 


VARIABLE LABELS totalclicks (totalclicks)" .
ADD VALUE LABELS totalclicks
    0 "low"
    1 "low"
    2  "low"
    3  "low"
    4  "low"
    5 "high"
    6 "medium" 
    7 "medium" 
    8 "medium"  
    9 "medium"  
    10"high" 
    11 "high" 
    12 "high" 
    13 "high" .
EXECUTE. 



/* for discarding time based outliers i.e. participants who took less than 4 minutes and greater than 30 minutes 

COMPUTE Is_selected = ( time_for_completion > 4.00 AND time_for_completion < 30.00) .
FREQUENCIES VARIABLES=Is_selected .
SELECT IF Is_selected .
EXECUTE. 

/* Straightliners identification and elimination

COMPUTE answer_variation=VARIANCE(PreQ1First_num,PreQ1Final_num,PreQ2First_num,PreQ2Final_num,
    PreQ3First_num,PreQ3Final_num, PreQ4First_num,PreQ4Final_num,PostQ1First_num,PostQ1Final_num,
    PostQ2First_num,PostQ2Final_num,PostQ3First_num,PostQ3Final_num,PostQ4Final_num).
EXECUTE.

SELECT IF ( answer_variation = 0).
EXECUTE. 


* Frequency Analysis 
 
FREQUENCIES VARIABLES= Age_num time_for_completion.
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PreQ1Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PreQ2Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PreQ3Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PreQ4Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PostQ1Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PostQ2Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PostQ3Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PostQ4Total
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PreTrainingScore
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=PostTrainingScore
  /ORDER=ANALYSIS.


FREQUENCIES
    VARIABLES=PreTrainingScore
    /HIST=NORMAL .

FREQUENCIES
    VARIABLES=PostTrainingScore
    /HIST=NORMAL .

FREQUENCIES VARIABLES=Country_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Gender_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Education_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=VictimOfFraud_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=time_for_completion
  /ORDER=ANALYSIS.

FREQUENCIES
    VARIABLES=time_for_completion
    /HIST=NORMAL .

FREQUENCIES VARIABLES=Age PostMinusPre
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=time_for_completion PostMinusPre
  /ORDER=ANALYSIS.

/* Particpants Education Level /*

GRAPH
  /BAR(SIMPLE)=COUNT BY Education_num.

/* Particpants Gender /*

GRAPH
  /BAR(SIMPLE)=COUNT BY Gender_num.

/* Particpants Age /*

GRAPH
  /BAR(SIMPLE)=COUNT BY Age_num.


/* Particpants heard online shopping fraud /*

GRAPH
  /BAR(SIMPLE)=COUNT BY HeardShoppingFraud_num.

/* Victim of  online shopping fraud /*

GRAPH
  /BAR(SIMPLE)=COUNT BY VictimOfFraud_num.


/* Particpants by Country /*

GRAPH
  /BAR(SIMPLE)=COUNT BY Country_Num.

/* Particpants by Gender and Education Stacked Graph /*

GRAPH
  /BAR(GROUPED)=COUNT BY Gender_num BY Education_num.

/* Particpants by Age and Education Stacked Graph /*

GRAPH
  /BAR(GROUPED)=COUNT BY Age_num BY Education_num.

/* Means Calcuation by Demographics */

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY Age_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY Country_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY Gender_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY Education_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY HeardShoppingFraud_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY VictimOfFraud_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY time_for_completion
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostTrainingScore PreTrainingScore PostMinusPre BY totalclicks
  /CELLS=MEAN COUNT STDDEV.


/* Paired T-test for null hyphothesis  /*
    

EXAMINE VARIABLES=PostMinusPre
  /PLOT BOXPLOT NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

T-TEST PAIRS=PostTrainingScore WITH PreTrainingScore (PAIRED)
  /ES DISPLAY(TRUE) STANDARDIZER(SD)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

/* Linear Correlation Test H3 and H4 hyphothesis  /*
    
GRAPH
  /SCATTERPLOT(BIVAR)=PostMinusPre WITH totalclicks
  /MISSING=LISTWISE.

GRAPH
  /SCATTERPLOT(BIVAR)=PostMinusPre WITH time_for_completion
  /MISSING=LISTWISE.



/* Particpants Performance between SG and IN - Independent Sample T-Test /*
  
T-TEST GROUPS=Country_num(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=PostMinusPre
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

/*An independent samples t-test was conducted to see if subjects from both India and Singapore performed well with no significant difference and both groups positively benefitted from the intervention.
/* Per the statistics below, the effect of training was more visible on Singapore participants and had less impact on India’s participant./*
/*This may be caused by the factor that in the training content prices were represented in Singapore Dollar ( SGD ) which might have resulted in erroneous evaluation.  
/*Tests designed with country specific / regional attributes ( local currency and local shopping portals) would have been more effective – for future studies.



/* Independent samples T-test by Gender, Score and TimeTaken
    
T-TEST GROUPS=Gender_num(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=TotalClicks time_for_completion PostTrainingScore
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

/*Inference:
/*Female participants spent more time to finish the survey, had more number of clicks on “need more info” than male counterparts and have also scored well ( PostMinusPreScore).


/* Education vs Time Spent ( for non-linear ) : Scatter Plot 

GRAPH
  /SCATTERPLOT(BIVAR)=time_for_completion WITH Education_num
  /MISSING=LISTWISE.

/*Mean: Age-group and Score

MEANS TABLES=PostMinusPre BY Age_num
  /CELLS=MEAN COUNT STDDEV.

/* Inference:
/*Participants in the age group of 35-50 years had better scores after the training as compared to other participant age-groups

MEANS TABLES=PostMinusPre BY Gender_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=PostMinusPre BY VictimOfFraud_num
  /CELLS=MEAN COUNT STDDEV.

/* Even though the number of participants who were a victim of online-shopping fraud was smaller as compared for those who weren’t victim of an online shopping fraud,
    /* the victim of fraud had better score as  compared to the participants who weren’t victim of online shopping fraud.
/* Female participants had better scores as compared to the male participants 

/* Individual Gender T Test to calculate effect size 

T-TEST GROUPS=Gender_num(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=PostTrainingScore PreTrainingScore
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).


/* Effect size on Countries 

T-TEST GROUPS=Country_num(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=Post_Training Pre_Training
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).


/*Digital Divide Study 

MEANS TABLES=PostMinusPre BY Age_num
  /CELLS=MEAN COUNT STDDEV.

MEANS TABLES=Post_Training Pre_Training BY Age_num
  /CELLS=MEAN COUNT STDDEV.



/* Extra  Work for Future Research /* 

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Country_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Gender_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=Education_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=VictimOfFraud_num
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=time_for_completion
  /ORDER=ANALYSIS.

FREQUENCIES
    VARIABLES=time_for_completion
    /HIST=NORMAL .

FREQUENCIES VARIABLES=Age PostMinusPre
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=time_for_completion PostMinusPre
  /ORDER=ANALYSIS.

/* Correlation: Education and TimeSpent
  
CORRELATIONS
  /VARIABLES=Education_num time_for_completion
  /PRINT=TWOTAIL NOSIG FULL
  /MISSING=PAIRWISE.

/*I observed strong correlation between Education and Time taken on the survey. The post grads and grads spent more time on survey.

/* Crosstab representing test scores of subjects by age-group - DIGITAL DIVIDE 

CROSSTABS
  /TABLES=Age BY PostMinusPre
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

/*Inference:
/*18-25 Years , 66.67% of the total participants shows positive outcome to the training 
/*25-35 Years , 48.84% of the participants shows positive outcome to the training 
/*35-50 Years , 61.7 % of the participants shows positive outcome to the training
/*50 Years and above , 66.67 % of the participants shows positive outcome to the training 

/*Crosstab representing victim & not victim of fraud and their scores
    
CROSSTABS
  /TABLES=VictimOfFraud BY PostMinusPre
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT
  /COUNT ROUND CELL.

/*Inference:
/*Victims of Fraud, 63.16% of the total participants showed positive outcome to the training 
/*Victims of Fraud, 21.05% of the total participants shows negative outcome to the training 
/*Not Victims of Fraud, 55.45% of the total participants showed positive outcome to the training 
/*Victims of Fraud, 21.69% of the total participants shows negative outcome to the training 

/* Independent sample T-Test for Clicks and Scores /* 

T-TEST GROUPS=PostMinusPre(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=totalclicks
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

