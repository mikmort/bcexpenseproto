table 50115 "Expense Posting Groups"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Posting Group Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Refundable Debit Account"; Code[25])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Non Refundable Debit Account"; Code[25])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Prepayment Credit Account"; Code[25])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Posting Group Code")
        {
            Clustered = true;
        }
    }
}
