table 50114 "Expense Policies"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Policy Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Expense Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Categories"."Category Code";
        }
        field(3; "Expense Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
        field(4; "Condition Expression"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Receipt Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Daily Limit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            BlankZero = true;
        }
        field(7; "Effective From"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Effective To"; Date)
        {
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
