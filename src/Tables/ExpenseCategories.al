table 50104 "Expense Categories"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[255])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Expense Group Code"; Code[20])
        {
            Caption = 'Expense Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Groups"."Expense Group Code";
        }
        field(4; "Posting Group Code"; Code[20])
        {
            Caption = 'Posting Group Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Posting Groups"."Posting Group Code";
        }
        field(5; Refundable; Boolean)
        {
            Caption = 'Refundable';
            DataClassification = ToBeClassified;
        }
        field(6; Active; Boolean)
        {
            Caption = 'Active';
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
