table 50104 "Expense Categories"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Expense Group Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Groups"."Expense Group Code";
        }
        field(4; "Posting Group Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Posting Groups"."Posting Group Code";
        }
        field(5; Refundable; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Active; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = true;
        }
    }
    keys
    {
        key(PK; "Category Code")
        {
            Clustered = true;
        }
    }
}
