table 50107 "Expense Locations"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Country Region Code"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Location Code")
        {
            Clustered = true;
        }
    }
}
