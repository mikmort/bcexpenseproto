table 50103 "Expense Report Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Report Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Reports"."Report Id";
        }
        field(3; "Line Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Expense Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Categories"."Category Code";
        }
        field(6; "Subcategory Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Subcategories"."Subcategory Code";
        }
        field(7; "Currency Code"; Code[3])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(9; "Tax Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            BlankZero = true;
        }
        field(10; "Reimbursable Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(11; "Expense Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
        field(12; "Payment Method Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = PaymentMethods."Payment Method Code";
        }
        field(13; "Receipt Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Project Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            BlankZero = true;
        }
        field(16; "Customer Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            BlankZero = true;
            TableRelation = Customer."No.";
        }
        field(17; "Vendor Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            BlankZero = true;
            TableRelation = Vendor."No.";
        }
        field(18; Status; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Line Id")
        {
            Clustered = true;
        }
        key(LineNo; "Report Id", "Line Number")
        {
        }
    }
}
