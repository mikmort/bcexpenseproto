table 50113 "Expense Participants"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Participant Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "Participant Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Participant Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Participant Id")
        {
            Clustered = true;
        }
    }
}
