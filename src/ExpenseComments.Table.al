table 50116 "Expense Comments"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Comment Id"; BigInteger)
        {
            Caption = 'Comment ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Report Id"; Code[30])
        {
            Caption = 'Report ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Reports"."Report Id";
        }
        field(3; "Line Id"; BigInteger)
        {
            Caption = 'Line ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(4; "Comment Text"; Text[1000])
        {
            Caption = 'Comment Text';
            DataClassification = ToBeClassified;
        }
        field(5; "Comment Date Time"; DateTime)
        {
            Caption = 'Comment Date Time';
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Comment Id")
        {
            Clustered = true;
        }
    }
}
