table 50100 "Expense Management Setup"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Setup Id"; Integer)
        {
            Caption = 'Setup ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Expense Report No. Sequence"; Code[30])
        {
            Caption = 'Expense Report No. Sequence';
            DataClassification = ToBeClassified;
        }
        field(3; "Posted Expense Report No Seq."; Code[30])
        {
            Caption = 'Posted Expense Report No. Sequence';
            DataClassification = ToBeClassified;
        }
        field(4; "Enable Expense Agent"; Boolean)
        {
            Caption = 'Enable Expense Agent';
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
