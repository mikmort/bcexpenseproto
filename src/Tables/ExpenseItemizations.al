table 50111 "Expense Itemizations"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Itemization Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(4; "Total Reimbursable Amount"; Decimal)
        {
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
