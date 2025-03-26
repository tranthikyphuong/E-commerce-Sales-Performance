-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/f65VKc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "ProductDetails" (
    "UniqeID" VARCHAR(255)   NOT NULL,
    "productName" VARCHAR(255)   NOT NULL,
    "category" VARCHAR(255)   NOT NULL,
    "ShippingWeight" VARCHAR(100)   NOT NULL,
    "IsAmazonSeller" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_ProductDetails" PRIMARY KEY (
        "UniqeID"
     )
);

CREATE TABLE "CustomerDetails" (
    "CustomerID" INT   NOT NULL,
    "Age" INT   NOT NULL,
    "Gender" VARCHAR(100)   NOT NULL,
    "ItemPurchased" VARCHAR(100)   NOT NULL,
    "Category" VARCHAR(100)   NOT NULL,
    "PurchaseAmount" INT   NOT NULL,
    "Location" VARCHAR(100)   NOT NULL,
    "Size" VARCHAR(50)   NOT NULL,
    "Color" VARCHAR(100)   NOT NULL,
    "Season" VARCHAR(100)   NOT NULL,
    "ReviewRating" DEMICAL(2,2)   NOT NULL,
    "SubscriptionStatus" STRING   NOT NULL,
    "ShippingType" VARCHAR(50)   NOT NULL,
    "DiscountApplied" VARCHAR(50)   NOT NULL,
    "PromoCodeUsed" VARCHAR(50)   NOT NULL,
    "PreviousPurchases" INT   NOT NULL,
    "PaymentMethod" VARCHAR(50)   NOT NULL,
    "FrequencyofPurchases" VARCHAR(50)   NOT NULL
);

CREATE TABLE "SalesData" (
    "userID" INT   NOT NULL,
    "productID" VARCHAR(255)   NOT NULL,
    "interactionType" VARCHAR(255)   NOT NULL,
    "timeStamp" DATE   NOT NULL,
    CONSTRAINT "pk_SalesData" PRIMARY KEY (
        "userID"
     )
);

ALTER TABLE "CustomerDetails" ADD CONSTRAINT "fk_CustomerDetails_CustomerID" FOREIGN KEY("CustomerID")
REFERENCES "SalesData" ("userID");

ALTER TABLE "SalesData" ADD CONSTRAINT "fk_SalesData_productID" FOREIGN KEY("productID")
REFERENCES "ProductDetails" ("UniqeID");

