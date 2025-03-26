-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/f65VKc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "ProductDetails" (
    "UniqeID" STRING   NOT NULL,
    "productName" STRING   NOT NULL,
    "category" STRING   NOT NULL,
    "ShippingWeight" STRING   NOT NULL,
    "IsAmazonSeller" STRING   NOT NULL,
    CONSTRAINT "pk_ProductDetails" PRIMARY KEY (
        "UniqeID"
     )
);

CREATE TABLE "CustomerDetails" (
    "CustomerID" INT   NOT NULL,
    "Age" INT   NOT NULL,
    "Gender" string   NOT NULL,
    "ItemPurchased" string   NOT NULL,
    "Category" STRING   NOT NULL,
    "PurchaseAmount" INT   NOT NULL,
    "Location" STRING   NOT NULL,
    "Size" STRING   NOT NULL,
    "Color" string   NOT NULL,
    "Season" string   NOT NULL,
    "ReviewRating" numeric(2,2)   NOT NULL,
    "SubscriptionStatus" STRING   NOT NULL,
    "ShippingType" string   NOT NULL,
    "DiscountApplied" STRING   NOT NULL,
    "PromoCodeUsed" STRING   NOT NULL,
    "PreviousPurchases" INT   NOT NULL,
    "PaymentMethod" STRING   NOT NULL,
    "FrequencyofPurchases" STRING   NOT NULL
);

CREATE TABLE "SalesData" (
    "userID" INT   NOT NULL,
    "productID" STRING   NOT NULL,
    "interactionType" STRING   NOT NULL,
    "timeStamp" DATE   NOT NULL,
    CONSTRAINT "pk_SalesData" PRIMARY KEY (
        "userID"
     )
);

ALTER TABLE "CustomerDetails" ADD CONSTRAINT "fk_CustomerDetails_CustomerID" FOREIGN KEY("CustomerID")
REFERENCES "SalesData" ("userID");

ALTER TABLE "SalesData" ADD CONSTRAINT "fk_SalesData_productID" FOREIGN KEY("productID")
REFERENCES "ProductDetails" ("UniqeID");

