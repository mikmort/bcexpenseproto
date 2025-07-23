table 50100 "Expense Management Setup"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Setup Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Expense Report No. Sequence"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Posted Expense Report No. Sequence"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Enable Expense Agent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Setup Id")
        {
            Clustered = true;
        }
    }
}
