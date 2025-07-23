table 50109 "Expense Receipts"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Receipt Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "File Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "File Uri"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Uploaded Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Amount On Receipt"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            BlankZero = true;
        }
        field(7; "Currency Code"; Code[3])
        {
            DataClassification = ToBeClassified;
            BlankZero = true;
        }
    }
    keys
    {
        key(PK; "Receipt Id")
        {
            Clustered = true;
        }
    }
}
