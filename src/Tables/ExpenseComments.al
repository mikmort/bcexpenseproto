table 50116 "Expense Comments"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Comment Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Report Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Reports"."Report Id";
        }
        field(3; "Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(4; "Comment Text"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Comment Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Code[20])
        {
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
