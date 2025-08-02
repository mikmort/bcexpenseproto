table 50113 "Expense Participants"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Participant Id"; BigInteger)
        {
            Caption = 'Participant ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            Caption = 'Line ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "Participant Name"; Text[255])
        {
            Caption = 'Participant Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Participant Type"; Code[30])
        {
            Caption = 'Participant Type';
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
