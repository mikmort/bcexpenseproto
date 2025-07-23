table 50108 "Payment Methods"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Company Paid"; Boolean)
        {
            Caption = 'Company Paid';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Payment Method Code")
        {
            Clustered = true;
        }
    }
}
