CREATE TABLE SalesData (
	userID INT PRIMARY KEY,
	productID VARCHAR(255),
	interactionType VARCHAR(255),
	timeStamp DATE
);

CREATE TABLE ProductDetails (
	UniqeID VARCHAR(255) PRIMARY KEY,
	productName VARCHAR(255),
	category VARCHAR(255), 
	ShippingWeight VARCHAR(100),   
	IsAmazonSeller VARCHAR(100)
);

CREATE TABLE CustomerDetails(
	CustomerID	INT PRIMARY KEY,
	Age INT,
	Gender	 VARCHAR(100),
	ItemPurchased	 VARCHAR(100),
	Category VARCHAR(100),	
	PurchaseAmount INT,	
	Location VARCHAR(100),	
	Size VARCHAR(50),
	Color	VARCHAR (100),
	Season	VARCHAR(100),
	ReviewRating	DECIMAL(2,2),
	SubscriptionStatus VARCHAR(50),	
	ShippingType	VARCHAR(50),
	DiscountApplied VARCHAR(50),
	PromoCodeUsed VARCHAR(50),
	PreviousPurchases INT,
	PaymentMethod VARCHAR(50),
	FrequencyofPurchases VARCHAR(50)
);
