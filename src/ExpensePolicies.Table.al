table 50114 "Expense Policies"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Policy Id"; BigInteger)
        {
            Caption = 'Policy ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Expense Category Code"; Code[20])
        {
            Caption = 'Expense Category Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Categories"."Category Code";
        }
        field(3; "Expense Location Code"; Code[10])
        {
            Caption = 'Expense Location Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
        field(4; "Condition Expression"; Text[1000])
        {
            Caption = 'Condition Expression';
            DataClassification = ToBeClassified;
        }
        field(5; "Receipt Required"; Boolean)
        {
            Caption = 'Receipt Required';
            DataClassification = ToBeClassified;
        }
        field(6; "Daily Limit Amount"; Decimal)
        {
            Caption = 'Daily Limit Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            BlankZero = true;
        }
        field(7; "Effective From"; Date)
        {
            Caption = 'Effective From';
            DataClassification = ToBeClassified;
        }
        field(8; "Effective To"; Date)
        {
            Caption = 'Effective To';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Policy Id")
        {
            Clustered = true;
        }
    }
}
