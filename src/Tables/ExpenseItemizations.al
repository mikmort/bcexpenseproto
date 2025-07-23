table 50111 "Expense Itemizations"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Itemization Id"; BigInteger)
        {
            Caption = 'Itemization ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            Caption = 'Line ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(4; "Total Reimbursable Amount"; Decimal)
        {
            Caption = 'Total Reimbursable Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
    }
    keys
    {
        key(PK; "Itemization Id")
        {
            Clustered = true;
        }
    }
}
