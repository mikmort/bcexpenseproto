table 50103 "Expense Report Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Line Id"; BigInteger)
        {
            Caption = 'Line ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Report Id"; Code[30])
        {
            Caption = 'Report ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Reports"."Report Id";
        }
        field(3; "Line Number"; Integer)
        {
            Caption = 'Line Number';
            DataClassification = ToBeClassified;
        }
        field(4; "Expense Date"; Date)
        {
            Caption = 'Expense Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Categories"."Category Code";
        }
        field(6; "Subcategory Code"; Code[20])
        {
            Caption = 'Subcategory Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Subcategories"."Subcategory Code";
        }
        field(7; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(9; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            BlankZero = true;
        }
        field(10; "Reimbursable Amount"; Decimal)
        {
            Caption = 'Reimbursable Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(11; "Expense Location Code"; Code[10])
        {
            Caption = 'Expense Location Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
        field(12; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Methods"."Payment Method Code";
        }
        field(13; "Receipt Required"; Boolean)
        {
            Caption = 'Receipt Required';
            DataClassification = ToBeClassified;
        }
        field(14; Description; Text[255])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(15; "Project Id"; Code[30])
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
        field(16; "Customer Account"; Code[30])
        {
            Caption = 'Customer Account';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(17; "Vendor Account"; Code[30])
        {
            Caption = 'Vendor Account';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(18; Status; Code[30])
        {
            Caption = 'Status';
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
