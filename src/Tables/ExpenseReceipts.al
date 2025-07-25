table 50109 "Expense Receipts"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Receipt Id"; BigInteger)
        {
            Caption = 'Receipt ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            Caption = 'Line ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "File Name"; Text[255])
        {
            Caption = 'File Name';
            DataClassification = ToBeClassified;
        }
        field(4; "File Uri"; Text[500])
        {
            Caption = 'File Uri';
            DataClassification = ToBeClassified;
        }
        field(5; "Uploaded Date Time"; DateTime)
        {
            Caption = 'Uploaded Date Time';
            DataClassification = ToBeClassified;
        }
        field(6; "Amount On Receipt"; Decimal)
        {
            Caption = 'Amount On Receipt';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            BlankZero = true;
        }
        field(7; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            BlankZero = true;
            TableRelation = Currency.Code;
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
