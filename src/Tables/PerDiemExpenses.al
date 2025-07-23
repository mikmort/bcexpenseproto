table 50110 "Per Diem Expenses"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Per Diem Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Report Lines"."Line Id";
        }
        field(3; "Employee Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employees."Employee Id";
        }
        field(4; "Expense Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Expense Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Locations"."Location Code";
        }
        field(6; "Daily Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(7; "Itemized Amount"; Decimal)
        {
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
