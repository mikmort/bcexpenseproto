table 50108 "Payment Methods"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Payment Method Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Company Paid"; Boolean)
        {
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
