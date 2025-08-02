table 50115 "Expense Posting Groups"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Posting Group Code"; Code[20])
        {
            Caption = 'Posting Group Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Refundable Debit Account"; Code[25])
        {
            Caption = 'Refundable Debit Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(3; "Non Refundable Debit Account"; Code[25])
        {
            Caption = 'Non Refundable Debit Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(4; "Prepayment Credit Account"; Code[25])
        {
            Caption = 'Prepayment Credit Account';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
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
