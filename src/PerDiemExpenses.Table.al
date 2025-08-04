table 50110 "Per Diem Expenses"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Per Diem Id"; BigInteger)
        {
            Caption = 'Per Diem ID';
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            Caption = 'Line ID';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "Employee Id"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(4; "Expense Date"; Date)
        {
            Caption = 'Expense Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Expense Location Code"; Code[10])
        {
            Caption = 'Expense Location Code';
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
        field(6; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(7; "Itemized Amount"; Decimal)
        {
            Caption = 'Itemized Amount';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
    }
    keys
    {
        key(PK; "Per Diem Id")
        {
            Clustered = true;
        }
    }
}
