table 50112 "Expense Itemization Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Itemization Line Id"; BigInteger)
        {
            Caption = 'Itemization Line ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Itemization Id"; BigInteger)
        {
            Caption = 'Itemization ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Itemizations"."Itemization Id";
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = ToBeClassified;
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(6; Description; Text[255])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(7; "Expense Location Code"; Code[10])
        {
            Caption = 'Expense Location Code';
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
