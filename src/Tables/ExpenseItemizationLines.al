table 50112 "Expense Itemization Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Itemization Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Itemization Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Itemizations"."Itemization Id";
        }
        field(3; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(6; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Expense Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
    }
    keys
    {
        key(PK; "Itemization Line Id")
        {
            Clustered = true;
        }
    }
}
