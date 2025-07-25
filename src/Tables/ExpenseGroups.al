table 50106 "Expense Groups"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Expense Group Code"; Code[20])
        {
            Caption = 'Expense Group Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[255])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Expense Group Code")
        {
            Clustered = true;
        }
    }
}
